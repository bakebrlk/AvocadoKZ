//
//  ProductDetailView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 20.05.2024.
//

import SwiftUI

struct ProductDetailView: View {
    
    private let product: ProductModel
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    @State private var checkComposition: Bool = true
    @State private var checkCountry: Bool = true
    
    @ObservedObject private var vm: ProductViewModel
    
    init(product: ProductModel, vm: ObservedObject<ProductViewModel>) {
        self.product = product
        self.vm = vm.wrappedValue
    }

//MARK: Body
    var body: some View {
        VStack(alignment: .leading){
            
            topBar
            
            ScrollView(showsIndicators: false) {
                
            image
            
                VStack(alignment: .leading){

                    title
                    
                    price
                    
                    division
                    
                    description
                    
                    composition
                    
                    country
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(28, corners: [.topLeft, .topRight])
                .offset(y: -AppData.shared.size.width * 0.1)
            }
            
            bottomBar

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
    
//MARK: Top Bar
    private var topBar: some View {
        HStack{
            AvocadoKZ.image(systemName: "xmark", size: 20)
                .padding([.leading])
                .onTapGesture {
                    withAnimation{
                        viewControllerHolder?.dismiss(animated: true)
                    }
                }
            
            Spacer()
            
            AvocadoKZ.image(systemName: "square.and.arrow.up", size: 25)
                .padding([.trailing])
            
            AvocadoKZ.image(systemName: vm.isLike ? "heart.fill" :  "heart", size: 25)
                .foregroundColor(vm.isLike ? .red : .black)
                .padding([.trailing])
                .onTapGesture {
                    vm.like()
                }
        }
        .padding([.bottom, .top], 10)
        .frame(maxWidth: .infinity)
        .background(Color.white)

    }
    
//MARK: Bottom Bar
    private var bottomBar: some View {
        HStack{
            
            if vm.haveBasket {
                AvocadoKZ.image(systemName: "minus", size: 20)
                    .foregroundColor(.white)
                    .padding(.leading, vm.haveBasket ? 30 : 0)
                    .onTapGesture {
                        vm.minus()
                    }
            }
            
            if vm.haveBasket {
                Spacer()
            }
            
            VStack{
                Text("\((product.price - product.price * (product.discount ?? 0)/(-100)) * vm.count ) ₸ ")
                    .font(.custom("Lexend-Medium", size: 20))
                    .foregroundColor(.white)
                
                AText.shared.justText(text: "\(product.whole * vm.count) г")
                    .foregroundColor(Color(.systemGray5))
            }
            if vm.haveBasket {
                Spacer()
            }
            
            AvocadoKZ.image(systemName: "plus", size: 20)
                .foregroundColor(.white)
                .padding(.trailing, vm.haveBasket ? 30 : 0)
                .onTapGesture {
                    if vm.haveBasket {
                        vm.plus()
                    }else{
                        vm.addBasket(product)
                    }
                }
        }
        .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height * 0.1)
        .background(Color.green)
        .offset(y: AppData.shared.size.width * 0.1)
        .onTapGesture {
            vm.addBasket(product)
        }
    }
    
//MARK: Title
    private var title: some View {
        AText.shared.text(text: product.title, size: 22, font: .regular, lineLimit: 2, alignment: .leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top)
    }
    
//MARK: Price
    private var price: some View {
        HStack{
           
            if product.discount != nil {
            
                StrikethroughText(text: "\(product.price) ₸", color: .systemGray)
                    .frame(maxWidth: 50)
                    .padding(.leading)
            }else {
                AText.shared.text(text: "\(product.price) ₸", size: 22, font: .bold)
                    .foregroundColor(Color(.systemGreen))
                
            }
            
            AText.shared.justText(text: "\(product.whole) г")
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
