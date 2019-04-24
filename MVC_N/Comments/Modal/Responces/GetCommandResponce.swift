//
//  GetCommandResponce.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import Foundation


struct GetCommentResponce {
    
    let comments : [Comment]
    
    init(json: Any) throws {
        guard let array =  json as? [[String: AnyObject]] else {throw NetworkError.fileInternetError}
        
        var comments = [Comment]()
        for dictionary in array {
            guard let comment = Comment(dict: dictionary) else { continue }
            
           comments.append(comment)
        }
        
      self.comments = comments
    }
    
}
