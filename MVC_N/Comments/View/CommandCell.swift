//
//  CommandCell.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import AlamofireImage

class CommandCell: UITableViewCell {
    
    
    @IBOutlet weak var LigaNameLabel: UILabel!
    @IBOutlet weak var matchesLabel: UILabel!
    @IBOutlet weak var imageMatches : UIImageView!
    
    
    @IBOutlet weak var scores: UILabel!
    
    
    
    func configure(with comment: Comment) {
        
        
        self.LigaNameLabel.text = comment.name
        self.matchesLabel.text = comment.title

        DispatchQueue.main.async {
            self.imageMatches.layer.cornerRadius = self.imageMatches.frame.size.width / 2
            self.imageMatches.clipsToBounds = true
            
            
            Alamofire.request(comment.thumbnail).responseImage { (response) in
                print(response)
                if let image = response.result.value {
                    DispatchQueue.main.async {
                        self.imageMatches?.image = image
                    }
                    
                }
            }
            
            
            //            let data = NSData(contentsOf: NSURL(string: comment.thumbnail)! as URL)
            //            guard data != nil else {return  }
            //
            //            self.imageMatches.image = UIImage(data: data! as Data)
            //
            //
        }
        
    }
    
    
}


