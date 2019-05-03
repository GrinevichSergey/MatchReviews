//
//  CommentNetworkService.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import Foundation


class CommentNetworkService {
    private init() {}
    
    static func GetComments(completion: @escaping(GetCommentResponce) -> ()) {
        guard let url = URL(string: "https://www.scorebat.com/video-api/v1/")
            
        else
        {
            return
        }
        
        NetWorkService.shared.GetData(url: url) { (json) in
            do {
                let response = try GetCommentResponce(json: json)
                completion(response)
              
            }
            catch {
                print(error)
            }
        }
    }
}
