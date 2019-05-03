//
//  NetWorkService.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 14/04/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import Foundation


class NetWorkService {
    private init() {}
    
    static let shared = NetWorkService()
    
    public func GetData(url: URL, completion: @escaping (Any) -> ()) {
         let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do {
                let object = try JSONDecoder().decode([Comment2].self, from: data)
                print(object.first?.title)
                
                let json = try JSONSerialization.jsonObject(with: data, options: []) 
                DispatchQueue.main.async(execute: {
                    completion(json)
                })
              //  print(json)
            } catch{
                print(error)
            }
        }.resume()
    }
}
 
