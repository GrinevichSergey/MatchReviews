//
//  MenuOptionsCell.swift
//  MVC_N
//
//  Created by Сергей Гриневич on 06/05/2019.
//  Copyright © 2019 Green. All rights reserved.
//

import UIKit

class MenuOptionsCell: UITableViewCell {
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
         iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
     
        return iv
    }()
    
    let discriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "LigaName"
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .darkGray
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        addSubview(discriptionLabel)
        
        discriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        discriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        discriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
