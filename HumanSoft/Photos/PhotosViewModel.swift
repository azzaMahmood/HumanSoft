//
//  PhotosViewModel.swift
//  HumanSoft
//
//  Created by Azza on 03/02/2021.
//

import Foundation

class PhotosViewModel {
    
    let galleryAPI: GalleryAPIType
    var albumId = 0
    var photos: Dynamic<Photos?> = Dynamic(nil)


    init(galleryAPI: GalleryAPIType) {
        self.galleryAPI = galleryAPI
        galleryAPI.getPhotos(albumId: albumId) { [weak self] (photos) in
            self?.photos.value = photos
        }
    }
    
    
}
