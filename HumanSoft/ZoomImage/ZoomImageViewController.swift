//
//  ZoomImageViewController.swift
//  HumanSoft
//
//  Created by Azza on 03/02/2021.
//

import UIKit
import Kingfisher

class ZoomImageViewController: UIViewController {

    @IBOutlet weak var zoomImage: UIImageView!
    var imageUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zoomImage.enableZoom()

        if let url = URL(string: imageUrl) {
            zoomImage.kf.setImage(with: url)
        }
    }
    

}
