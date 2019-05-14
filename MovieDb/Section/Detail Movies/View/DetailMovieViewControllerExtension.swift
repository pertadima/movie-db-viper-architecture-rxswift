//
//  DetailMovieViewControllerExtension.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/13/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//

import UIKit

extension DetailMoviesViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return detailSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch detailSection[section] {
        case .header, .desc, .genre:
            return (data != nil) ? 1 : 0
        case .cast:
            return (dataCast != nil) ? 1 : 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch detailSection[indexPath.section] {
        case .header:
            let cell = DetailMoviesHeaderCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: DetailMoviesHeaderCell.identifier)
            cell.configureData(data: self.data)
            return cell
        case .desc:
            let cell = DetailMovieDescCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: DetailMovieDescCell.identifier) 
            cell.configureData(data: self.data)
            return cell
        case .genre:
            let cell = HomeGenreMovieTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: HomeGenreMovieTableViewCell.identifier)
            cell.detailMoviePresenter = self.presentor
            cell.navigationController = self.navigationController
            cell.configureData(data: self.data?.genres)
            return cell
        case .cast:
            let cell = DetailMoviesCastCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: DetailMoviesCastCell.identifier)
            cell.configureCell(data: self.dataCast?.cast ?? [])
            return cell
        }
    }
}
