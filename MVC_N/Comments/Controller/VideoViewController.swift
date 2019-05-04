//
//  VideoViewController.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 16/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit
import WebKit

class VideoCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect.zero)
        return titleLabel
    }()
    
    lazy var webView: WKWebView = {
        let webView = WKWebView(frame: .zero)
        return webView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(webView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        
        
        webView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        webView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4).isActive = true
        webView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        webView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -4).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureVideo(with comment: Dictionary<String, Any>) {
        
        if let text = comment["title"] as? String,
            let video = comment["embed"] as? String {
            self.titleLabel.text = text
            self.webView.loadHTMLString(video, baseURL: nil)
        }
        
        //        if comment.titleVideo == "Highlights"
        //        {
        //            self.matchesName.text = "Обзор матча"
        //        }
        //        else
        //        {
        //            self.matchesName.text = comment.titleVideo
        //        }
        //        self.wkWebViewVideo.loadHTMLString(comment.embedVideo, baseURL: nil)
        //
        
        
        
    }
}


class VideoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    
    var videoMoments: Comment?//: [] = [Comment]()
    @IBOutlet weak var tableVideo: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.kek = "sdf"
        tableVideo.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
        self.tableVideo.reloadData()
        //        CommentNetworkService.GetComments { (response) in
        //            self.videoMoments = response.comments
        //            self.tableVideo.reloadData()
        //            self.tableVideo.delegate = self
        //            self.tableVideo.dataSource = self
        //            self.tableVideo.isHidden = true
        //
        //
        //
        //        }
        //
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let videoMoments = videoMoments else { return 0 }
        return videoMoments.videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let videoMoments = videoMoments else { return UITableViewCell(style: .default, reuseIdentifier: "cell") }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoCell
        let videoMoment = videoMoments.videos[indexPath.row]
        cell.configureVideo(with: videoMoment)
//                cell.configureVideo(/with: videoMoment)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    
    
}
