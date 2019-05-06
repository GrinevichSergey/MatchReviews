//
//  ContainerViewController.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 04/05/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, tableViewControllerDelegate {

    
    var controller : UIViewController!
    var menuViewController: MenuViewController!
    var centerController: UIViewController!
    var isExpanded = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableViewController()

    }
    
  
    
    func configureMenuViewController()  {
        if menuViewController == nil
        {
            menuViewController = MenuViewController()
            menuViewController.delegate = self
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            menuViewController.didMove(toParent: self)

        }
    }
    
    func animatePanel(shouldExpand: Bool, menuOption: MenuOptions?) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }
        else
        {
     
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                   self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else {return}
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        
        animateStatusBar() 
    }
    
    func didSelectMenuOption(menuOption: MenuOptions) {
        switch menuOption {
       
        case .LaLiga:
            print("Filter")
        case .EnglandLiga:
             print("Filter")
        case .BundesLiga:
            print("Filter")
        case .RFPL:
             print("Filter")
        case .SeriaA:
             print("Filter")
        case .LigaA:
             print("Filter")
        case .champLiga:
             print("Filter")
             
            let videoVC = CommentsViewController()
            present(videoVC, animated: true, completion: nil)
        }
    }
    
    func animateStatusBar()  {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
           self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    func configureTableViewController()  {
        
        let vc = UIStoryboard(name: "Comments", bundle: nil).instantiateInitialViewController() as! CommentsViewController
        
        
    //    let HomeController = CommentsViewController()
        vc.delegate = self
        centerController  = UINavigationController(rootViewController: vc)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)

    }
    
    
    
    // MARK: tableViewControllerDelegate
    
    func toogleMenu(forMenuOption menuOption: MenuOptions?) {
        if !isExpanded {
            configureMenuViewController()
            
        }
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
    
}
