//
//  HintPageView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 08.05.2024.
//

import SwiftUI

struct HintPageView: View {
        
    @ObservedObject private var vm: HintViewModel = HintViewModel()
    
    var body: some View {
        ZStack{
            AppData.shared.appColor
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
            Spacer()
            
            pages
            
            Spacer()
            
            AText.shared.justText(text: "Fast shipping")
            
            AText.shared.justText(text: "Get all of your desired sneakers in one place.")
                .padding(.top)
            
            Spacer()
            
            nextPageBtn
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height/2.9)
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
    
    private var nextPageBtn: some View {
        Button(action: {
            vm.nextPage()
        },
               label: {
            AText().justText(text: "Next")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
        })
        .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height/15.5)
        .background(AppData.shared.appColor)
        .cornerRadius(20, corners: .allCorners)
        .padding([.leading, .trailing, .bottom])
    }
}


#Preview {
    HintPageView()
}
