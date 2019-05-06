//
//  Comment.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

/*
 "title": "Chelsea - Manchester United",
 "embed": "...",
 "url": "...",
 "thumbnail": "...",
 "side1": {
 "name": "Chelsea",
 "url": "..."
 },
 "side2": {
 "name": "Manchester United",
 "url": "..."
 },
 "competition": {
 "name": "ENGLAND: Premier League",
 "id": 15,
 "url": "..."
 },
 "videos": [
 {
 "title": "Highlights",
 "embed": "...",
 },
 {
 */

struct Video {
    var title: String
    var embed: String
}


struct Comment2: Codable {
    var title : String
    var embed : String

}

typealias MOY_HUI = (String, String)

struct Comment {
    var title : String
    var embed : String
    var thumbnail : String
    var name : String
    var thumbnail_image = UIImage()
    
    var titleVideo: String
    var embedVideo: String
    
    var videos: Array<Dictionary<String, Any>>
    
    init?(dict: [String: AnyObject]) {
       // let moyHui: MOY_HUI = ("MOY", "hui")
        
        guard let title = dict["title"] as? String,
            let embed = dict["embed"] as? String,
            let thumbnail = dict["thumbnail"] as? String,
            
            let competition = dict["competition"] as? [String: AnyObject],
            let name = competition["name"] as? String,
            
            let videos = dict["videos"] as? Array<Dictionary<String, Any>>,
            
            
            let titleVideo = videos[0]["title"] as? String,
            let embedVideo = videos[0]["embed"] as? String
            
            
            else { return nil  }
        
        //        for anItem in dict["videos"] as! Array<Dictionary<String, Any>> { // or [[String:AnyObject]]
        //            let titleVideo = anItem["title"] as! String
        //            let embedVideo = anItem["embed"] as! String
        //            // do something with personName and personID
        //            print(titleVideo)
        //            print(embedVideo)
        //
        //        }
        
        
        
        self.title = title
        self.embed = embed
        
        self.thumbnail = thumbnail
        self.name = name
        
        self.titleVideo = titleVideo
        self.embedVideo = embedVideo
        
        self.videos = videos
        
        print(self.videos)
        
        
//        let array = ["1","2","3", "2"]
//       let object =  array.filter { (nameLiga) -> Bool in
//          return nameLiga == "2"
//        }
//
//        print(object)
    }
    
    
}

