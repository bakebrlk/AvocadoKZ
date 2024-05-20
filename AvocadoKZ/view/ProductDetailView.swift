//
//  ProductDetailView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 20.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    private let product: ProductModel
    
    @State private var checkComposition: Bool = true
    @State private var checkCountry: Bool = true
    
    init(product: ProductModel) {
        self.product = product
    }

//MARK: Body
    var body: some View {
        VStack(alignment: .leading){
            
            image
            
            VStack(alignment: .leading){
                
                ScrollView(showsIndicators: false) {
                   
                   
                    
                    title
                    
                    price
                    
                    division
                    
                    description
                    
                    composition
                    
                    country
                    
                    Spacer()
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .cornerRadius(28, corners: [.topLeft, .topRight])
            .offset(y: -AppData.shared.size.width * 0.1)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
//MARK: Image
    private var image: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: product.imgURL, placeholder: {Text("Loading...")})
                .frame(maxWidth: .infinity)
            
            VStack(alignment: .leading){
                
                if product.fromTheFarm {
                    AText.shared.justText(text: "С фермы")
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(8, corners: .allCorners)
                }
                
                if let discount = product.discount {
                    AText.shared.justText(text: "\(discount )%")
                        .foregroundColor(.white)
                        .background(Color(.darkGray))
                        .cornerRadius(8, corners: .allCorners)
                        .padding(.top, 1)
                }
            }
            .padding(.bottom, AppData.shared.size.width * 0.11)
            .padding(.leading)
        }
    }
    
//MARK: Title
    private var title: some View {
        AText.shared.text(text: product.title, size: 22, font: .regular, lineLimit: 2, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
//MARK: Price
    private var price: some View {
        HStack{
           
            AText.shared.text(text: "\(product.price) ₸", size: 22, font: .bold)
                .foregroundColor(Color(.systemGreen))
            
            AText.shared.justText(text: product.whole)
                .foregroundColor(Color(.systemGray))
            
            Spacer()
        }
        .padding(.top, 1)
        
    }
    
//MARK: Description
    private var description: some View {
        VStack{
            AText.shared.text(text: "Описание", size: 22, font: .bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let description = product.description {
                AText.shared.text(text: description, size: 18, font: .regular, lineLimit: nil, alignment: .leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(y: 5)
            }
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .foregroundColor(Color(.systemGray))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top)
    }

//MARK: Composition
    private var composition: some View {
        comp(title: "Состав", description: product.composition, check: $checkComposition)
    }
    
//MARK: Country
    private var country: some View {
        comp(title: "Страна", description: product.country, check: $checkCountry)
    }
    
//MARK: Companent Func
    private func comp(title: String, description: String, check: Binding<Bool>) -> some View{
        VStack{
            HStack{
                AText.shared.text(text: title, size: 22, font: .bold)
                
                Spacer()
                
                Image(systemName: check.wrappedValue ? "chevron.down" : "chevron.up")
                    .foregroundColor(.black)
            }
            .padding([ .trailing])
            .onTapGesture {
                withAnimation {
                    check.wrappedValue.toggle()
                }
            }
            
            if !check.wrappedValue {
                AText.shared.text(text: description, size : 18, font: .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(y: 5)
                
            }
            
            division
        }
        
    }
    
//MARK: Division
    private var division: some View {
        Rectangle()
            .frame(maxWidth: .infinity, maxHeight: 1)
            .foregroundColor(Color(.systemGray))
            .padding(.top, 5)
    }
    
}
