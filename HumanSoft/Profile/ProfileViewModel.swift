//
//  ProfileViewModel.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import Foundation

class ProfileViewModel {
    
    let galleryAPI: GalleryAPIType
    private var userInfo: UserInfo?
    var albums: Dynamic<Albums?> = Dynamic(nil)
    var name = Dynamic("")
    var address = Dynamic("")
    
    init(galleryAPI: GalleryAPIType) {
        self.galleryAPI = galleryAPI
        galleryAPI.getUserInfo { [weak self] (usersData) in
            guard let responseData = usersData.first else { return }
            self?.userInfo = responseData
            self?.name.value = responseData.name
            self?.getAddress()
            galleryAPI.getAlbums(userId: responseData.id) { [weak self] (albumsData) in
                self?.albums.value = albumsData
            }
        }
    }
    
    private func getAddress() {
        guard let userInfo = userInfo else { return }
        address.value = "\(String(describing: userInfo.address.street)), \(String(describing: userInfo.address.suite)), \(String(describing: userInfo.address.city)), \(String(describing: userInfo.address.zipcode))"
    }
    
}
