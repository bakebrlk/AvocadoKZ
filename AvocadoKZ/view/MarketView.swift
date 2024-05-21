//
//  MarketView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct MarketView: View {
    
    @StateObject private var vm = MarketViewModel()
    
    var body: some View {
          NavigationView {
              VStack(alignment: .leading) {
                  topBar
                  
                  searchBar
                  
                  scrollView(content: productContent)
                      .background(Color(.systemGroupedBackground))
              }
              .frame(maxWidth: .infinity, maxHeight: .infinity)
              .background(Color(.systemBackground))
          }
         
      }
    
//MARK: Product Content
    private var productContent: some View {
        VStack{
            ForEach(AppData.shared.sections) { section in
                
                ForEach(AppData.shared.product) { product in
                    
                    VStack(alignment: .leading){
                        sections(title: section.description, content: Text(""))
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ProductView(product)
                                    .frame(maxWidth: AppData.shared.size.width / 2.2)
                                    .padding(.leading)
                                
                                ProductView(product)
                                    .frame(maxWidth: AppData.shared.size.width / 2.2)
                                    .padding(.leading)
                                
                                ProductView(product)
                                    .frame(maxWidth: AppData.shared.size.width / 2.2)
                                    .padding(.leading)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
//MARK: Sections
    private func sections(title: String, content: some View) -> some View {
        VStack(alignment: .leading){
            AText.shared.text(text: title, size: 20, font: .extraBold)
            
            content
        }
    }
    
//MARK: Search Bar
    private var searchBar: some View {
        HStack {
            TextField("Search...", text: $vm.searchQuery )
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
        HStack{
            ForEach(AppData.shared.product) { product in
                
                ProductView(AppData.shared.product[0])
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
        ScrollView{
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
            
            print(value)
            if value < -50 {
                vm.height -= 10
//                vm.minusHeight()
            } else {
                vm.height = 80
//                vm.plusHeight()
            }
            
        }
    }
}

#Preview {
    MarketView()
}

