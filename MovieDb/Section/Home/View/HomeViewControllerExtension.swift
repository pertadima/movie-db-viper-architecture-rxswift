//
//  HomeViewControllerExtension.swift
//  MovieDb
//
//  Created by Irfan Pertadima on 3/10/19.
//  Copyright © 2019 Irfan Pertadima. All rights reserved.
//
import UIKit

extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = HeaderTitleTableViewCell(frame: .zero)
        headerView.label.text = menuSection[section].title
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return menuSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch menuSection[section] {
        case .nowPlaying:
            return 1
        case .upComingMovie:
            return 1
        case .popularMovie:
            return dataPopularMovie.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch menuSection[indexPath.section] {
        case .nowPlaying:
            let cell = HomeNowPlayingTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: HomeNowPlayingTableViewCell.identifier)
            cell.configureData(data: dataPlayingNow)
            return cell
        case .upComingMovie:
            let cell = HomeUpcomingMovieTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: HomeUpcomingMovieTableViewCell.identifier)
            cell.configureData(data: data)
            return cell
        case .popularMovie:
            let cell = HomePopularMovieTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: HomePopularMovieTableViewCell.identifier)
            cell.configureCell(data: dataPopularMovie[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
