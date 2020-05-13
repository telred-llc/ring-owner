//  This file was automatically generated and should not be edited.

import AWSAppSync
import SwiftUI

public struct CreateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil) {
    graphQLMap = ["id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: String? {
    get {
      return graphQLMap["username"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var registered: Bool? {
    get {
      return graphQLMap["registered"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "registered")
    }
  }

  public var deviceToken: String? {
    get {
      return graphQLMap["deviceToken"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceToken")
    }
  }

  public var awsSnsEnpointArn: String? {
    get {
      return graphQLMap["awsSNSEnpointARN"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "awsSNSEnpointARN")
    }
  }

  public var cameras: [String]? {
    get {
      return graphQLMap["cameras"] as! [String]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameras")
    }
  }
}

public struct UpdateUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil) {
    graphQLMap = ["id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: String? {
    get {
      return graphQLMap["username"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var registered: Bool? {
    get {
      return graphQLMap["registered"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "registered")
    }
  }

  public var deviceToken: String? {
    get {
      return graphQLMap["deviceToken"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceToken")
    }
  }

  public var awsSnsEnpointArn: String? {
    get {
      return graphQLMap["awsSNSEnpointARN"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "awsSNSEnpointARN")
    }
  }

  public var cameras: [String]? {
    get {
      return graphQLMap["cameras"] as! [String]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameras")
    }
  }
}

public struct DeleteUserInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateCameraInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, name: String? = nil, channel: String? = nil) {
    graphQLMap = ["id": id, "name": name, "channel": channel]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var channel: String? {
    get {
      return graphQLMap["channel"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "channel")
    }
  }
}

public struct UpdateCameraInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
    graphQLMap = ["id": id, "name": name, "channel": channel]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var channel: String? {
    get {
      return graphQLMap["channel"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "channel")
    }
  }
}

public struct DeleteCameraInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateRequestStreamingInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
    graphQLMap = ["id": id, "cameraId": cameraId, "userId": userId, "time": time]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var cameraId: GraphQLID? {
    get {
      return graphQLMap["cameraId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameraId")
    }
  }

  public var userId: GraphQLID? {
    get {
      return graphQLMap["userId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var time: String? {
    get {
      return graphQLMap["time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }
}

public struct UpdateRequestStreamingInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
    graphQLMap = ["id": id, "cameraId": cameraId, "userId": userId, "time": time]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var cameraId: GraphQLID? {
    get {
      return graphQLMap["cameraId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameraId")
    }
  }

  public var userId: GraphQLID? {
    get {
      return graphQLMap["userId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var time: String? {
    get {
      return graphQLMap["time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }
}

public struct DeleteRequestStreamingInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateDetectMotionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
    graphQLMap = ["cameraId": cameraId, "time": time, "persons": persons, "objects": objects]
  }

  public var cameraId: GraphQLID {
    get {
      return graphQLMap["cameraId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameraId")
    }
  }

  public var time: String? {
    get {
      return graphQLMap["time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }

  public var persons: [String?]? {
    get {
      return graphQLMap["persons"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "persons")
    }
  }

  public var objects: [String?]? {
    get {
      return graphQLMap["objects"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "objects")
    }
  }
}

public struct UpdateDetectMotionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(cameraId: GraphQLID? = nil, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
    graphQLMap = ["cameraId": cameraId, "time": time, "persons": persons, "objects": objects]
  }

  public var cameraId: GraphQLID? {
    get {
      return graphQLMap["cameraId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameraId")
    }
  }

  public var time: String? {
    get {
      return graphQLMap["time"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }

  public var persons: [String?]? {
    get {
      return graphQLMap["persons"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "persons")
    }
  }

  public var objects: [String?]? {
    get {
      return graphQLMap["objects"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "objects")
    }
  }
}

public struct DeleteDetectMotionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateGuestCollectionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, name: String) {
    graphQLMap = ["id": id, "name": name]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }
}

public struct UpdateGuestCollectionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, name: String? = nil) {
    graphQLMap = ["id": id, "name": name]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }
}

public struct DeleteGuestCollectionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateGuestInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil, userGuestsId: GraphQLID? = nil, guestCollectionGuestsId: GraphQLID? = nil) {
    graphQLMap = ["id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos, "userGuestsId": userGuestsId, "guestCollectionGuestsId": guestCollectionGuestsId]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var recognitionId: String? {
    get {
      return graphQLMap["recognitionId"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recognitionId")
    }
  }

  public var facePhotos: [String]? {
    get {
      return graphQLMap["facePhotos"] as! [String]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "facePhotos")
    }
  }

  public var userGuestsId: GraphQLID? {
    get {
      return graphQLMap["userGuestsId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userGuestsId")
    }
  }

  public var guestCollectionGuestsId: GraphQLID? {
    get {
      return graphQLMap["guestCollectionGuestsId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "guestCollectionGuestsId")
    }
  }
}

public struct UpdateGuestInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, name: String? = nil, recognitionId: String? = nil, facePhotos: [String]? = nil, userGuestsId: GraphQLID? = nil, guestCollectionGuestsId: GraphQLID? = nil) {
    graphQLMap = ["id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos, "userGuestsId": userGuestsId, "guestCollectionGuestsId": guestCollectionGuestsId]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return graphQLMap["name"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var recognitionId: String? {
    get {
      return graphQLMap["recognitionId"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recognitionId")
    }
  }

  public var facePhotos: [String]? {
    get {
      return graphQLMap["facePhotos"] as! [String]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "facePhotos")
    }
  }

  public var userGuestsId: GraphQLID? {
    get {
      return graphQLMap["userGuestsId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userGuestsId")
    }
  }

  public var guestCollectionGuestsId: GraphQLID? {
    get {
      return graphQLMap["guestCollectionGuestsId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "guestCollectionGuestsId")
    }
  }
}

public struct DeleteGuestInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelUserFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDFilterInput? = nil, username: ModelStringFilterInput? = nil, registered: ModelBooleanFilterInput? = nil, deviceToken: ModelStringFilterInput? = nil, awsSnsEnpointArn: ModelStringFilterInput? = nil, cameras: ModelStringFilterInput? = nil, and: [ModelUserFilterInput?]? = nil, or: [ModelUserFilterInput?]? = nil, not: ModelUserFilterInput? = nil) {
    graphQLMap = ["id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDFilterInput? {
    get {
      return graphQLMap["id"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var username: ModelStringFilterInput? {
    get {
      return graphQLMap["username"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "username")
    }
  }

  public var registered: ModelBooleanFilterInput? {
    get {
      return graphQLMap["registered"] as! ModelBooleanFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "registered")
    }
  }

  public var deviceToken: ModelStringFilterInput? {
    get {
      return graphQLMap["deviceToken"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "deviceToken")
    }
  }

  public var awsSnsEnpointArn: ModelStringFilterInput? {
    get {
      return graphQLMap["awsSNSEnpointARN"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "awsSNSEnpointARN")
    }
  }

  public var cameras: ModelStringFilterInput? {
    get {
      return graphQLMap["cameras"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameras")
    }
  }

  public var and: [ModelUserFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserFilterInput? {
    get {
      return graphQLMap["not"] as! ModelUserFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ModelStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }
}

public struct ModelBooleanFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Bool? = nil, eq: Bool? = nil) {
    graphQLMap = ["ne": ne, "eq": eq]
  }

  public var ne: Bool? {
    get {
      return graphQLMap["ne"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Bool? {
    get {
      return graphQLMap["eq"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }
}

public struct ModelCameraFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDFilterInput? = nil, name: ModelStringFilterInput? = nil, channel: ModelStringFilterInput? = nil, and: [ModelCameraFilterInput?]? = nil, or: [ModelCameraFilterInput?]? = nil, not: ModelCameraFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "channel": channel, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDFilterInput? {
    get {
      return graphQLMap["id"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: ModelStringFilterInput? {
    get {
      return graphQLMap["name"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var channel: ModelStringFilterInput? {
    get {
      return graphQLMap["channel"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "channel")
    }
  }

  public var and: [ModelCameraFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelCameraFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelCameraFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelCameraFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelCameraFilterInput? {
    get {
      return graphQLMap["not"] as! ModelCameraFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelRequestStreamingFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDFilterInput? = nil, cameraId: ModelIDFilterInput? = nil, userId: ModelIDFilterInput? = nil, time: ModelStringFilterInput? = nil, and: [ModelRequestStreamingFilterInput?]? = nil, or: [ModelRequestStreamingFilterInput?]? = nil, not: ModelRequestStreamingFilterInput? = nil) {
    graphQLMap = ["id": id, "cameraId": cameraId, "userId": userId, "time": time, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDFilterInput? {
    get {
      return graphQLMap["id"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var cameraId: ModelIDFilterInput? {
    get {
      return graphQLMap["cameraId"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameraId")
    }
  }

  public var userId: ModelIDFilterInput? {
    get {
      return graphQLMap["userId"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userId")
    }
  }

  public var time: ModelStringFilterInput? {
    get {
      return graphQLMap["time"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }

  public var and: [ModelRequestStreamingFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelRequestStreamingFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelRequestStreamingFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelRequestStreamingFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelRequestStreamingFilterInput? {
    get {
      return graphQLMap["not"] as! ModelRequestStreamingFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelDetectMotionFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(cameraId: ModelIDFilterInput? = nil, time: ModelStringFilterInput? = nil, persons: ModelStringFilterInput? = nil, objects: ModelStringFilterInput? = nil, and: [ModelDetectMotionFilterInput?]? = nil, or: [ModelDetectMotionFilterInput?]? = nil, not: ModelDetectMotionFilterInput? = nil) {
    graphQLMap = ["cameraId": cameraId, "time": time, "persons": persons, "objects": objects, "and": and, "or": or, "not": not]
  }

  public var cameraId: ModelIDFilterInput? {
    get {
      return graphQLMap["cameraId"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cameraId")
    }
  }

  public var time: ModelStringFilterInput? {
    get {
      return graphQLMap["time"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "time")
    }
  }

  public var persons: ModelStringFilterInput? {
    get {
      return graphQLMap["persons"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "persons")
    }
  }

  public var objects: ModelStringFilterInput? {
    get {
      return graphQLMap["objects"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "objects")
    }
  }

  public var and: [ModelDetectMotionFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelDetectMotionFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelDetectMotionFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelDetectMotionFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelDetectMotionFilterInput? {
    get {
      return graphQLMap["not"] as! ModelDetectMotionFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelGuestCollectionFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDFilterInput? = nil, name: ModelStringFilterInput? = nil, and: [ModelGuestCollectionFilterInput?]? = nil, or: [ModelGuestCollectionFilterInput?]? = nil, not: ModelGuestCollectionFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDFilterInput? {
    get {
      return graphQLMap["id"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: ModelStringFilterInput? {
    get {
      return graphQLMap["name"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var and: [ModelGuestCollectionFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelGuestCollectionFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelGuestCollectionFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelGuestCollectionFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelGuestCollectionFilterInput? {
    get {
      return graphQLMap["not"] as! ModelGuestCollectionFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelGuestFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDFilterInput? = nil, name: ModelStringFilterInput? = nil, recognitionId: ModelStringFilterInput? = nil, facePhotos: ModelStringFilterInput? = nil, and: [ModelGuestFilterInput?]? = nil, or: [ModelGuestFilterInput?]? = nil, not: ModelGuestFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDFilterInput? {
    get {
      return graphQLMap["id"] as! ModelIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: ModelStringFilterInput? {
    get {
      return graphQLMap["name"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var recognitionId: ModelStringFilterInput? {
    get {
      return graphQLMap["recognitionId"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recognitionId")
    }
  }

  public var facePhotos: ModelStringFilterInput? {
    get {
      return graphQLMap["facePhotos"] as! ModelStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "facePhotos")
    }
  }

  public var and: [ModelGuestFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelGuestFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelGuestFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelGuestFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelGuestFilterInput? {
    get {
      return graphQLMap["not"] as! ModelGuestFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct SearchableGuestFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: SearchableIDFilterInput? = nil, name: SearchableStringFilterInput? = nil, recognitionId: SearchableStringFilterInput? = nil, facePhotos: SearchableStringFilterInput? = nil, and: [SearchableGuestFilterInput?]? = nil, or: [SearchableGuestFilterInput?]? = nil, not: SearchableGuestFilterInput? = nil) {
    graphQLMap = ["id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos, "and": and, "or": or, "not": not]
  }

  public var id: SearchableIDFilterInput? {
    get {
      return graphQLMap["id"] as! SearchableIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: SearchableStringFilterInput? {
    get {
      return graphQLMap["name"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var recognitionId: SearchableStringFilterInput? {
    get {
      return graphQLMap["recognitionId"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recognitionId")
    }
  }

  public var facePhotos: SearchableStringFilterInput? {
    get {
      return graphQLMap["facePhotos"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "facePhotos")
    }
  }

  public var and: [SearchableGuestFilterInput?]? {
    get {
      return graphQLMap["and"] as! [SearchableGuestFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [SearchableGuestFilterInput?]? {
    get {
      return graphQLMap["or"] as! [SearchableGuestFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: SearchableGuestFilterInput? {
    get {
      return graphQLMap["not"] as! SearchableGuestFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct SearchableIDFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, match: GraphQLID? = nil, matchPhrase: GraphQLID? = nil, matchPhrasePrefix: GraphQLID? = nil, multiMatch: GraphQLID? = nil, exists: Bool? = nil, wildcard: GraphQLID? = nil, regexp: GraphQLID? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "match": match, "matchPhrase": matchPhrase, "matchPhrasePrefix": matchPhrasePrefix, "multiMatch": multiMatch, "exists": exists, "wildcard": wildcard, "regexp": regexp]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var match: GraphQLID? {
    get {
      return graphQLMap["match"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "match")
    }
  }

  public var matchPhrase: GraphQLID? {
    get {
      return graphQLMap["matchPhrase"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrase")
    }
  }

  public var matchPhrasePrefix: GraphQLID? {
    get {
      return graphQLMap["matchPhrasePrefix"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrasePrefix")
    }
  }

  public var multiMatch: GraphQLID? {
    get {
      return graphQLMap["multiMatch"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "multiMatch")
    }
  }

  public var exists: Bool? {
    get {
      return graphQLMap["exists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exists")
    }
  }

  public var wildcard: GraphQLID? {
    get {
      return graphQLMap["wildcard"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "wildcard")
    }
  }

  public var regexp: GraphQLID? {
    get {
      return graphQLMap["regexp"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "regexp")
    }
  }
}

public struct SearchableStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, match: String? = nil, matchPhrase: String? = nil, matchPhrasePrefix: String? = nil, multiMatch: String? = nil, exists: Bool? = nil, wildcard: String? = nil, regexp: String? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "match": match, "matchPhrase": matchPhrase, "matchPhrasePrefix": matchPhrasePrefix, "multiMatch": multiMatch, "exists": exists, "wildcard": wildcard, "regexp": regexp]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var match: String? {
    get {
      return graphQLMap["match"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "match")
    }
  }

  public var matchPhrase: String? {
    get {
      return graphQLMap["matchPhrase"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrase")
    }
  }

  public var matchPhrasePrefix: String? {
    get {
      return graphQLMap["matchPhrasePrefix"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrasePrefix")
    }
  }

  public var multiMatch: String? {
    get {
      return graphQLMap["multiMatch"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "multiMatch")
    }
  }

  public var exists: Bool? {
    get {
      return graphQLMap["exists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exists")
    }
  }

  public var wildcard: String? {
    get {
      return graphQLMap["wildcard"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "wildcard")
    }
  }

  public var regexp: String? {
    get {
      return graphQLMap["regexp"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "regexp")
    }
  }
}

public struct SearchableGuestSortInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(field: SearchableGuestSortableFields? = nil, direction: SearchableSortDirection? = nil) {
    graphQLMap = ["field": field, "direction": direction]
  }

  public var field: SearchableGuestSortableFields? {
    get {
      return graphQLMap["field"] as! SearchableGuestSortableFields?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "field")
    }
  }

  public var direction: SearchableSortDirection? {
    get {
      return graphQLMap["direction"] as! SearchableSortDirection?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "direction")
    }
  }
}

public enum SearchableGuestSortableFields: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case id
  case name
  case recognitionId
  case facePhotos
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "id": self = .id
      case "name": self = .name
      case "recognitionId": self = .recognitionId
      case "facePhotos": self = .facePhotos
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .id: return "id"
      case .name: return "name"
      case .recognitionId: return "recognitionId"
      case .facePhotos: return "facePhotos"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: SearchableGuestSortableFields, rhs: SearchableGuestSortableFields) -> Bool {
    switch (lhs, rhs) {
      case (.id, .id): return true
      case (.name, .name): return true
      case (.recognitionId, .recognitionId): return true
      case (.facePhotos, .facePhotos): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum SearchableSortDirection: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case asc
  case desc
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "asc": self = .asc
      case "desc": self = .desc
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .asc: return "asc"
      case .desc: return "desc"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: SearchableSortDirection, rhs: SearchableSortDirection) -> Bool {
    switch (lhs, rhs) {
      case (.asc, .asc): return true
      case (.desc, .desc): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class CreateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUser($input: CreateUserInput!) {\n  createUser(input: $input) {\n    __typename\n    id\n    username\n    registered\n    deviceToken\n    awsSNSEnpointARN\n    cameras\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var input: CreateUserInput

  public init(input: CreateUserInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUser", arguments: ["input": GraphQLVariable("input")], type: .object(CreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUser: CreateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUser": createUser.flatMap { $0.snapshot }])
    }

    public var createUser: CreateUser? {
      get {
        return (snapshot["createUser"] as? Snapshot).flatMap { CreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUser")
      }
    }

    public struct CreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("registered", type: .scalar(Bool.self)),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
        GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var registered: Bool? {
        get {
          return snapshot["registered"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "registered")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var awsSnsEnpointArn: String? {
        get {
          return snapshot["awsSNSEnpointARN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
        }
      }

      public var cameras: [String]? {
        get {
          return snapshot["cameras"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameras")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class UpdateUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUser($input: UpdateUserInput!) {\n  updateUser(input: $input) {\n    __typename\n    id\n    username\n    registered\n    deviceToken\n    awsSNSEnpointARN\n    cameras\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var input: UpdateUserInput

  public init(input: UpdateUserInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUser", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUser: UpdateUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUser": updateUser.flatMap { $0.snapshot }])
    }

    public var updateUser: UpdateUser? {
      get {
        return (snapshot["updateUser"] as? Snapshot).flatMap { UpdateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUser")
      }
    }

    public struct UpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("registered", type: .scalar(Bool.self)),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
        GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var registered: Bool? {
        get {
          return snapshot["registered"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "registered")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var awsSnsEnpointArn: String? {
        get {
          return snapshot["awsSNSEnpointARN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
        }
      }

      public var cameras: [String]? {
        get {
          return snapshot["cameras"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameras")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class DeleteUserMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUser($input: DeleteUserInput!) {\n  deleteUser(input: $input) {\n    __typename\n    id\n    username\n    registered\n    deviceToken\n    awsSNSEnpointARN\n    cameras\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var input: DeleteUserInput

  public init(input: DeleteUserInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUser", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUser: DeleteUser? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUser": deleteUser.flatMap { $0.snapshot }])
    }

    public var deleteUser: DeleteUser? {
      get {
        return (snapshot["deleteUser"] as? Snapshot).flatMap { DeleteUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUser")
      }
    }

    public struct DeleteUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("registered", type: .scalar(Bool.self)),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
        GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var registered: Bool? {
        get {
          return snapshot["registered"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "registered")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var awsSnsEnpointArn: String? {
        get {
          return snapshot["awsSNSEnpointARN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
        }
      }

      public var cameras: [String]? {
        get {
          return snapshot["cameras"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameras")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class CreateCameraMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateCamera($input: CreateCameraInput!) {\n  createCamera(input: $input) {\n    __typename\n    id\n    name\n    channel\n  }\n}"

  public var input: CreateCameraInput

  public init(input: CreateCameraInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createCamera", arguments: ["input": GraphQLVariable("input")], type: .object(CreateCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createCamera: CreateCamera? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createCamera": createCamera.flatMap { $0.snapshot }])
    }

    public var createCamera: CreateCamera? {
      get {
        return (snapshot["createCamera"] as? Snapshot).flatMap { CreateCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createCamera")
      }
    }

    public struct CreateCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["Camera"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("channel", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
        self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var channel: String? {
        get {
          return snapshot["channel"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "channel")
        }
      }
    }
  }
}

public final class UpdateCameraMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateCamera($input: UpdateCameraInput!) {\n  updateCamera(input: $input) {\n    __typename\n    id\n    name\n    channel\n  }\n}"

  public var input: UpdateCameraInput

  public init(input: UpdateCameraInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateCamera", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateCamera: UpdateCamera? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateCamera": updateCamera.flatMap { $0.snapshot }])
    }

    public var updateCamera: UpdateCamera? {
      get {
        return (snapshot["updateCamera"] as? Snapshot).flatMap { UpdateCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateCamera")
      }
    }

    public struct UpdateCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["Camera"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("channel", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
        self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var channel: String? {
        get {
          return snapshot["channel"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "channel")
        }
      }
    }
  }
}

public final class DeleteCameraMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteCamera($input: DeleteCameraInput!) {\n  deleteCamera(input: $input) {\n    __typename\n    id\n    name\n    channel\n  }\n}"

  public var input: DeleteCameraInput

  public init(input: DeleteCameraInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteCamera", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteCamera: DeleteCamera? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteCamera": deleteCamera.flatMap { $0.snapshot }])
    }

    public var deleteCamera: DeleteCamera? {
      get {
        return (snapshot["deleteCamera"] as? Snapshot).flatMap { DeleteCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteCamera")
      }
    }

    public struct DeleteCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["Camera"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("channel", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
        self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var channel: String? {
        get {
          return snapshot["channel"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "channel")
        }
      }
    }
  }
}

public final class CreateRequestStreamingMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateRequestStreaming($input: CreateRequestStreamingInput!) {\n  createRequestStreaming(input: $input) {\n    __typename\n    id\n    cameraId\n    userId\n    time\n  }\n}"

  public var input: CreateRequestStreamingInput

  public init(input: CreateRequestStreamingInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createRequestStreaming", arguments: ["input": GraphQLVariable("input")], type: .object(CreateRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createRequestStreaming: CreateRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createRequestStreaming": createRequestStreaming.flatMap { $0.snapshot }])
    }

    public var createRequestStreaming: CreateRequestStreaming? {
      get {
        return (snapshot["createRequestStreaming"] as? Snapshot).flatMap { CreateRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createRequestStreaming")
      }
    }

    public struct CreateRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestStreaming"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
        GraphQLField("userId", type: .scalar(GraphQLID.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var cameraId: GraphQLID? {
        get {
          return snapshot["cameraId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var userId: GraphQLID? {
        get {
          return snapshot["userId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class UpdateRequestStreamingMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateRequestStreaming($input: UpdateRequestStreamingInput!) {\n  updateRequestStreaming(input: $input) {\n    __typename\n    id\n    cameraId\n    userId\n    time\n  }\n}"

  public var input: UpdateRequestStreamingInput

  public init(input: UpdateRequestStreamingInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateRequestStreaming", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateRequestStreaming: UpdateRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateRequestStreaming": updateRequestStreaming.flatMap { $0.snapshot }])
    }

    public var updateRequestStreaming: UpdateRequestStreaming? {
      get {
        return (snapshot["updateRequestStreaming"] as? Snapshot).flatMap { UpdateRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateRequestStreaming")
      }
    }

    public struct UpdateRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestStreaming"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
        GraphQLField("userId", type: .scalar(GraphQLID.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var cameraId: GraphQLID? {
        get {
          return snapshot["cameraId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var userId: GraphQLID? {
        get {
          return snapshot["userId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class DeleteRequestStreamingMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteRequestStreaming($input: DeleteRequestStreamingInput!) {\n  deleteRequestStreaming(input: $input) {\n    __typename\n    id\n    cameraId\n    userId\n    time\n  }\n}"

  public var input: DeleteRequestStreamingInput

  public init(input: DeleteRequestStreamingInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteRequestStreaming", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteRequestStreaming: DeleteRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteRequestStreaming": deleteRequestStreaming.flatMap { $0.snapshot }])
    }

    public var deleteRequestStreaming: DeleteRequestStreaming? {
      get {
        return (snapshot["deleteRequestStreaming"] as? Snapshot).flatMap { DeleteRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteRequestStreaming")
      }
    }

    public struct DeleteRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestStreaming"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
        GraphQLField("userId", type: .scalar(GraphQLID.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var cameraId: GraphQLID? {
        get {
          return snapshot["cameraId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var userId: GraphQLID? {
        get {
          return snapshot["userId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class CreateDetectMotionMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateDetectMotion($input: CreateDetectMotionInput!) {\n  createDetectMotion(input: $input) {\n    __typename\n    cameraId\n    time\n    persons\n    objects\n  }\n}"

  public var input: CreateDetectMotionInput

  public init(input: CreateDetectMotionInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createDetectMotion", arguments: ["input": GraphQLVariable("input")], type: .object(CreateDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createDetectMotion: CreateDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createDetectMotion": createDetectMotion.flatMap { $0.snapshot }])
    }

    public var createDetectMotion: CreateDetectMotion? {
      get {
        return (snapshot["createDetectMotion"] as? Snapshot).flatMap { CreateDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createDetectMotion")
      }
    }

    public struct CreateDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["DetectMotion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("persons", type: .list(.scalar(String.self))),
        GraphQLField("objects", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
        self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cameraId: GraphQLID {
        get {
          return snapshot["cameraId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var persons: [String?]? {
        get {
          return snapshot["persons"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "persons")
        }
      }

      public var objects: [String?]? {
        get {
          return snapshot["objects"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "objects")
        }
      }
    }
  }
}

public final class UpdateDetectMotionMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateDetectMotion($input: UpdateDetectMotionInput!) {\n  updateDetectMotion(input: $input) {\n    __typename\n    cameraId\n    time\n    persons\n    objects\n  }\n}"

  public var input: UpdateDetectMotionInput

  public init(input: UpdateDetectMotionInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateDetectMotion", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateDetectMotion: UpdateDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateDetectMotion": updateDetectMotion.flatMap { $0.snapshot }])
    }

    public var updateDetectMotion: UpdateDetectMotion? {
      get {
        return (snapshot["updateDetectMotion"] as? Snapshot).flatMap { UpdateDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateDetectMotion")
      }
    }

    public struct UpdateDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["DetectMotion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("persons", type: .list(.scalar(String.self))),
        GraphQLField("objects", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
        self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cameraId: GraphQLID {
        get {
          return snapshot["cameraId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var persons: [String?]? {
        get {
          return snapshot["persons"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "persons")
        }
      }

      public var objects: [String?]? {
        get {
          return snapshot["objects"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "objects")
        }
      }
    }
  }
}

public final class DeleteDetectMotionMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteDetectMotion($input: DeleteDetectMotionInput!) {\n  deleteDetectMotion(input: $input) {\n    __typename\n    cameraId\n    time\n    persons\n    objects\n  }\n}"

  public var input: DeleteDetectMotionInput

  public init(input: DeleteDetectMotionInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteDetectMotion", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteDetectMotion: DeleteDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteDetectMotion": deleteDetectMotion.flatMap { $0.snapshot }])
    }

    public var deleteDetectMotion: DeleteDetectMotion? {
      get {
        return (snapshot["deleteDetectMotion"] as? Snapshot).flatMap { DeleteDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteDetectMotion")
      }
    }

    public struct DeleteDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["DetectMotion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("persons", type: .list(.scalar(String.self))),
        GraphQLField("objects", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
        self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cameraId: GraphQLID {
        get {
          return snapshot["cameraId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var persons: [String?]? {
        get {
          return snapshot["persons"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "persons")
        }
      }

      public var objects: [String?]? {
        get {
          return snapshot["objects"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "objects")
        }
      }
    }
  }
}

public final class CreateGuestCollectionMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateGuestCollection($input: CreateGuestCollectionInput!) {\n  createGuestCollection(input: $input) {\n    __typename\n    id\n    name\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var input: CreateGuestCollectionInput

  public init(input: CreateGuestCollectionInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createGuestCollection", arguments: ["input": GraphQLVariable("input")], type: .object(CreateGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createGuestCollection: CreateGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createGuestCollection": createGuestCollection.flatMap { $0.snapshot }])
    }

    public var createGuestCollection: CreateGuestCollection? {
      get {
        return (snapshot["createGuestCollection"] as? Snapshot).flatMap { CreateGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createGuestCollection")
      }
    }

    public struct CreateGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["GuestCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class UpdateGuestCollectionMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateGuestCollection($input: UpdateGuestCollectionInput!) {\n  updateGuestCollection(input: $input) {\n    __typename\n    id\n    name\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var input: UpdateGuestCollectionInput

  public init(input: UpdateGuestCollectionInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateGuestCollection", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateGuestCollection: UpdateGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateGuestCollection": updateGuestCollection.flatMap { $0.snapshot }])
    }

    public var updateGuestCollection: UpdateGuestCollection? {
      get {
        return (snapshot["updateGuestCollection"] as? Snapshot).flatMap { UpdateGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateGuestCollection")
      }
    }

    public struct UpdateGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["GuestCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class DeleteGuestCollectionMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteGuestCollection($input: DeleteGuestCollectionInput!) {\n  deleteGuestCollection(input: $input) {\n    __typename\n    id\n    name\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var input: DeleteGuestCollectionInput

  public init(input: DeleteGuestCollectionInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteGuestCollection", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteGuestCollection: DeleteGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteGuestCollection": deleteGuestCollection.flatMap { $0.snapshot }])
    }

    public var deleteGuestCollection: DeleteGuestCollection? {
      get {
        return (snapshot["deleteGuestCollection"] as? Snapshot).flatMap { DeleteGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteGuestCollection")
      }
    }

    public struct DeleteGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["GuestCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class CreateGuestMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateGuest($input: CreateGuestInput!) {\n  createGuest(input: $input) {\n    __typename\n    id\n    name\n    recognitionId\n    facePhotos\n  }\n}"

  public var input: CreateGuestInput

  public init(input: CreateGuestInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createGuest", arguments: ["input": GraphQLVariable("input")], type: .object(CreateGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createGuest: CreateGuest? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createGuest": createGuest.flatMap { $0.snapshot }])
    }

    public var createGuest: CreateGuest? {
      get {
        return (snapshot["createGuest"] as? Snapshot).flatMap { CreateGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createGuest")
      }
    }

    public struct CreateGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["Guest"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("recognitionId", type: .scalar(String.self)),
        GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
        self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var recognitionId: String? {
        get {
          return snapshot["recognitionId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recognitionId")
        }
      }

      public var facePhotos: [String]? {
        get {
          return snapshot["facePhotos"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "facePhotos")
        }
      }
    }
  }
}

public final class UpdateGuestMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateGuest($input: UpdateGuestInput!) {\n  updateGuest(input: $input) {\n    __typename\n    id\n    name\n    recognitionId\n    facePhotos\n  }\n}"

  public var input: UpdateGuestInput

  public init(input: UpdateGuestInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateGuest", arguments: ["input": GraphQLVariable("input")], type: .object(UpdateGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateGuest: UpdateGuest? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateGuest": updateGuest.flatMap { $0.snapshot }])
    }

    public var updateGuest: UpdateGuest? {
      get {
        return (snapshot["updateGuest"] as? Snapshot).flatMap { UpdateGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateGuest")
      }
    }

    public struct UpdateGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["Guest"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("recognitionId", type: .scalar(String.self)),
        GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
        self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var recognitionId: String? {
        get {
          return snapshot["recognitionId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recognitionId")
        }
      }

      public var facePhotos: [String]? {
        get {
          return snapshot["facePhotos"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "facePhotos")
        }
      }
    }
  }
}

public final class DeleteGuestMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteGuest($input: DeleteGuestInput!) {\n  deleteGuest(input: $input) {\n    __typename\n    id\n    name\n    recognitionId\n    facePhotos\n  }\n}"

  public var input: DeleteGuestInput

  public init(input: DeleteGuestInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteGuest", arguments: ["input": GraphQLVariable("input")], type: .object(DeleteGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteGuest: DeleteGuest? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteGuest": deleteGuest.flatMap { $0.snapshot }])
    }

    public var deleteGuest: DeleteGuest? {
      get {
        return (snapshot["deleteGuest"] as? Snapshot).flatMap { DeleteGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteGuest")
      }
    }

    public struct DeleteGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["Guest"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("recognitionId", type: .scalar(String.self)),
        GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
        self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var recognitionId: String? {
        get {
          return snapshot["recognitionId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recognitionId")
        }
      }

      public var facePhotos: [String]? {
        get {
          return snapshot["facePhotos"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "facePhotos")
        }
      }
    }
  }
}

public final class GetUserQuery: GraphQLQuery {
  public static let operationString =
    "query GetUser($id: ID!) {\n  getUser(id: $id) {\n    __typename\n    id\n    username\n    registered\n    deviceToken\n    awsSNSEnpointARN\n    cameras\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUser", arguments: ["id": GraphQLVariable("id")], type: .object(GetUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUser: GetUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUser": getUser.flatMap { $0.snapshot }])
    }

    public var getUser: GetUser? {
      get {
        return (snapshot["getUser"] as? Snapshot).flatMap { GetUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUser")
      }
    }

    public struct GetUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("registered", type: .scalar(Bool.self)),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
        GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var registered: Bool? {
        get {
          return snapshot["registered"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "registered")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var awsSnsEnpointArn: String? {
        get {
          return snapshot["awsSNSEnpointARN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
        }
      }

      public var cameras: [String]? {
        get {
          return snapshot["cameras"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameras")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class ListUsersQuery: GraphQLQuery {
  public static let operationString =
    "query ListUsers($filter: ModelUserFilterInput, $limit: Int, $nextToken: String) {\n  listUsers(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      username\n      registered\n      deviceToken\n      awsSNSEnpointARN\n      cameras\n      guests {\n        __typename\n        nextToken\n      }\n    }\n    nextToken\n  }\n}"

  public var filter: ModelUserFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelUserFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUsers", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUsers: ListUser? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUsers": listUsers.flatMap { $0.snapshot }])
    }

    public var listUsers: ListUser? {
      get {
        return (snapshot["listUsers"] as? Snapshot).flatMap { ListUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listUsers")
      }
    }

    public struct ListUser: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .scalar(String.self)),
          GraphQLField("registered", type: .scalar(Bool.self)),
          GraphQLField("deviceToken", type: .scalar(String.self)),
          GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
          GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
          GraphQLField("guests", type: .object(Guest.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
          self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var username: String? {
          get {
            return snapshot["username"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "username")
          }
        }

        public var registered: Bool? {
          get {
            return snapshot["registered"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "registered")
          }
        }

        public var deviceToken: String? {
          get {
            return snapshot["deviceToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "deviceToken")
          }
        }

        public var awsSnsEnpointArn: String? {
          get {
            return snapshot["awsSNSEnpointARN"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
          }
        }

        public var cameras: [String]? {
          get {
            return snapshot["cameras"] as? [String]
          }
          set {
            snapshot.updateValue(newValue, forKey: "cameras")
          }
        }

        public var guests: Guest? {
          get {
            return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "guests")
          }
        }

        public struct Guest: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelGuestConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelGuestConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class GetCameraQuery: GraphQLQuery {
  public static let operationString =
    "query GetCamera($id: ID!) {\n  getCamera(id: $id) {\n    __typename\n    id\n    name\n    channel\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getCamera", arguments: ["id": GraphQLVariable("id")], type: .object(GetCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getCamera: GetCamera? = nil) {
      self.init(snapshot: ["__typename": "Query", "getCamera": getCamera.flatMap { $0.snapshot }])
    }

    public var getCamera: GetCamera? {
      get {
        return (snapshot["getCamera"] as? Snapshot).flatMap { GetCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getCamera")
      }
    }

    public struct GetCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["Camera"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("channel", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
        self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var channel: String? {
        get {
          return snapshot["channel"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "channel")
        }
      }
    }
  }
}

public final class ListCamerasQuery: GraphQLQuery {
  public static let operationString =
    "query ListCameras($filter: ModelCameraFilterInput, $limit: Int, $nextToken: String) {\n  listCameras(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      channel\n    }\n    nextToken\n  }\n}"

  public var filter: ModelCameraFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelCameraFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listCameras", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listCameras: ListCamera? = nil) {
      self.init(snapshot: ["__typename": "Query", "listCameras": listCameras.flatMap { $0.snapshot }])
    }

    public var listCameras: ListCamera? {
      get {
        return (snapshot["listCameras"] as? Snapshot).flatMap { ListCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listCameras")
      }
    }

    public struct ListCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelCameraConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelCameraConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Camera"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("channel", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
          self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var channel: String? {
          get {
            return snapshot["channel"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "channel")
          }
        }
      }
    }
  }
}

public final class GetRequestStreamingQuery: GraphQLQuery {
  public static let operationString =
    "query GetRequestStreaming($id: ID!) {\n  getRequestStreaming(id: $id) {\n    __typename\n    id\n    cameraId\n    userId\n    time\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getRequestStreaming", arguments: ["id": GraphQLVariable("id")], type: .object(GetRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getRequestStreaming: GetRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Query", "getRequestStreaming": getRequestStreaming.flatMap { $0.snapshot }])
    }

    public var getRequestStreaming: GetRequestStreaming? {
      get {
        return (snapshot["getRequestStreaming"] as? Snapshot).flatMap { GetRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getRequestStreaming")
      }
    }

    public struct GetRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestStreaming"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
        GraphQLField("userId", type: .scalar(GraphQLID.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var cameraId: GraphQLID? {
        get {
          return snapshot["cameraId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var userId: GraphQLID? {
        get {
          return snapshot["userId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class ListRequestStreamingsQuery: GraphQLQuery {
  public static let operationString =
    "query ListRequestStreamings($filter: ModelRequestStreamingFilterInput, $limit: Int, $nextToken: String) {\n  listRequestStreamings(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      cameraId\n      userId\n      time\n    }\n    nextToken\n  }\n}"

  public var filter: ModelRequestStreamingFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelRequestStreamingFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listRequestStreamings", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listRequestStreamings: ListRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Query", "listRequestStreamings": listRequestStreamings.flatMap { $0.snapshot }])
    }

    public var listRequestStreamings: ListRequestStreaming? {
      get {
        return (snapshot["listRequestStreamings"] as? Snapshot).flatMap { ListRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listRequestStreamings")
      }
    }

    public struct ListRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelRequestStreamingConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelRequestStreamingConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["RequestStreaming"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
          GraphQLField("userId", type: .scalar(GraphQLID.self)),
          GraphQLField("time", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
          self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var cameraId: GraphQLID? {
          get {
            return snapshot["cameraId"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cameraId")
          }
        }

        public var userId: GraphQLID? {
          get {
            return snapshot["userId"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "userId")
          }
        }

        public var time: String? {
          get {
            return snapshot["time"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "time")
          }
        }
      }
    }
  }
}

public final class GetDetectMotionQuery: GraphQLQuery {
  public static let operationString =
    "query GetDetectMotion($id: ID!) {\n  getDetectMotion(id: $id) {\n    __typename\n    cameraId\n    time\n    persons\n    objects\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getDetectMotion", arguments: ["id": GraphQLVariable("id")], type: .object(GetDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getDetectMotion: GetDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Query", "getDetectMotion": getDetectMotion.flatMap { $0.snapshot }])
    }

    public var getDetectMotion: GetDetectMotion? {
      get {
        return (snapshot["getDetectMotion"] as? Snapshot).flatMap { GetDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getDetectMotion")
      }
    }

    public struct GetDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["DetectMotion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("persons", type: .list(.scalar(String.self))),
        GraphQLField("objects", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
        self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cameraId: GraphQLID {
        get {
          return snapshot["cameraId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var persons: [String?]? {
        get {
          return snapshot["persons"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "persons")
        }
      }

      public var objects: [String?]? {
        get {
          return snapshot["objects"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "objects")
        }
      }
    }
  }
}

public final class ListDetectMotionsQuery: GraphQLQuery {
  public static let operationString =
    "query ListDetectMotions($filter: ModelDetectMotionFilterInput, $limit: Int, $nextToken: String) {\n  listDetectMotions(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      cameraId\n      time\n      persons\n      objects\n    }\n    nextToken\n  }\n}"

  public var filter: ModelDetectMotionFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelDetectMotionFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listDetectMotions", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listDetectMotions: ListDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Query", "listDetectMotions": listDetectMotions.flatMap { $0.snapshot }])
    }

    public var listDetectMotions: ListDetectMotion? {
      get {
        return (snapshot["listDetectMotions"] as? Snapshot).flatMap { ListDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listDetectMotions")
      }
    }

    public struct ListDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelDetectMotionConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelDetectMotionConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["DetectMotion"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("time", type: .scalar(String.self)),
          GraphQLField("persons", type: .list(.scalar(String.self))),
          GraphQLField("objects", type: .list(.scalar(String.self))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
          self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var cameraId: GraphQLID {
          get {
            return snapshot["cameraId"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "cameraId")
          }
        }

        public var time: String? {
          get {
            return snapshot["time"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "time")
          }
        }

        public var persons: [String?]? {
          get {
            return snapshot["persons"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "persons")
          }
        }

        public var objects: [String?]? {
          get {
            return snapshot["objects"] as? [String?]
          }
          set {
            snapshot.updateValue(newValue, forKey: "objects")
          }
        }
      }
    }
  }
}

public final class GetGuestCollectionQuery: GraphQLQuery {
  public static let operationString =
    "query GetGuestCollection($id: ID!) {\n  getGuestCollection(id: $id) {\n    __typename\n    id\n    name\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getGuestCollection", arguments: ["id": GraphQLVariable("id")], type: .object(GetGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getGuestCollection: GetGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Query", "getGuestCollection": getGuestCollection.flatMap { $0.snapshot }])
    }

    public var getGuestCollection: GetGuestCollection? {
      get {
        return (snapshot["getGuestCollection"] as? Snapshot).flatMap { GetGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getGuestCollection")
      }
    }

    public struct GetGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["GuestCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet, Identifiable {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class ListGuestCollectionsQuery: GraphQLQuery {
  public static let operationString =
    "query ListGuestCollections($filter: ModelGuestCollectionFilterInput, $limit: Int, $nextToken: String) {\n  listGuestCollections(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      guests {\n        __typename\n        nextToken\n      }\n    }\n    nextToken\n  }\n}"

  public var filter: ModelGuestCollectionFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelGuestCollectionFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listGuestCollections", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listGuestCollections: ListGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Query", "listGuestCollections": listGuestCollections.flatMap { $0.snapshot }])
    }

    public var listGuestCollections: ListGuestCollection? {
      get {
        return (snapshot["listGuestCollections"] as? Snapshot).flatMap { ListGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listGuestCollections")
      }
    }

    public struct ListGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelGuestCollectionConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelGuestCollectionConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["GuestCollection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("guests", type: .object(Guest.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, guests: Guest? = nil) {
          self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var guests: Guest? {
          get {
            return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "guests")
          }
        }

        public struct Guest: GraphQLSelectionSet {
          public static let possibleTypes = ["ModelGuestConnection"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nextToken", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(nextToken: String? = nil) {
            self.init(snapshot: ["__typename": "ModelGuestConnection", "nextToken": nextToken])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nextToken: String? {
            get {
              return snapshot["nextToken"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "nextToken")
            }
          }
        }
      }
    }
  }
}

public final class GetGuestQuery: GraphQLQuery {
  public static let operationString =
    "query GetGuest($id: ID!) {\n  getGuest(id: $id) {\n    __typename\n    id\n    name\n    recognitionId\n    facePhotos\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getGuest", arguments: ["id": GraphQLVariable("id")], type: .object(GetGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getGuest: GetGuest? = nil) {
      self.init(snapshot: ["__typename": "Query", "getGuest": getGuest.flatMap { $0.snapshot }])
    }

    public var getGuest: GetGuest? {
      get {
        return (snapshot["getGuest"] as? Snapshot).flatMap { GetGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getGuest")
      }
    }

    public struct GetGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["Guest"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("recognitionId", type: .scalar(String.self)),
        GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
        self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var recognitionId: String? {
        get {
          return snapshot["recognitionId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recognitionId")
        }
      }

      public var facePhotos: [String]? {
        get {
          return snapshot["facePhotos"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "facePhotos")
        }
      }
    }
  }
}

public final class ListGuestsQuery: GraphQLQuery {
  public static let operationString =
    "query ListGuests($filter: ModelGuestFilterInput, $limit: Int, $nextToken: String) {\n  listGuests(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      recognitionId\n      facePhotos\n    }\n    nextToken\n  }\n}"

  public var filter: ModelGuestFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelGuestFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listGuests", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listGuests: ListGuest? = nil) {
      self.init(snapshot: ["__typename": "Query", "listGuests": listGuests.flatMap { $0.snapshot }])
    }

    public var listGuests: ListGuest? {
      get {
        return (snapshot["listGuests"] as? Snapshot).flatMap { ListGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listGuests")
      }
    }

    public struct ListGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelGuestConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Guest"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("recognitionId", type: .scalar(String.self)),
          GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
          self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var recognitionId: String? {
          get {
            return snapshot["recognitionId"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "recognitionId")
          }
        }

        public var facePhotos: [String]? {
          get {
            return snapshot["facePhotos"] as? [String]
          }
          set {
            snapshot.updateValue(newValue, forKey: "facePhotos")
          }
        }
      }
    }
  }
}

public final class SearchGuestsQuery: GraphQLQuery {
  public static let operationString =
    "query SearchGuests($filter: SearchableGuestFilterInput, $sort: SearchableGuestSortInput, $limit: Int, $nextToken: String) {\n  searchGuests(filter: $filter, sort: $sort, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      name\n      recognitionId\n      facePhotos\n    }\n    nextToken\n  }\n}"

  public var filter: SearchableGuestFilterInput?
  public var sort: SearchableGuestSortInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: SearchableGuestFilterInput? = nil, sort: SearchableGuestSortInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.sort = sort
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "sort": sort, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("searchGuests", arguments: ["filter": GraphQLVariable("filter"), "sort": GraphQLVariable("sort"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(SearchGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(searchGuests: SearchGuest? = nil) {
      self.init(snapshot: ["__typename": "Query", "searchGuests": searchGuests.flatMap { $0.snapshot }])
    }

    public var searchGuests: SearchGuest? {
      get {
        return (snapshot["searchGuests"] as? Snapshot).flatMap { SearchGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "searchGuests")
      }
    }

    public struct SearchGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchableGuestConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "SearchableGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["Guest"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("recognitionId", type: .scalar(String.self)),
          GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
          self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return snapshot["name"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var recognitionId: String? {
          get {
            return snapshot["recognitionId"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "recognitionId")
          }
        }

        public var facePhotos: [String]? {
          get {
            return snapshot["facePhotos"] as? [String]
          }
          set {
            snapshot.updateValue(newValue, forKey: "facePhotos")
          }
        }
      }
    }
  }
}

public final class OnCreateUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateUser {\n  onCreateUser {\n    __typename\n    id\n    username\n    registered\n    deviceToken\n    awsSNSEnpointARN\n    cameras\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateUser", type: .object(OnCreateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateUser: OnCreateUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateUser": onCreateUser.flatMap { $0.snapshot }])
    }

    public var onCreateUser: OnCreateUser? {
      get {
        return (snapshot["onCreateUser"] as? Snapshot).flatMap { OnCreateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateUser")
      }
    }

    public struct OnCreateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("registered", type: .scalar(Bool.self)),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
        GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var registered: Bool? {
        get {
          return snapshot["registered"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "registered")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var awsSnsEnpointArn: String? {
        get {
          return snapshot["awsSNSEnpointARN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
        }
      }

      public var cameras: [String]? {
        get {
          return snapshot["cameras"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameras")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class OnUpdateUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateUser {\n  onUpdateUser {\n    __typename\n    id\n    username\n    registered\n    deviceToken\n    awsSNSEnpointARN\n    cameras\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateUser", type: .object(OnUpdateUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateUser: OnUpdateUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateUser": onUpdateUser.flatMap { $0.snapshot }])
    }

    public var onUpdateUser: OnUpdateUser? {
      get {
        return (snapshot["onUpdateUser"] as? Snapshot).flatMap { OnUpdateUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateUser")
      }
    }

    public struct OnUpdateUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("registered", type: .scalar(Bool.self)),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
        GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var registered: Bool? {
        get {
          return snapshot["registered"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "registered")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var awsSnsEnpointArn: String? {
        get {
          return snapshot["awsSNSEnpointARN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
        }
      }

      public var cameras: [String]? {
        get {
          return snapshot["cameras"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameras")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class OnDeleteUserSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteUser {\n  onDeleteUser {\n    __typename\n    id\n    username\n    registered\n    deviceToken\n    awsSNSEnpointARN\n    cameras\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteUser", type: .object(OnDeleteUser.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteUser: OnDeleteUser? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteUser": onDeleteUser.flatMap { $0.snapshot }])
    }

    public var onDeleteUser: OnDeleteUser? {
      get {
        return (snapshot["onDeleteUser"] as? Snapshot).flatMap { OnDeleteUser(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteUser")
      }
    }

    public struct OnDeleteUser: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("username", type: .scalar(String.self)),
        GraphQLField("registered", type: .scalar(Bool.self)),
        GraphQLField("deviceToken", type: .scalar(String.self)),
        GraphQLField("awsSNSEnpointARN", type: .scalar(String.self)),
        GraphQLField("cameras", type: .list(.nonNull(.scalar(String.self)))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, username: String? = nil, registered: Bool? = nil, deviceToken: String? = nil, awsSnsEnpointArn: String? = nil, cameras: [String]? = nil, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "User", "id": id, "username": username, "registered": registered, "deviceToken": deviceToken, "awsSNSEnpointARN": awsSnsEnpointArn, "cameras": cameras, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String? {
        get {
          return snapshot["username"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "username")
        }
      }

      public var registered: Bool? {
        get {
          return snapshot["registered"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "registered")
        }
      }

      public var deviceToken: String? {
        get {
          return snapshot["deviceToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "deviceToken")
        }
      }

      public var awsSnsEnpointArn: String? {
        get {
          return snapshot["awsSNSEnpointARN"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "awsSNSEnpointARN")
        }
      }

      public var cameras: [String]? {
        get {
          return snapshot["cameras"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameras")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class OnCreateCameraSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateCamera {\n  onCreateCamera {\n    __typename\n    id\n    name\n    channel\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateCamera", type: .object(OnCreateCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateCamera: OnCreateCamera? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateCamera": onCreateCamera.flatMap { $0.snapshot }])
    }

    public var onCreateCamera: OnCreateCamera? {
      get {
        return (snapshot["onCreateCamera"] as? Snapshot).flatMap { OnCreateCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateCamera")
      }
    }

    public struct OnCreateCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["Camera"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("channel", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
        self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var channel: String? {
        get {
          return snapshot["channel"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "channel")
        }
      }
    }
  }
}

public final class OnUpdateCameraSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateCamera {\n  onUpdateCamera {\n    __typename\n    id\n    name\n    channel\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateCamera", type: .object(OnUpdateCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateCamera: OnUpdateCamera? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateCamera": onUpdateCamera.flatMap { $0.snapshot }])
    }

    public var onUpdateCamera: OnUpdateCamera? {
      get {
        return (snapshot["onUpdateCamera"] as? Snapshot).flatMap { OnUpdateCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateCamera")
      }
    }

    public struct OnUpdateCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["Camera"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("channel", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
        self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var channel: String? {
        get {
          return snapshot["channel"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "channel")
        }
      }
    }
  }
}

public final class OnDeleteCameraSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteCamera {\n  onDeleteCamera {\n    __typename\n    id\n    name\n    channel\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteCamera", type: .object(OnDeleteCamera.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteCamera: OnDeleteCamera? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteCamera": onDeleteCamera.flatMap { $0.snapshot }])
    }

    public var onDeleteCamera: OnDeleteCamera? {
      get {
        return (snapshot["onDeleteCamera"] as? Snapshot).flatMap { OnDeleteCamera(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteCamera")
      }
    }

    public struct OnDeleteCamera: GraphQLSelectionSet {
      public static let possibleTypes = ["Camera"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("channel", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String? = nil, channel: String? = nil) {
        self.init(snapshot: ["__typename": "Camera", "id": id, "name": name, "channel": channel])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var channel: String? {
        get {
          return snapshot["channel"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "channel")
        }
      }
    }
  }
}

public final class OnCreateRequestStreamingSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateRequestStreaming {\n  onCreateRequestStreaming {\n    __typename\n    id\n    cameraId\n    userId\n    time\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateRequestStreaming", type: .object(OnCreateRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateRequestStreaming: OnCreateRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateRequestStreaming": onCreateRequestStreaming.flatMap { $0.snapshot }])
    }

    public var onCreateRequestStreaming: OnCreateRequestStreaming? {
      get {
        return (snapshot["onCreateRequestStreaming"] as? Snapshot).flatMap { OnCreateRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateRequestStreaming")
      }
    }

    public struct OnCreateRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestStreaming"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
        GraphQLField("userId", type: .scalar(GraphQLID.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var cameraId: GraphQLID? {
        get {
          return snapshot["cameraId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var userId: GraphQLID? {
        get {
          return snapshot["userId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class OnUpdateRequestStreamingSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateRequestStreaming {\n  onUpdateRequestStreaming {\n    __typename\n    id\n    cameraId\n    userId\n    time\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateRequestStreaming", type: .object(OnUpdateRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateRequestStreaming: OnUpdateRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateRequestStreaming": onUpdateRequestStreaming.flatMap { $0.snapshot }])
    }

    public var onUpdateRequestStreaming: OnUpdateRequestStreaming? {
      get {
        return (snapshot["onUpdateRequestStreaming"] as? Snapshot).flatMap { OnUpdateRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateRequestStreaming")
      }
    }

    public struct OnUpdateRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestStreaming"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
        GraphQLField("userId", type: .scalar(GraphQLID.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var cameraId: GraphQLID? {
        get {
          return snapshot["cameraId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var userId: GraphQLID? {
        get {
          return snapshot["userId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class OnDeleteRequestStreamingSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteRequestStreaming {\n  onDeleteRequestStreaming {\n    __typename\n    id\n    cameraId\n    userId\n    time\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteRequestStreaming", type: .object(OnDeleteRequestStreaming.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteRequestStreaming: OnDeleteRequestStreaming? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteRequestStreaming": onDeleteRequestStreaming.flatMap { $0.snapshot }])
    }

    public var onDeleteRequestStreaming: OnDeleteRequestStreaming? {
      get {
        return (snapshot["onDeleteRequestStreaming"] as? Snapshot).flatMap { OnDeleteRequestStreaming(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteRequestStreaming")
      }
    }

    public struct OnDeleteRequestStreaming: GraphQLSelectionSet {
      public static let possibleTypes = ["RequestStreaming"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("cameraId", type: .scalar(GraphQLID.self)),
        GraphQLField("userId", type: .scalar(GraphQLID.self)),
        GraphQLField("time", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, cameraId: GraphQLID? = nil, userId: GraphQLID? = nil, time: String? = nil) {
        self.init(snapshot: ["__typename": "RequestStreaming", "id": id, "cameraId": cameraId, "userId": userId, "time": time])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var cameraId: GraphQLID? {
        get {
          return snapshot["cameraId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var userId: GraphQLID? {
        get {
          return snapshot["userId"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "userId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }
    }
  }
}

public final class OnCreateDetectMotionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateDetectMotion {\n  onCreateDetectMotion {\n    __typename\n    cameraId\n    time\n    persons\n    objects\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateDetectMotion", type: .object(OnCreateDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateDetectMotion: OnCreateDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateDetectMotion": onCreateDetectMotion.flatMap { $0.snapshot }])
    }

    public var onCreateDetectMotion: OnCreateDetectMotion? {
      get {
        return (snapshot["onCreateDetectMotion"] as? Snapshot).flatMap { OnCreateDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateDetectMotion")
      }
    }

    public struct OnCreateDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["DetectMotion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("persons", type: .list(.scalar(String.self))),
        GraphQLField("objects", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
        self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cameraId: GraphQLID {
        get {
          return snapshot["cameraId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var persons: [String?]? {
        get {
          return snapshot["persons"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "persons")
        }
      }

      public var objects: [String?]? {
        get {
          return snapshot["objects"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "objects")
        }
      }
    }
  }
}

public final class OnUpdateDetectMotionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateDetectMotion {\n  onUpdateDetectMotion {\n    __typename\n    cameraId\n    time\n    persons\n    objects\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateDetectMotion", type: .object(OnUpdateDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateDetectMotion: OnUpdateDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateDetectMotion": onUpdateDetectMotion.flatMap { $0.snapshot }])
    }

    public var onUpdateDetectMotion: OnUpdateDetectMotion? {
      get {
        return (snapshot["onUpdateDetectMotion"] as? Snapshot).flatMap { OnUpdateDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateDetectMotion")
      }
    }

    public struct OnUpdateDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["DetectMotion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("persons", type: .list(.scalar(String.self))),
        GraphQLField("objects", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
        self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cameraId: GraphQLID {
        get {
          return snapshot["cameraId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var persons: [String?]? {
        get {
          return snapshot["persons"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "persons")
        }
      }

      public var objects: [String?]? {
        get {
          return snapshot["objects"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "objects")
        }
      }
    }
  }
}

public final class OnDeleteDetectMotionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteDetectMotion {\n  onDeleteDetectMotion {\n    __typename\n    cameraId\n    time\n    persons\n    objects\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteDetectMotion", type: .object(OnDeleteDetectMotion.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteDetectMotion: OnDeleteDetectMotion? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteDetectMotion": onDeleteDetectMotion.flatMap { $0.snapshot }])
    }

    public var onDeleteDetectMotion: OnDeleteDetectMotion? {
      get {
        return (snapshot["onDeleteDetectMotion"] as? Snapshot).flatMap { OnDeleteDetectMotion(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteDetectMotion")
      }
    }

    public struct OnDeleteDetectMotion: GraphQLSelectionSet {
      public static let possibleTypes = ["DetectMotion"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("cameraId", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("time", type: .scalar(String.self)),
        GraphQLField("persons", type: .list(.scalar(String.self))),
        GraphQLField("objects", type: .list(.scalar(String.self))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(cameraId: GraphQLID, time: String? = nil, persons: [String?]? = nil, objects: [String?]? = nil) {
        self.init(snapshot: ["__typename": "DetectMotion", "cameraId": cameraId, "time": time, "persons": persons, "objects": objects])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var cameraId: GraphQLID {
        get {
          return snapshot["cameraId"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "cameraId")
        }
      }

      public var time: String? {
        get {
          return snapshot["time"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "time")
        }
      }

      public var persons: [String?]? {
        get {
          return snapshot["persons"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "persons")
        }
      }

      public var objects: [String?]? {
        get {
          return snapshot["objects"] as? [String?]
        }
        set {
          snapshot.updateValue(newValue, forKey: "objects")
        }
      }
    }
  }
}

public final class OnCreateGuestCollectionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateGuestCollection {\n  onCreateGuestCollection {\n    __typename\n    id\n    name\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateGuestCollection", type: .object(OnCreateGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateGuestCollection: OnCreateGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateGuestCollection": onCreateGuestCollection.flatMap { $0.snapshot }])
    }

    public var onCreateGuestCollection: OnCreateGuestCollection? {
      get {
        return (snapshot["onCreateGuestCollection"] as? Snapshot).flatMap { OnCreateGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateGuestCollection")
      }
    }

    public struct OnCreateGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["GuestCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class OnUpdateGuestCollectionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateGuestCollection {\n  onUpdateGuestCollection {\n    __typename\n    id\n    name\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateGuestCollection", type: .object(OnUpdateGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateGuestCollection: OnUpdateGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateGuestCollection": onUpdateGuestCollection.flatMap { $0.snapshot }])
    }

    public var onUpdateGuestCollection: OnUpdateGuestCollection? {
      get {
        return (snapshot["onUpdateGuestCollection"] as? Snapshot).flatMap { OnUpdateGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateGuestCollection")
      }
    }

    public struct OnUpdateGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["GuestCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class OnDeleteGuestCollectionSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteGuestCollection {\n  onDeleteGuestCollection {\n    __typename\n    id\n    name\n    guests {\n      __typename\n      items {\n        __typename\n        id\n        name\n        recognitionId\n        facePhotos\n      }\n      nextToken\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteGuestCollection", type: .object(OnDeleteGuestCollection.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteGuestCollection: OnDeleteGuestCollection? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteGuestCollection": onDeleteGuestCollection.flatMap { $0.snapshot }])
    }

    public var onDeleteGuestCollection: OnDeleteGuestCollection? {
      get {
        return (snapshot["onDeleteGuestCollection"] as? Snapshot).flatMap { OnDeleteGuestCollection(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteGuestCollection")
      }
    }

    public struct OnDeleteGuestCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["GuestCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("guests", type: .object(Guest.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, guests: Guest? = nil) {
        self.init(snapshot: ["__typename": "GuestCollection", "id": id, "name": name, "guests": guests.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var guests: Guest? {
        get {
          return (snapshot["guests"] as? Snapshot).flatMap { Guest(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "guests")
        }
      }

      public struct Guest: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelGuestConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .list(.object(Item.selections))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(items: [Item?]? = nil, nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelGuestConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var items: [Item?]? {
          get {
            return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
          }
          set {
            snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }

        public struct Item: GraphQLSelectionSet {
          public static let possibleTypes = ["Guest"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("recognitionId", type: .scalar(String.self)),
            GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
            self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return snapshot["id"]! as! GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return snapshot["name"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var recognitionId: String? {
            get {
              return snapshot["recognitionId"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "recognitionId")
            }
          }

          public var facePhotos: [String]? {
            get {
              return snapshot["facePhotos"] as? [String]
            }
            set {
              snapshot.updateValue(newValue, forKey: "facePhotos")
            }
          }
        }
      }
    }
  }
}

public final class OnCreateGuestSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnCreateGuest {\n  onCreateGuest {\n    __typename\n    id\n    name\n    recognitionId\n    facePhotos\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onCreateGuest", type: .object(OnCreateGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onCreateGuest: OnCreateGuest? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onCreateGuest": onCreateGuest.flatMap { $0.snapshot }])
    }

    public var onCreateGuest: OnCreateGuest? {
      get {
        return (snapshot["onCreateGuest"] as? Snapshot).flatMap { OnCreateGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onCreateGuest")
      }
    }

    public struct OnCreateGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["Guest"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("recognitionId", type: .scalar(String.self)),
        GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
        self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var recognitionId: String? {
        get {
          return snapshot["recognitionId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recognitionId")
        }
      }

      public var facePhotos: [String]? {
        get {
          return snapshot["facePhotos"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "facePhotos")
        }
      }
    }
  }
}

public final class OnUpdateGuestSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnUpdateGuest {\n  onUpdateGuest {\n    __typename\n    id\n    name\n    recognitionId\n    facePhotos\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onUpdateGuest", type: .object(OnUpdateGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onUpdateGuest: OnUpdateGuest? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onUpdateGuest": onUpdateGuest.flatMap { $0.snapshot }])
    }

    public var onUpdateGuest: OnUpdateGuest? {
      get {
        return (snapshot["onUpdateGuest"] as? Snapshot).flatMap { OnUpdateGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onUpdateGuest")
      }
    }

    public struct OnUpdateGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["Guest"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("recognitionId", type: .scalar(String.self)),
        GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
        self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var recognitionId: String? {
        get {
          return snapshot["recognitionId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recognitionId")
        }
      }

      public var facePhotos: [String]? {
        get {
          return snapshot["facePhotos"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "facePhotos")
        }
      }
    }
  }
}

public final class OnDeleteGuestSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnDeleteGuest {\n  onDeleteGuest {\n    __typename\n    id\n    name\n    recognitionId\n    facePhotos\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onDeleteGuest", type: .object(OnDeleteGuest.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onDeleteGuest: OnDeleteGuest? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onDeleteGuest": onDeleteGuest.flatMap { $0.snapshot }])
    }

    public var onDeleteGuest: OnDeleteGuest? {
      get {
        return (snapshot["onDeleteGuest"] as? Snapshot).flatMap { OnDeleteGuest(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onDeleteGuest")
      }
    }

    public struct OnDeleteGuest: GraphQLSelectionSet {
      public static let possibleTypes = ["Guest"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("recognitionId", type: .scalar(String.self)),
        GraphQLField("facePhotos", type: .list(.nonNull(.scalar(String.self)))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, name: String, recognitionId: String? = nil, facePhotos: [String]? = nil) {
        self.init(snapshot: ["__typename": "Guest", "id": id, "name": name, "recognitionId": recognitionId, "facePhotos": facePhotos])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return snapshot["name"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var recognitionId: String? {
        get {
          return snapshot["recognitionId"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "recognitionId")
        }
      }

      public var facePhotos: [String]? {
        get {
          return snapshot["facePhotos"] as? [String]
        }
        set {
          snapshot.updateValue(newValue, forKey: "facePhotos")
        }
      }
    }
  }
}
