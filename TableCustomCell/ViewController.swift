//
//  ViewController.swift
//  TableCustomCell
//
//  Created by 권성우 on 2020/07/21.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
struct ChatMessage {
    var text : String
    var isIncoming : Bool
}
class ViewController: UITableViewController {
    
    let cellId = "id"
    let chatMessages = [
        ChatMessage(text: "I am going to send you a message", isIncoming: true),
        ChatMessage(text: "I am going to send you a message that is longer than before", isIncoming: false),
        ChatMessage(text: "I am going to send you a message that is the longest i've ever sent to someone", isIncoming: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell
        let chatMessage = chatMessages[indexPath.row]
        cell.chatMessage = chatMessage
        
        return cell
    }
}

