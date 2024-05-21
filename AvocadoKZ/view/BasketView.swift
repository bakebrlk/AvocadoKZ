//
//  BasketView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct BasketView: View {
    
    @State private var totalPay: Int = 0
    
    var body: some View {
        NavigationView{
            VStack{
                CollectionView(items: AppData.shared.basket)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
                
                payBtn
            }
        }
        .navigationTitle("Корзина")
        .onAppear{
            for product in AppData.shared.basket {
                totalPay += product.price * product.count
            }
        }
    }
    
    
    private var payBtn: some View {
        HStack{
            AText.shared.text(text: "Перейти к оплате", size: 18, font: .medium)
                .foregroundColor(.white)
            AText.shared.text(text: "\(totalPay) ₸", size: 16, font: .regular)
                .foregroundColor(.white)

        }
        .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height/12)
        .background(Color.green)
        .cornerRadius(16, corners: .allCorners)
        .padding()
    }
}

#Preview {
    BasketView()
}
