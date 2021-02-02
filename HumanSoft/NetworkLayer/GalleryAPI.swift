//
//  ClientAPI.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import Foundation

protocol GalleryAPIType {
    func getUserInfo(completion: @escaping (_ list: AllUsersInfo) -> Void)
    func getAlbums(userId: Int, completion: @escaping (_ list: Albums) -> Void)
    func getPhotos(albumId: Int, completion: @escaping (_ list: Photos) -> Void)
}

class GalleryAPI: GalleryAPIType {
    
    func getUserInfo(completion: @escaping (_ list: AllUsersInfo) -> Void) {
        let endPoint = EndPoints.users
        GenericClientApi.CallApi(endPoint: endPoint) { (result: AllUsersInfo?, error: Error?, code) in
            guard let resultResponse = result else { return }
            completion(resultResponse)
        }
    }
    
    func getAlbums(userId: Int, completion: @escaping (Albums) -> Void) {
        let endPoint = EndPoints.albums(parameter: ["userId" : userId])
        GenericClientApi.CallApi(endPoint: endPoint) { (result: Albums?, error: Error?, code) in
            guard let resultResponse = result else { return }
            completion(resultResponse)
        }
    }
    
    func getPhotos(albumId: Int, completion: @escaping (Photos) -> Void) {
        let endPoint = EndPoints.photos(parameter: ["albumId" : albumId])
        GenericClientApi.CallApi(endPoint: endPoint) { (result: Photos?, error: Error?, code) in
            guard let resultResponse = result else { return }
            completion(resultResponse)
        }
    }

}
