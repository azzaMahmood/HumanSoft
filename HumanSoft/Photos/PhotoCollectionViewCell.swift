//
//  PhotoCollectionViewCell.swift
//  HumanSoft
//
//  Created by Azza on 03/02/2021.
//

import UIKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImageView: UIImageView!
    
    func configureCellDisplayImage(url: String) {
        if let url = URL(string: url) {
            galleryImageView.kf.setImage(with: url)

               // self.galleryImageView.image = UIImage(data: data)
        }
    }
}
