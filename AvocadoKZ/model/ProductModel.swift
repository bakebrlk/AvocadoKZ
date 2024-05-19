//
//  ProductModel.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 13.05.2024.
//

import SwiftUI

struct ProductModel: Codable {
    let imgURL: URL
    let title: String
    let whole: String
    let price: Int
}

struct ProductView: View {
    
    var body: some View{
        ScrollView{
            
            HStack{
                product(ProductModel(
                    imgURL: URL(string: "https://arbuz.kz/image/s3/arbuz-kz-products/44594e47-6ae3-4f2d-9949-188cca096baf-38_png.png?w=360&h=360&_c=1715751489")!,
                    title: "Грудка куриная Arbuz Select су-вид с чесноком и травами", whole: "7 580₸/кг", price: 1599))
             
                product(ProductModel(imgURL: URL(string: "https://arbuz.kz/image/s3/arbuz-kz-products/44594e47-6ae3-4f2d-9949-188cca096baf-38_png.png?w=360&h=360&_c=1715751489")!,
                                     title:  "Грудка куриная Arbuz Select су-вид с чесноком и травами", whole: "7 580₸/кг", price: 1599))
               
            }
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.secondarySystemBackground))
    }
    
    func product(_ product: ProductModel) -> some View {
  
        LazyVStack{
            
//            image(URL: product.imgURL)
//                    .frame(minWidth: AppData.shared.size.width/2.4)
//                    .cornerRadius(8, corners: [.topLeft, .topRight])
                
            LazyVStack{
                AText.shared.text(text: product.title, size: 14, font: .regular, lineLimit: 2)
                AText.shared.text(text: product.whole, size: 14, font: .light)
                    .padding(.top, 1)

                AText.shared.text(text: "\(product.price) ₸", size: 22, font: .medium)
                    .padding(.top, 1)
                    .padding(.bottom, 0)
                }
                
                Button(action: {}, label: {
                    AText.shared.justText(text: "Добавить +")
                        .frame(maxWidth: .infinity,minHeight: 50)
                        .background(
                            CurveRectangle()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(Color(.secondarySystemBackground))
                                .padding(.top, 5)
                        )
                        .foregroundColor(.green)
                        .padding([.leading, .trailing])
                        
                })
                .frame(maxWidth: .infinity)
                .padding(.bottom,25)
            }
            .background(
                BottomCurveRectangle()
                    .foregroundColor(Color(.systemBackground))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .padding(10)
            
    }

}

#Preview {
    ProductView()
}
