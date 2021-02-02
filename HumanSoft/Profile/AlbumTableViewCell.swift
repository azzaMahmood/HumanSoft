//
//  AlbumTableViewCell.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumTitleLabel: UILabel!
    
    func configureCellDescription(albumTitle: String) {
        self.albumTitleLabel.text = albumTitle
    }
}
