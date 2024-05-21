//
//  SwiftUIView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct TabBar: View {
    
    @State private var id: Int = 0
    
    var body: some View {
        
        ZStack{
            VStack{
                if id == 0 {
                    MarketView()
                }else if id == 1 {
                    BasketView()
                }
                
                Spacer()
                
                HStack{
                    Spacer()

                    image(systemName: "house", size: 30)
                        .foregroundColor(.green)
                        .onTapGesture {
                            id = 0
                        }
                    Spacer()
                    
                    image(systemName: "cart", size: 30)
                        .foregroundColor(.green)
                        .onTapGesture {
                            id = 1
                        }
                    
                    Spacer()


                }
                .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height/26)
                .cornerRadius(16, corners: [.topLeft, .topRight])
            }
        }
    }
}

#Preview {
    TabBar()
}
