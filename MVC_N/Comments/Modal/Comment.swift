//
//  Comment.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import Foundation

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
struct Comment {
    var title : String
    var embed : String

    
    init?(dict: [String: AnyObject]) {
        guard let title = dict["title"] as? String,
        let embed = dict["embed"] as? String
    else { return nil  }
        
        self.title = title
        self.embed = embed

    }
}
