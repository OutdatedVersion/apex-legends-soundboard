//
//  CategorizedView.swift
//  Apex Legends Sounds
//
//  Created by Ben Watkins on 6/20/20.
//  Copyright © 2020 outdatedversion LLC. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Item]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                   .font(.headline)
                   .padding(.leading, 15)
                   .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
               HStack(alignment: .top, spacing: 0) {
                ForEach(self.items) { item in
                  NavigationLink(destination: TempDetail(item: item)) {
                    CategoryRowEntry(item: item)
                 }
               }
             }
           }
                       
           .frame(height: 185)
        }
    }
}

struct CategoryRowEntry: View {
    let item: Item
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(self.item.imageName)
                .resizable()
                .frame(width: 125, height: 125)
                .cornerRadius(5)
            
            Text(item.displayName)
                .font(.caption)
        }
            
        .padding(.leading, 15)
    }
}

struct CategorizedView: View {
    let items: [Item]
    let categoryOrder: [String]
    
    var groupedItems: [String: [Item]] {
        Dictionary(
            grouping: self.items,
            by: { $0.category }
        )
    }
    
    init(categoryOrder: [String], items: [Item]) {
        self.items = items
        self.categoryOrder = categoryOrder
        
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.categoryOrder, id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.groupedItems[key]!)
                }
                
                .padding(.top, 20)
                .listRowInsets(EdgeInsets())
            }
            
            .listRowInsets(EdgeInsets())
            .navigationBarTitle(Text("Sounds"))
        }
    }
}

//struct CategorizedView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategorizedView()
//    }
//}
