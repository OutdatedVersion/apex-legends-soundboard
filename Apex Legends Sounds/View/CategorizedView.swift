//
//  CategorizedView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/20/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

struct CategorizedItem<LinkView: View>: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let linkView: () -> LinkView
}

struct CategoryRow<LinkView: View>: View {
    let categoryName: String
    let items: [CategorizedItem<LinkView>]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                   .font(.headline)
                   .padding(.leading, 10)
                   .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
               HStack(alignment: .top, spacing: 0) {
                ForEach(self.items) { item in
                    NavigationLink(destination: item.linkView()) {
                    CategoryRowEntry(caption: item.name, imageName: item.imageName)
                  }
                    
                  .simultaneousGesture(
                    TapGesture().onEnded({
                       UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    })
                  )
               }
             }
           }

           .frame(height: 185)
        }
    }
}

struct CategoryRowEntry: View {
    let caption: String
    let imageName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(self.imageName)
                .resizable()
                .frame(width: 125, height: 125)
                .cornerRadius(5)
            
            Text(self.caption)
                .font(.caption)
        }
            
        .padding(.leading, 15)
    }
}

//struct CategorizedView: View {
//    let items: [Item]
//    let categoryOrder: [String]
//
//    var groupedItems: [String: [Item]] {
//        Dictionary(
//            grouping: self.items,
//            by: { $0.category }
//        )
//    }
//
//    init(categoryOrder: [String], items: [Item]) {
//        self.items = items
//        self.categoryOrder = categoryOrder
//
//    }
//
//    var body: some View {
//        T
//    }
//}

//struct CategorizedView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategorizedView()
//    }
//}
