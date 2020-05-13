//
//  RoomService.swift
//  GoChat
//
//  Created by Daniil on 26.12.2017.
//  Copyright © 2017 ForaSoft. All rights reserved.
//

#if os(OSX)
    import Cocoa
#endif

// MARK: Delegate Methods Definition

/// Socket lifecycle events.
protocol RoomServiceDelegate: class {
    func room(_ room: RoomService?, didChangeState state: RoomService.RoomState)
    func room(_ room: RoomService?, didChangeParticipantsList list: [ParticipantModel])

    #if os(OSX)
    func room(_ room: RoomService?, didChangeVideoView videoView: NSView?, forUserIdentifier userIdentifier: String)
    #else
    func room(_ room: RoomService?, didChangeVideoView videoView: UIView?, forUserIdentifier userIdentifier: String)
    #endif
}

// MARK: Public Methods Definition

private protocol PublicMethods {
    func roomState() -> RoomService.RoomState

    #if os(OSX)
    func videoView(forUserIdentifier identifier: String) -> NSView?
    #else
    func videoView(forUserIdentifier identifier: String) -> UIView?
    #endif
}

// MARK: Class Definition

/// Connects to the room, process room state and user's list.
class RoomService {
    
    enum RoomState {
        case unknown
        case connecting
        case connected
        case disconnected
        case failed(error: String)
    }
    
    private struct Keys {
        static let error = "error"
        static let room = "room"
        static let participants = "participants"
        static let userList = "userList"
        static let iceServers = "iceServers"
        static let label = "label"
        static let candidate = "candidate"
    }
    
    // MARK: Private Properties
    
    private var socketManager: SocketManager!
    private var streamingManagerForUserIdentifier: [String : StreamingManager] = [:]
    
    private var roomIdentifier: String!
    private var userIdentifier: String!
    private var iceServersModel: IceServersModel?
    private var participantsIdentifiers: Set<String> = Set()
    
    #if os(OSX)
    private var videoViewForUserIdentifier: [String : NSView] = [:]
    #else
    private var videoViewForUserIdentifier: [String : UIView] = [:]
    #endif
    
    private var state = RoomState.unknown
    
    private weak var delegate: RoomServiceDelegate?
    
    // MARK: Init Methods & Superclass Overriders
    
    init(withRoomIdentifier roomIdentifier: String, userIdentifier: String, delegate: RoomServiceDelegate?) {
        self.roomIdentifier = roomIdentifier
        self.userIdentifier = userIdentifier
        self.delegate = delegate
        
        self.changeRoomState(.connecting)
        self.socketManager = SocketManager(connectionDelegate: self, roomDelegate: self, streamDelegate: self)
        
        self.startCameraStream()
    }
    
    deinit {
        self.stopStreamingAndWatching()
        self.changeParticipantsList([])
        self.changeRoomState(.disconnected)
        self.socketManager.leaveRoom(withIdentifier: self.roomIdentifier, userIdentifier: self.userIdentifier)
    }
    
}

// MARK: Public Methods

extension RoomService: PublicMethods {
    /// Returns current room state.
    func roomState() -> RoomService.RoomState {
        return self.state
    }

    func getRoomIdentifier() -> String! {
        return roomIdentifier
    }

    #if os(OSX)
    /// Searches for video view.
    ///
    /// - Parameter identifier: Participant identifier.
    /// - Returns: Video view.
    func videoView(forUserIdentifier identifier: String) -> NSView? {
        return self.remoteStreamVideoView(forUserIdentifier: identifier) as? NSView
    }
    #else
    /// Searches for video view.
    ///
    /// - Parameter identifier: Participant identifier.
    /// - Returns: Video view.
    func videoView(forUserIdentifier identifier: String) -> UIView? {
        return self.remoteStreamVideoView(forUserIdentifier: identifier) as? UIView
    }
    #endif
}

// MARK: Start/Stop Streaming and Watching

private extension RoomService {
    func startCameraStream() {
        Threader.performOnMainThread { [weak self] in
            guard let identifier = self?.userIdentifier else {
                return
            }
            
            var streamingManager = self?.streamingManagerForUserIdentifier[identifier]
            if streamingManager == nil {
                streamingManager = StreamingManager(withUserIdentifier: identifier, videoDelegate: self, connectionDelegate: self)
                self?.streamingManagerForUserIdentifier[identifier] = streamingManager
            }
            
            streamingManager?.startCameraStream()
        }
    }
    
    func startStreaming() {
        Threader.performOnMainThread { [weak self] in
            guard let identifier = self?.userIdentifier else {
                return
            }
            
            let streamingManager = self?.streamingManagerForUserIdentifier[identifier]
            streamingManager?.startStreaming(withServersModel: self?.iceServersModel)
            
            #if DEBUG
                print("\(Date()) room start streaming \(identifier) with \(String(describing: streamingManager))")
            #endif
        }
    }
    
    func startWatching(withStreamLabel label: String) {
        Threader.performOnMainThread { [weak self] in
            if let participantsIdentifiers = self?.participantsIdentifiers, participantsIdentifiers.contains(label) {
                var streamingManager = self?.streamingManagerForUserIdentifier[label]
                if streamingManager == nil {
                    streamingManager = StreamingManager(withUserIdentifier: label, videoDelegate: self, connectionDelegate: self)
                    self?.streamingManagerForUserIdentifier[label] = streamingManager
                }
                
                streamingManager?.startWatching(withServersModel: self?.iceServersModel)
                
                #if DEBUG
                    print("\(Date()) room start watching \(label) with \(String(describing: streamingManager))")
                #endif
            } else {
                self?.stopWatching(withStreamLabel: label)
            }
        }
    }
    
    func stopWatching(withStreamLabel label: String) {
        Threader.performOnMainThread { [weak self] in
            guard let streamingManager = self?.streamingManagerForUserIdentifier[label] else {
                return
            }
            
            streamingManager.stopStreamingAndWatching()
            
            if self?.streamingManagerForUserIdentifier[label] != nil {
                self?.streamingManagerForUserIdentifier.removeValue(forKey: label)
            }
            
            if self?.videoViewForUserIdentifier[label] != nil {
                self?.videoViewForUserIdentifier.removeValue(forKey: label)
            }
            
            #if DEBUG
                print("\(Date()) room stop watching \(label) with \(streamingManager)")
            #endif
        }
    }
    
    func stopStreamingAndWatching() {
        Threader.performOnMainThread { [weak self] in
            var videoViewsIdentifiers: [String] = []
            if let keys = self?.videoViewForUserIdentifier.keys, keys.count > 0 {
                videoViewsIdentifiers = Array(keys)
            }
            
            var streamingManagersIdentifiers: [String] = []
            if let keys = self?.streamingManagerForUserIdentifier.keys, keys.count > 0 {
                streamingManagersIdentifiers = Array(keys)
            }
            
            var streamingManagers: [StreamingManager] = []
            if let values = self?.streamingManagerForUserIdentifier.values, values.count > 0 {
                streamingManagers = Array(values)
            }
            
            for streamingManager in streamingManagers {
                streamingManager.stopStreamingAndWatching()
            }
            
            if let userIdentifier = self?.userIdentifier {
                for identifier in streamingManagersIdentifiers {
                    if identifier != userIdentifier {
                        self?.streamingManagerForUserIdentifier.removeValue(forKey: identifier)
                    }
                }
                
                for identifier in videoViewsIdentifiers {
                    if identifier != userIdentifier {
                        self?.videoViewForUserIdentifier.removeValue(forKey: identifier)
                    }
                }
            }
        }
    }
    
    func streamAddSessionDescription(_ sessionDescription: [String : Any]?, withStreamLabel label: String) {
        Threader.performOnMainThread { [weak self] in
            let streamingManager = self?.streamingManagerForUserIdentifier[label]
            streamingManager?.add(sessionDescriptionFrom: sessionDescription)
        }
    }
    
    func streamAddCandidate(_ candidate: [String : Any], withStreamLabel label: String) {
        Threader.performOnMainThread { [weak self] in
            let streamingManager = self?.streamingManagerForUserIdentifier[label]
            streamingManager?.add(candidateFrom: candidate)
        }
    }
    
}

// MARK: Support Methods

private extension RoomService {
    func remoteStreamVideoView(forUserIdentifier identifier: String) -> Any? {
        if identifier == self.userIdentifier {
            let videoView = self.videoViewForUserIdentifier[identifier]
            return videoView
        }
        
        if let streamingManager = self.streamingManagerForUserIdentifier[self.userIdentifier], streamingManager.connectionState() == .completed || streamingManager.connectionState() == .connected {
            let videoView = self.videoViewForUserIdentifier[identifier]
            return videoView
        }
        
        return nil
    }
    
    func changeRoomState(_ state: RoomState) {
        Threader.performOnMainThread { [weak self] in
            self?.state = state
            self?.delegate?.room(self, didChangeState: state)
        }
    }
    
    func changeIceServers(_ servers: IceServersModel?) {
        Threader.performOnMainThread { [weak self] in
            self?.iceServersModel = servers
        }
    }
    
    func changeParticipantsList(_ participantsList: [ParticipantModel]) {
        Threader.performOnMainThread { [weak self] in
            var updatedParticipantsIdentifiers: Set<String> = Set()
            for participant in participantsList {
                updatedParticipantsIdentifiers.insert(participant.identifier)
            }
            
            if let outdatedIdentifiers = self?.participantsIdentifiers.subtracting(updatedParticipantsIdentifiers) {
                for outdatedIdentifier in Array(outdatedIdentifiers) {
                    self?.stopWatching(withStreamLabel: outdatedIdentifier)
                }
            }
            
            self?.participantsIdentifiers = updatedParticipantsIdentifiers
            self?.delegate?.room(self, didChangeParticipantsList: participantsList)
        }
    }
    
    func errorMessage(fromData data: [String : Any]?) -> String? {
        if let response = data {
            if let error = response[Keys.error] as? String  {
                return error
            }
        } else {
            return AppMessage.ErrorMessages.connectionProblems.rawValue
        }
        
        return nil
    }
}

// MARK: StreamingVideoEvents

extension RoomService: StreamingVideoEvents {
    func stream(_ stream: StreamingManager?, shouldRemoveVideoViewForUserIdentifier identifier: String) {
        self.videoViewForUserIdentifier.removeValue(forKey: identifier)
        self.delegate?.room(self, didChangeVideoView: nil, forUserIdentifier: identifier)
    }
    
    func stream(_ stream: StreamingManager?, shouldShowVideoView view: AnyObject?, forUserIdentifier identifier: String, connectionState: RTCIceConnectionState) {
        #if os(OSX)
            let videoView = (view as? NSView)
        #else
            let videoView = (view as? UIView)
        #endif
        
        self.videoViewForUserIdentifier[identifier] = videoView
        
        if identifier == self.userIdentifier || connectionState == .completed || connectionState == .connected {
            self.delegate?.room(self, didChangeVideoView: videoView, forUserIdentifier: identifier)
        } else {
            self.delegate?.room(self, didChangeVideoView: nil, forUserIdentifier: identifier)
        }
    }
}

// MARK: StreamingConnectionEvents

extension RoomService: StreamingConnectionEvents {
    func stream(_ stream: StreamingManager?, shouldSendSessionDescription sessionDescription: String, forUserIdentifier identifier: String) {
        if identifier == self.userIdentifier {
            self.socketManager.sendStreamingSessionDescription(sessionDescription, videoEnabled: true, streamLabel: identifier, roomIdentifier: self.roomIdentifier, userIdentifier: self.userIdentifier)
        } else {
            self.socketManager.sendWatchingSessionDescription(sessionDescription, streamLabel: identifier, roomIdentifier: self.roomIdentifier, userIdentifier: self.userIdentifier)
        }
    }
    
    func stream(_ stream: StreamingManager?, shouldSendCandidate candidate: [String : Any], forUserIdentifier identifier: String) {
        self.socketManager.sendStreamCandidate(candidate, streamLabel: identifier, roomIdentifier: self.roomIdentifier, userIdentifier: self.userIdentifier)
    }
    
    func stream(_ stream: StreamingManager?, didChangeConnectionState state: RTCIceConnectionState, forUserIdentifier identifier: String) {
        if identifier == self.userIdentifier {
            return
        }
        
        if state == .completed || state == .connected {
            let videoView = self.videoViewForUserIdentifier[identifier]
            self.delegate?.room(self, didChangeVideoView: videoView, forUserIdentifier: identifier)
        } else {
            self.delegate?.room(self, didChangeVideoView: nil, forUserIdentifier: identifier)
        }
    }
}

// MARK: SocketConnectionEvents

extension RoomService: SocketConnectionEvents {
    func socketDidConnect(_ socket: SocketManager?) {
        self.changeRoomState(.connecting)
        self.socketManager.joinRoom(withIdentifier: self.roomIdentifier, userIdentifier: self.userIdentifier)
    }
    
    func socketDidDisconnect(_ socket: SocketManager?) {
        self.stopStreamingAndWatching()
        self.changeParticipantsList([])
        self.changeRoomState(.connecting)
    }
}

// MARK: SocketRoomEvents

extension RoomService: SocketRoomEvents {
    func socket(_ socket: SocketManager?, didJoinRoom room: String, withData data: [String : Any]?) {
        if let error = self.errorMessage(fromData: data) {
            self.changeRoomState(.failed(error: error))
        } else {
            var iceServersModel: IceServersModel?
            if let iceServers = data?[Keys.iceServers] as? [String : Any] {
                iceServersModel = IceServersModel.servers(withData: iceServers)
            }
            
            var userList: [ParticipantModel] = []
            if let room = data?[Keys.room] as? [String : Any], let users = room[Keys.participants] as? [String] {
                for user in users {
                    if let participant = ParticipantModel.participant(withData: user), participant.identifier != self.userIdentifier {
                        userList.append(participant)
                    }
                }
            }
            
            self.changeIceServers(iceServersModel)
            self.changeParticipantsList(userList)
            self.changeRoomState(.connected)
            self.socketManager.stopStream(withRoomIdentifier: self.roomIdentifier, userIdentifier: self.userIdentifier)
        }
    }
    
    func socket(_ socket: SocketManager?, didLeaveRoom room: String) {
        self.changeRoomState(.disconnected)
    }
    
    func socket(_ socket: SocketManager?, didUpdateParticipantsWithData data: [String : Any]?) {
        var userList: [ParticipantModel] = []
        if let users = data?[Keys.userList] as? [String] {
            for user in users {
                if let participant = ParticipantModel.participant(withData: user), participant.identifier != self.userIdentifier {
                    userList.append(participant)
                }
            }
        }
        
        self.changeParticipantsList(userList)
    }
    
    func socket(_ socket: SocketManager?, didReceiveForceLogoutWithInfo info: [String : Any]?) {
        self.stopStreamingAndWatching()
        self.changeParticipantsList([])
        self.changeRoomState(.failed(error: AppMessage.InfoMessages.forceLogout.rawValue))
    }
}

// MARK: SocketStreamEvents

extension RoomService: SocketStreamEvents {
    func socket(_ socket: SocketManager?, didReceiveCandidateData data: [String : Any]?) {
        if self.errorMessage(fromData: data) != nil {
            return
        }
        
        if let streamLabel = data?[Keys.label] as? String, let candidate = data?[Keys.candidate] as? [String : Any] {
            self.streamAddCandidate(candidate, withStreamLabel: streamLabel)
        }
    }
    
    func socket(_ socket: SocketManager?, didReceiveSessionDescriptionData data: [String : Any]?, streamLabel: String) {
        if self.errorMessage(fromData: data) != nil {
            return
        }
        
        self.streamAddSessionDescription(data, withStreamLabel: streamLabel)
    }
    
    func socket(_ socket: SocketManager?, didReceivePublishedStream stream: [String : Any]?) {
        guard let streamLabel = stream?[Keys.label] as? String else {
            return
        }
        
        if streamLabel != self.userIdentifier {
            self.startWatching(withStreamLabel: streamLabel)
        }
    }
    
    func socket(_ socket: SocketManager?, didReceiveStreamInfo info: [String : Any]?) {
        if let error = self.errorMessage(fromData: info) {
            self.changeRoomState(.failed(error: error))
        } else {
            self.startStreaming()
            
            if let values = info?.values, let streams = Array(values) as? [[String : Any]] {
                for stream in streams {
                    guard let streamLabel = stream[Keys.label] as? String, streamLabel != self.userIdentifier else {
                        continue
                    }
                    
                    self.startWatching(withStreamLabel: streamLabel)
                }
            }
        }
    }
    
    func socket(_ socket: SocketManager?, didReceiveVideoEnabledWithInfo info: [String : Any]?) {
        
    }
    
    func socket(_ socket: SocketManager?, didReceiveVideoDisabledWithInfo info: [String : Any]?) {
        
    }
    
    func socket(_ socket: SocketManager?, didStopStreamWithInfo info: [String : Any]?) {
        if let error = self.errorMessage(fromData: info) {
            self.changeRoomState(.failed(error: error))
        } else {
            self.stopStreamingAndWatching()
            self.socketManager.streamInfo(withRoomIdentifier: self.roomIdentifier, userIdentifier: self.userIdentifier)
        }
    }
}
