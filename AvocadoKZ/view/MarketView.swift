//
//  MarketView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct MarketView: View {
    
    @ObservedObject private var vm = MarketViewModel()
    
    var body: some View {
          NavigationView {
              VStack {
                  topBar
                  
                  searchBar
                  
                  scrollView(content: products)
                      .background(Color(.systemBackground))
              }
          }
      }
    
    
//MARK: Search Bar
    private var searchBar: some View {
        HStack {
            TextField("Search...", text: vm.$searchQuery)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 16)
                        
                        if !vm.searchQuery.isEmpty {
                            Button(action: {
                                self.vm.searchQuery = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 16)
                            }
                        }
                    }
                )
        }
        .padding(.bottom, 10)
    }
    
//MARK: Products
    private var products: some View {
        VStack{
            ForEach(0..<10, id: \.self) { id in
                HStack{
                                   
                    ProductView(AppData.shared.product[0])
                    ProductView(AppData.shared.product[0])
                }
                .padding(.bottom)
            }
        }
    }
    
//MARK: Top Bar
    private var topBar: some View {
        
        VStack{
            if vm.height > 0 {
                HStack{
                    AText.shared.text(text: "Avocado", size: 30, font: .black, padding: 0)
                        .foregroundColor(Color.green)
                    
                    ZStack{
                        Circle()
                            .frame(width: 25)
                            .foregroundColor(.orange)
                        
                        AText.shared.text(text: "KZ", size: 12, font: .black, padding: 0)
                            .foregroundColor(.white)
                    }
                    
                    Rectangle()
                        .frame(width: 2, height: AppData.shared.size.height * 0.05)
                        .foregroundColor(.gray)
                    
                    AsyncImage(url: "https://bank.kz/wp-content/uploads/2022/03/bank-fridom-finans-300x300.jpg", placeholder: {AText.shared.justText(text: "Loading")})
                        .frame(maxWidth: 45)
                    
                    VStack(alignment: .leading){
                        AText.shared.text(text: "FREEDOM", size: 14, font: .bold, padding: 0)
                        AText.shared.text(text: "HOLDING CORP.", size: 8, font: .medium, padding: 0)
                        
                    }
                    
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: vm.height)
    }
    
//MARK: Scroll View
    private func scrollView(content: some View) -> some View {
        ScrollView {
            GeometryReader { geometry in
                Color.clear
                    .preference(key: ScrollViewOffsetPreferenceKey.self, value: geometry.frame(in: .named("scrollView")).minY)
            }
            .frame(height: 0)

            content
        }
        .background(Color(.secondarySystemBackground))
        .coordinateSpace(name: "scrollView")
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            self.vm.scrollOffset = -value

            if value < -50 {
                self.vm.height -= 10
            } else {
                self.vm.height = 80
            }
            
        }
    }
}

#Preview {
    MarketView()
}

