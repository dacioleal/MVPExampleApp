//
//  MainView.swift
//  MVPExampleApp
//
//  Created by Dacio Leal Rodriguez on 22/12/2019.
//  Copyright © 2019 Dacio Leal Rodriguez. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
        self.tableView = UITableView(frame: frame, style: .plain)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.tableView)
        
        let views = ["tableView":self.tableView!]
        var constraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        constraints = constraints + NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: .directionLeadingToTrailing, metrics: nil, views: views)
        self.addConstraints(constraints)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
