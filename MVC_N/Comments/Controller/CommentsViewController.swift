//
//  ViewController.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit
import WebKit

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
   

    
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommentNetworkService.GetComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
            
       
        }
        
    }
}


extension CommentsViewController: UITabBarDelegate {}

extension CommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommandCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        return cell
    }
}

