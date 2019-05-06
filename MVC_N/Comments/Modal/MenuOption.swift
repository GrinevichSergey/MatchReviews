//
//  MenuOption.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 06/05/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit

enum MenuOptions: Int, CustomStringConvertible {
    
    
    case LaLiga
    case EnglandLiga
    case BundesLiga
    case RFPL
    case SeriaA
    case LigaA
    case champLiga
    
    var description: String {
        switch self {
     
        case .LaLiga:
            return "LaLiga"
        case .EnglandLiga:
            return "EnglandLiga"
        case .BundesLiga:
            return "BundesLiga"
        case .RFPL:
            return "RFPL"
        case .SeriaA:
            return "SeriaA"
        case .LigaA:
            return "LigaA"
        case .champLiga:
            return "Campion Liga"
        }
    
    }
    
    var image: UIImage {
        switch self {
            
        case .LaLiga:
            return UIImage(named: "laliga") ?? UIImage()
        case .EnglandLiga:
            return UIImage(named: "EnglandLiga") ?? UIImage()
        case .BundesLiga:
            return UIImage(named: "bundesliga") ?? UIImage()
        case .RFPL:
            return UIImage(named: "rfpl") ?? UIImage()
        case .SeriaA:
            return UIImage(named: "seria") ?? UIImage()
        case .LigaA:
            return UIImage(named: "franc") ?? UIImage()
        case .champLiga:
             return UIImage(named: "champLiga") ?? UIImage()
        }
    }
}
