//
//  BaseTableViewCell.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    open class var identifier: String { return String.className(self) }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addBackgroundColor(addColor: .clear)
        selectionStyle = .none
        self.prepareView()
        self.setConstraintsView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.prepareView()
        self.setConstraintsView()
    }
    
    func prepareView() {
        
    }
    
    func setConstraintsView() {
        
    }
}
