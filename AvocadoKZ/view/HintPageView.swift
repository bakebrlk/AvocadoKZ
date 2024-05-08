//
//  HintPageView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 08.05.2024.
//

import SwiftUI

struct HintPageView: View {
        
    private let vm: HintViewModel = HintViewModel()
    
    var body: some View {
        ZStack{
            DataApp.shared.appColor
                .ignoresSafeArea(.all)
            
            VStack{
                Spacer()
               
                information
            }
            .ignoresSafeArea()
        }
    }
    
    
    private var information: some View {
        VStack{
            
            pages
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: DataApp.shared.size.height/2.9)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .padding([.leading, .trailing])
    }
    
    private var pages: some View {
        HStack{
            ForEach(0..<3) { index in
                circlePage(id: index)
            }
        }
        .padding(.top)
    }
    
    private func circlePage(id: Int) -> some View{
        Rectangle()
            .frame(width: vm.page == id ? 18 : 8, height: 8)
            .foregroundColor(vm.page == id ? Color.black : Color(.systemGray3))
            .cornerRadius(4, corners: .allCorners)
    }
}


#Preview {
    HintPageView()
}
