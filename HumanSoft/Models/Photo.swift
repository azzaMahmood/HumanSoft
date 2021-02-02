//
//  Photo.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    let albumId, id: Int
    let title: String
    let url, thumbnailUrl: String
}

typealias Photos = [Photo]
