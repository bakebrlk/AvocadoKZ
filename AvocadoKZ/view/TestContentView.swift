//
//  TestContentView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 19.05.2024.
//

import SwiftUI

struct TestContentView: View {
    var body: some View {
        ScrollView{
            HStack{
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                   
                
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                  
            }
            .padding()
            
                  HStack{
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                   
                
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                  
            }
            .padding()
                   HStack{
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                   
                
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                  
            }
            .padding()
                   HStack{
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                   
                
                ProductView(ProductModel(imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494", title: "Пельмени Arbuz Select фермерские с говядиной", whole: "500 г", price: 3390))
                  
            }
            .padding()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.secondarySystemBackground))
            .ignoresSafeArea(.all)

    }
}

#Preview {
    TestContentView()
}
