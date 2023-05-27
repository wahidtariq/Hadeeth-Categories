//
//  HadeethCategoryViewModel.swift
//  Hadith Treasure
//
//  Created by wahid tariq on 27/05/23.
//

import Foundation
import SwiftUI

class HadeethCategoryViewModel: ObservableObject {
    
    @Published var hadeethCategories = [HadeethCategoriesDataModel]()
    @Published var canShowLoader: Bool = false
    let manager = NetworkManager.shared
    
    @MainActor
    func fetchHadeethCategories() async {
        showLoader(true)
        do {
           let categories = try await manager.fetchHadeethCategories()
            append(categories: categories)
        } catch {
            print(error.localizedDescription)
            showLoader(false)
        }
    }
    
    func append(categories: [HadeethCategoriesDataModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.hadeethCategories = categories
            self?.showLoader(false)
        }
    }
    
    func showLoader(_ show: Bool) {
        DispatchQueue.main.async {
            self.canShowLoader = show
        }
    }
}
