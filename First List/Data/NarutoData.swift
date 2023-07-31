//
//  NarutoData.swift
//  First List
//
//  Created by Erix on 28/07/23.
//

import Foundation

// MARK: - Welcome
struct NarutoData: Codable {
    let clans: [Clan]
    let currentPage, pageSize: String
    let totalClans: Int
}


// MARK: - Clan
struct Clan: Codable {
    let id: Int
    let name: String
    let characters: [Character]
}

// MARK: - Character
struct Character: Codable {
    let id: Int
    let name: String
    let images: [String]
    let jutsu: [String]?
    let tools, natureType, uniqueTraits: [String]?    
}
