//
//  NetworkManagar.swift
//  Hadith Treasure
//
//  Created by wahid tariq on 27/05/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let categoriesURL = URL(string: "https://hadeethenc.com/api/v1/categories/list/?language=en")!
    
    private init() { }
    
    func fetchHadeethCategories() async throws -> [HadeethCategoriesDataModel] {
        let data = try await URLSession.shared.data(for: URLRequest(url: categoriesURL))
        return try JSONDecoder().decode([HadeethCategoriesDataModel].self, from: data.0)
    }
}
