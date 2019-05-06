//
//  ViewController.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit
import WebKit

protocol  tableViewControllerDelegate {
    func toogleMenu(forMenuOption menuOption: MenuOptions?)
}



class CommentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var id: Int = 0
    
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var activityIndicate: UIActivityIndicatorView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var delegate: tableViewControllerDelegate?
    
    var comments = [Comment]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        
        CommentNetworkService.GetComments { (response) in
            self.comments = response.comments
            self.tableView.reloadData()
            self.tableView.estimatedRowHeight = 44.0
            
            
        }
        
    }
    
    @objc func handleMenuToggle() {
        delegate?.toogleMenu(forMenuOption: nil)
    }
    
    func configureNavigationBar()  {
        navigationController?.navigationBar.tintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Обзоры матчей"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image:  #imageLiteral(resourceName: "left top button").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
    
    @IBAction func presedMenuButton(_ sender: UIBarButtonItem) {
        
        // delegate?.toogleMenu(forMenuOption: nil)
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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

