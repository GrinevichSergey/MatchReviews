//
//  CommandCell.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit
import WebKit

class CommandCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextView!
   
    @IBOutlet weak var video: WKWebView!
    
    func configure(with comment: Comment) {
        self.label.text = comment.title
      //  self.textView.text = comment.embed

        let queue = DispatchQueue.global(qos: .utility)
        queue.async{
                DispatchQueue.main.async {
                    self.video.loadHTMLString(comment.embed, baseURL: nil)
            }
        }
       
        

    }
}
