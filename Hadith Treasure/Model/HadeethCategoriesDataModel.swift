//
//  File.swift
//  Hadith Treasure
//
//  Created by wahid tariq on 27/05/23.
//

import Foundation

// MARK: - Category
struct HadeethCategoriesDataModel: Codable, Identifiable {
    let id, title, hadeethsCount: String
    let parentID: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title
        case hadeethsCount = "hadeeths_count"
        case parentID = "parent_id"
    }
}

extension HadeethCategoriesDataModel {
    
    static var `default`: Self {
        .init(id: "1", title: "Test", hadeethsCount: "1", parentID: nil)
    }
}
