//
//  PhotosViewController.swift
//  HumanSoft
//
//  Created by Azza on 03/02/2021.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet weak var photosSearchBar: UISearchBar!
    @IBOutlet weak var photosCollectionView: UICollectionView!
    
    let viewModel = PhotosViewModel(galleryAPI: GalleryAPI())
    var photosData: Photos?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        navigationController?.navigationBar.prefersLargeTitles = true
        photosCollectionView.reloadData()
    }
    
    private func setupCollectionView() {
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
        viewModel.photos.bind { [weak self] (photos) in
            self?.photosData = photos
            DispatchQueue.main.async {
                self?.photosCollectionView.reloadData()
            }
        }
    }

}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.frame.width / 3, height: 135)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as? PhotoCollectionViewCell
        else {
            fatalError("No cell is found")
        }
        if let photosData = photosData?[indexPath.item] {
            cell.configureCellDisplayImage(url: photosData.url)
        }
        return cell
    }
    
}
