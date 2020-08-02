//
//  ChatMessageCell.swift
//  TableCustomCell
//
//  Created by 권성우 on 2020/07/21.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import SnapKit

class ChatMessageCell: UITableViewCell {

    let messageLabel = UILabel()
    let bubbleBackgroundView = UIView()
    
    var chatMessage : ChatMessage {
        didSet{
            bubbleBackgroundView.backgroundColor = chatMessage .isIncoming ? .white : .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
        }
    }
//    var isIncoming : Bool!{
//        didSet{
//            bubbleBackgroundView.backgroundColor = isIncoming ? .white : .darkGray
//            messageLabel.textColor = isIncoming ? .black : .white
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubbleBackgroundView.backgroundColor = .green
        bubbleBackgroundView.layer.cornerRadius = 1
        
        addSubview(bubbleBackgroundView)
        addSubview(messageLabel)
        
        //set constraints
        messageLabel.snp.makeConstraints { (m) in
            m.top.equalTo(self).offset(32)
            m.leading.equalTo(self).offset(32)
            m.bottom.equalTo(self).offset(-32)
            m.width.lessThanOrEqualTo(250)
        }
        bubbleBackgroundView.snp.makeConstraints { (m) in
            m.top.equalTo(messageLabel).offset(-16)
            m.leading.equalTo(messageLabel).offset(-16)
            m.bottom.equalTo(messageLabel).offset(16)
            m.trailing.equalTo(messageLabel).offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
