//
//  SocketManager.swift
//  GoChat
//
//  Created by Daniil on 21.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

import Foundation

import SocketIO

// MARK: Delegate Methods Definition

/// Socket lifecycle events.
protocol SocketConnectionEvents: class {
    func socketDidConnect(_ socket: SocketManager?)
    func socketDidDisconnect(_ socket: SocketManager?)
}

/// Socket room events.
protocol SocketRoomEvents: class {
    func socket(_ socket: SocketManager?, didJoinRoom room: String, withData data: [String : Any]?)
    func socket(_ socket: SocketManager?, didLeaveRoom room: String)
    func socket(_ socket: SocketManager?, didUpdateParticipantsWithData data: [String : Any]?)
    func socket(_ socket: SocketManager?, didReceiveForceLogoutWithInfo info: [String : Any]?)
}

/// Socket stream events.
protocol SocketStreamEvents: class {
    func socket(_ socket: SocketManager?, didReceiveCandidateData data: [String : Any]?)
    func socket(_ socket: SocketManager?, didReceiveSessionDescriptionData data: [String : Any]?, streamLabel: String)
    func socket(_ socket: SocketManager?, didReceivePublishedStream stream: [String : Any]?)
    func socket(_ socket: SocketManager?, didReceiveStreamInfo info: [String : Any]?)
    func socket(_ socket: SocketManager?, didReceiveVideoEnabledWithInfo info: [String : Any]?)
    func socket(_ socket: SocketManager?, didReceiveVideoDisabledWithInfo info: [String : Any]?)
    func socket(_ socket: SocketManager?, didStopStreamWithInfo info: [String : Any]?)
}

// MARK: Public Methods Definition

private protocol PublicMethods {
    func joinRoom(withIdentifier roomIdentifier: String, userIdentifier: String)
    func leaveRoom(withIdentifier roomIdentifier: String, userIdentifier: String)
    
    func sendStreamingSessionDescription(_ sessionDescription: String, videoEnabled: Bool, streamLabel: String, roomIdentifier: String, userIdentifier: String)
    func sendWatchingSessionDescription(_ sessionDescription: String, streamLabel: String, roomIdentifier: String, userIdentifier: String)
    func sendStreamCandidate(_ candidate: [String : Any], streamLabel: String, roomIdentifier: String, userIdentifier: String)
    func sendStreamingVideoTrackEnabled(_ enabled: Bool, roomIdentifier: String, userIdentifier: String)
    func stopStream(withRoomIdentifier roomIdentifier: String, userIdentifier: String)
    func streamInfo(withRoomIdentifier roomIdentifier: String, userIdentifier: String)
}

// MARK: Class Definition

class SocketManager {
    
    private struct Keys {
        static let userIdentifier = "uuid"
        static let roomIdentifier = "roomId"
        static let offerSessionDescription = "offerSdp"
        static let videoEnabled = "isVideoEnabled"
        static let streamLabel = "label"
        static let candidate = "candidate"
    }
    
    private struct Events {
        struct Send {
            struct Room {
                static let join = "room:join"
                static let leave = "room:leave"
            }
            
            struct Stream {
                static let publish = "stream:publish"
                static let view = "stream:play"
                static let stop = "stream:stop"
                static let info = "stream:info"
                static let candidate = "stream:candidate"
                static let enableVideo = "stream:video:enable"
                static let disableVideo = "stream:video:disable"
            }
        }
        
        struct Receive {
            struct Room {
                static let userList = "room:userList"
                static let logout = "room:forceLogout"
            }
            
            struct Stream {
                static let candidate = "stream:candidate"
                static let published = "stream:published"
                static let videoEnabled = "stream:video:enabled"
                static let videoDisabled = "stream:video:disabled"
            }
        }
    }
    
    // MARK: Private Properties
    
    private let schemeConstantsService = SchemeConstantsService()
    
    private var socketManager: SocketIO.SocketManager!
    
    private weak var connectionDelegate: SocketConnectionEvents?
    private weak var roomDelegate: SocketRoomEvents?
    private weak var streamDelegate: SocketStreamEvents?
    
    private var roomIdentifier: String?
    
    // MARK: Init Methods & Superclass Overriders
    
    /// Creates socket manager and connects to the server.
    ///
    /// - parameter: Session server ID.
    ///
    init(connectionDelegate: SocketConnectionEvents?, roomDelegate: SocketRoomEvents?, streamDelegate: SocketStreamEvents?) {
        self.connectionDelegate = connectionDelegate
        self.roomDelegate = roomDelegate
        self.streamDelegate = streamDelegate

        self.connectToSocket()
    }
    
    deinit {
        self.socketManager.defaultSocket.disconnect()
    }
    
}

// MARK: Public Methods

extension SocketManager: PublicMethods {
    /// Joins room.
    ///
    /// - Parameters:
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func joinRoom(withIdentifier roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier]
        let event = Events.Send.Room.join
        
        self.sendEvent(withName: event, parameters: parameters) { [weak self] (data) in
            let response = self?.socketResponse(fromData: data)
            self?.roomDelegate?.socket(self, didJoinRoom: roomIdentifier, withData: response)
        }
    }
    
    /// Leaves room.
    ///
    /// - Parameters:
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func leaveRoom(withIdentifier roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier]
        let event = Events.Send.Room.leave
        
        self.sendEvent(withName: event, parameters: parameters) { [weak self] (data) in
            self?.roomDelegate?.socket(self, didLeaveRoom: roomIdentifier)
        }
    }
    
    /// Sends webRTC publishing offer.
    ///
    /// - Parameters:
    ///   - sessionDescription: webRTC offer sdp.
    ///   - videoEnabled: Video track isEnabled value.
    ///   - streamLabel: Participant stream label.
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func sendStreamingSessionDescription(_ sessionDescription: String, videoEnabled: Bool, streamLabel: String, roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier,
                                          Keys.streamLabel : streamLabel,
                                          Keys.offerSessionDescription: sessionDescription,
                                          Keys.videoEnabled : (videoEnabled ? "1" : "0")]
        let event = Events.Send.Stream.publish
        
        self.sendEvent(withName: event, parameters: parameters) { [weak self] (data) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didReceiveSessionDescriptionData: response, streamLabel: streamLabel)
        }
    }
    
    /// Sends webRTC viewing offer.
    ///
    /// - Parameters:
    ///   - sessionDescription: webRTC offer sdp.
    ///   - streamLabel: Participant stream label.
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func sendWatchingSessionDescription(_ sessionDescription: String, streamLabel: String, roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier,
                                          Keys.offerSessionDescription: sessionDescription,
                                          Keys.streamLabel: streamLabel]
        let event = Events.Send.Stream.view
        
        self.sendEvent(withName: event, parameters: parameters) { [weak self] (data) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didReceiveSessionDescriptionData: response, streamLabel: streamLabel)
        }
    }
    
    /// Sends webRTC candidate.
    ///
    /// - Parameters:
    ///   - candidate: webRTC candidate.
    ///   - streamLabel: Participant stream label.
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func sendStreamCandidate(_ candidate: [String : Any], streamLabel: String, roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier,
                                          Keys.streamLabel : streamLabel,
                                          Keys.candidate: candidate]
        let event = Events.Send.Stream.candidate
        
        self.sendEvent(withName: event, parameters: parameters) { (data) in
            // nothing to do
        }
    }
    
    /// Sends video track state.
    ///
    /// - Parameters:
    ///   - enabled: Video track isEnabled value.
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func sendStreamingVideoTrackEnabled(_ enabled: Bool, roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier]
        let event = (enabled ? Events.Send.Stream.enableVideo : Events.Send.Stream.disableVideo)
        
        self.sendEvent(withName: event, parameters: parameters) { (data) in
            // nothing to do
        }
    }
    
    /// Stops stream.
    ///
    /// - Parameters:
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func stopStream(withRoomIdentifier roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier]
        let event = Events.Send.Stream.stop
        
        self.sendEvent(withName: event, parameters: parameters) { [weak self] (data) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didStopStreamWithInfo: response)
        }
    }
    
    /// Requests stream info.
    ///
    /// - Parameters:
    ///   - roomIdentifier: Room identifier.
    ///   - userIdentifier: User identifier.
    func streamInfo(withRoomIdentifier roomIdentifier: String, userIdentifier: String) {
        let parameters: [String : Any] = [Keys.userIdentifier : userIdentifier,
                                          Keys.roomIdentifier : roomIdentifier]
        let event = Events.Send.Stream.info
        
        self.sendEvent(withName: event, parameters: parameters) { [weak self] (data) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didReceiveStreamInfo: response)
        }
    }
}

// MARK: Start Configuration

private extension SocketManager {
    func connectToSocket() {
        let socketServerURL = self.socketServerURL()
        let socketConfiguration = self.socketConfiguration()
        
        self.socketManager = SocketIO.SocketManager(socketURL: socketServerURL, config: socketConfiguration)
        
        self.addLifecycleSocketEvents()
        self.addCustomSocketEvents()
        
        self.socketManager.defaultSocket.connect()
    }
}

// MARK: Subscribe To Events

private extension SocketManager {
    func addLifecycleSocketEvents() {
        self.socketManager.defaultSocket.on(clientEvent: .connect) { [weak self] (data, ack) in
            self?.connectionDelegate?.socketDidConnect(self)
        }
        
        self.socketManager.defaultSocket.on(clientEvent: .reconnect) { [weak self] (data, ack) in
            self?.connectionDelegate?.socketDidDisconnect(self)
        }
        
        self.socketManager.defaultSocket.on(clientEvent: .disconnect) { [weak self] (data, ack) in
            self?.connectionDelegate?.socketDidDisconnect(self)
        }
    }
    
    func addCustomSocketEvents() {
        self.socketManager.defaultSocket.on(Events.Receive.Room.userList) { [weak self] (data, ack) in
            let response = self?.socketResponse(fromData: data)
            self?.roomDelegate?.socket(self, didUpdateParticipantsWithData: response)
        }
        
        self.socketManager.defaultSocket.on(Events.Receive.Room.logout) { [weak self] (data, ack) in
            let response = self?.socketResponse(fromData: data)
            self?.roomDelegate?.socket(self, didReceiveForceLogoutWithInfo: response)
        }
        
        self.socketManager.defaultSocket.on(Events.Receive.Stream.candidate) { [weak self] (data, ack) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didReceiveCandidateData: response)
        }
        
        self.socketManager.defaultSocket.on(Events.Receive.Stream.published) { [weak self] (data, ack) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didReceivePublishedStream: response)
        }
        
        self.socketManager.defaultSocket.on(Events.Receive.Stream.videoEnabled) { [weak self] (data, ack) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didReceiveVideoEnabledWithInfo: response)
        }
        
        self.socketManager.defaultSocket.on(Events.Receive.Stream.videoDisabled) { [weak self] (data, ack) in
            let response = self?.socketResponse(fromData: data)
            self?.streamDelegate?.socket(self, didReceiveVideoDisabledWithInfo: response)
        }
        
        self.socketManager.defaultSocket.onAny { (event) in
            #if DEBUG
                print("\(Date()) socket RECEIVE \(event.event) with \(event.items ?? [])")
            #endif
        }
    }
}

// MARK: Send Events

private extension SocketManager {
    func sendEvent(withName name: String, parameters: [String : Any]) {
        self.sendEvent(withName: name, parameters: parameters, completion: nil)
    }
    
    func sendEvent(withName name: String, parameters: [String : Any], completion: AckCallback?) {
        #if DEBUG
            print("\(Date()) socket EMIT \(name) with \(parameters)")
        #endif
        
        if let callback = completion {
            self.socketManager.defaultSocket.emitWithAck(name, parameters).timingOut(after: 30.0, callback: { (data) in
                #if DEBUG
                    print("\(Date()) socket CALLBACK \(name) with \(data)")
                #endif
                
                callback(data)
            })
        } else {
            self.socketManager.defaultSocket.emit(name, parameters)
        }
    }
}

// MARK: Support Methods

private extension SocketManager {
    func socketServerURL() -> URL {
        if let socketServerAddress = self.schemeConstantsService.socketServerAddress()?.replacingOccurrences(of: "https://", with: "http://"), let socketServerURL = URL(string: socketServerAddress) {
            return socketServerURL
        }
        
        fatalError("socket server url cannot be nil")
    }
    
    func socketConfiguration() -> SocketIOClientConfiguration {
        var configuration = SocketIOClientConfiguration()
        configuration.insert(SocketIOClientOption.reconnects(true))
        configuration.insert(SocketIOClientOption.reconnectAttempts(-1))
        configuration.insert(SocketIOClientOption.log(false))
        return configuration
    }
    
    func socketResponse(fromData data: [Any]) -> [String : Any]? {
        if let status = data[0] as? String, status == SocketAckStatus.noAck.rawValue {
            return nil
        } else {
            if let error = (data.count >= 1 ? data[0] as? [String : Any] : nil) {
                return error
            }
            
            if let response = (data.count >= 2 ? data[1] as? [String : Any] : nil) {
                return response
            }
        }
        
        return nil
    }
}
