//
//  UITableView.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/9/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

extension UITableView{
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
}
