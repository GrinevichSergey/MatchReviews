//
//  ViewController.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit
import WebKit

class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var id: Int = 0
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var activityIndicate: UIActivityIndicatorView!
    
    
    
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommentNetworkService.GetComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
            
            
            
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommandCell
        let comment = comments[indexPath.row]
        cell.configure(with: comment)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = comments[indexPath.row]
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController
        print(vc as Any)
        vc?.videoMoments = comment
//        vc?.tableVideo.reloadData()
        self.navigationController?.pushViewController(vc!, animated: true)
        //        self.performSegue(withIdentifier: "toVideo", sender: comment)
    }
    
    
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "toVideo" {
    //            if let comment = sender as? Comment {
    //                let viewcontroller = segue.destination as! VideoViewController
    //                viewcontroller.videoMoments = comment
    //                viewcontroller.tableVideo.reloadData()
    //            }
    ////            if let indexpath = self.tableView.indexPathForSelectedRow {
    ////                viewcontroller.id = indexpath.row
    //
    ////            }
    //        }
    //    }
    
    
    
    
}

