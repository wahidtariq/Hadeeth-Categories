//
//  ContentView.swift
//  Hadith Treasure
//
//  Created by wahid tariq on 27/05/23.
//

import SwiftUI

struct HadeethCategoryView: View {
    
    @StateObject var viewModel = HadeethCategoryViewModel()
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: Text("NewView")) {
                hadithsListView
                    .foregroundColor(.primary)
            }
            .navigationTitle("Categories")
        }
        .onAppear {
            fetchHadeethCategories()
        }
        .addLoader(loading: viewModel.canShowLoader)
    }
    
    var hadithsListView: some View {
        List {
            ForEach(viewModel.hadeethCategories, content: HadithViewCell.init)
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .padding(.top, 10)
            .padding(.horizontal, 10)
        }
        .listStyle(.plain)
    }
    
    private func fetchHadeethCategories() {
        Task {
           await viewModel.fetchHadeethCategories()
        }
    }
}

struct HadithViewCell: View {
    
    let category: HadeethCategoriesDataModel
    
    var body: some View {
        HStack {
            Text(category.title)
                .font(.title3)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            Spacer()
            Text(category.hadeethsCount + " hadith(s)")
                .font(.footnote)
        }
        .padding()
        .overlay {
            Color.gray.opacity(0.1)
                .frame(height: 60)
                .cornerRadius(50)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HadeethCategoryView()
    }
}
