//
//  ChatViewController.swift
//  Class Chat
//
//  Created by Angeli Faith Deanon on 12/7/20.
//

import UIKit
import MessageKit

struct Sender: SenderType{
    var senderId: String
    var displayName: String
}

struct Message: MessageType{
    var sender: SenderType
    var messageId: String
    var sentDate: Date
    var kind: MessageKind
}

class ChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate{
    
    let currentUser = Sender(senderId: "self", displayName: "faith")
    let otherUser = Sender(senderId: "other", displayName: "John Smith")

    var messages = [MessageType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
        messages.append(Message(sender: currentUser,
                                messageId: "1",
                                sentDate: Date().addingTimeInterval(-86400),
                                kind: .text("Hello")))
        messages.append(Message(sender: otherUser,
                                messageId: "2",
                                sentDate: Date().addingTimeInterval(-76400),
                                kind: .text("HI")))
        messages.append(Message(sender: otherUser,
                                messageId: "3",
                                sentDate: Date().addingTimeInterval(-76400),
                                kind: .text("What's up?")))
        
        // Do any additional setup after loading the view.
    }
    
    func currentSender() -> SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
