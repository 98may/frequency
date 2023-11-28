//
//  Constants.swift
//  Messenger iOS app
//
//  Created by Ayan on 11/20/2023.
//

struct constantsContainer {
    static let appName = "Messenger"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
