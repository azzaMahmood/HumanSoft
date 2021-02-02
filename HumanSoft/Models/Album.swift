//
//  Album.swift
//  HumanSoft
//
//  Created by Azza on 02/02/2021.
//

import Foundation

// MARK: - Album
struct Album: Codable {
    let userId, id: Int
    let title: String
}

typealias Albums = [Album]
