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
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String?
    
    let manager = NetworkManager.shared
    
    @MainActor
    func fetchHadeethCategories() async {
        showLoader(true)
        do {
           let categories = try await manager.fetchHadeethCategories()
            append(categories: categories)
        } catch {
            showLoader(false)
            showAlert(true, error: error)
        }
    }
    
    func append(categories: [HadeethCategoriesDataModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.hadeethCategories = categories
            self?.showLoader(false)
        }
    }
    
    func showAlert(_ show: Bool, error: Error?) {
        DispatchQueue.main.async {
            self.alertTitle = "Hmm looks like."
            self.alertMessage = (error as? NSError)?.localizedDescription
            self.showAlert = true
        }
    }
    
    func showLoader(_ show: Bool) {
        DispatchQueue.main.async {
            self.canShowLoader = show
        }
    }
}
