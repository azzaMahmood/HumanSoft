//
//  PhotoCollectionViewCell.swift
//  HumanSoft
//
//  Created by Azza on 03/02/2021.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    func configureCellDisplayImage(url: String) {
        if let url = URL(string: url),  let data = try? Data(contentsOf: url) {
            galleryImageView.image = UIImage(data: data)
        // let data = try? Data(contentsOf: url)
            
        }
      //  self.albumTitleLabel.text = albumTitle
    }
}
