//
//  HintPageView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 08.05.2024.
//

import SwiftUI

struct HintPageView: View {
        
    @ObservedObject private var vm: HintViewModel = HintViewModel()
    @State private var nextPage: Bool = false
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?

    var body: some View {
        ZStack{
            AppData.shared.appColor
                .ignoresSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                image
                
                Spacer()
                
                information
            }
            .ignoresSafeArea()
        }
        
    }
    
//MARK: information
    private var information: some View {
        VStack{
            Spacer()
            
            pages
            
            Spacer()
            
            title
           
            description
            
            Spacer()
            
            nextPageBtn
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height/2.9)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .padding([.leading, .trailing])
    }
    
    private var image: some View {
        ForEach(0..<AppData.shared.hints.count, id: \.self) { i in
            if i == vm.page {
                AsyncImage(
                    url: AppData.shared.hints[i].imgURL,
                    placeholder: {
                        Text("Loading...")
                    }
                )
            }
        }
        .frame(maxWidth: .infinity, maxHeight: AppData.shared.size.height/2)
    }
    
    // Title
    private var title: some View {
        Group {
            AText.shared.text(text: vm.title, size: 24, font: .medium)
                .foregroundColor(Color(.black))
            AText.shared.text(text: AppData.shared.appTitle, size: 26, font: .medium)
                .foregroundColor(Color(.systemGreen))
        }
    }
    
    // Description
    private var description: some View {
        AText.shared.justText(text: vm.description)
            .foregroundColor(Color(.systemGray))
            .padding(.top, 1)
    }
    
    // Pages
    private var pages: some View {
        HStack{
            ForEach(0..<3) { index in
                circlePage(id: index)
            }
        }
        .padding(.top)
    }
    
    // circle for pages
    private func circlePage(id: Int) -> some View{
        Rectangle()
            .frame(width: vm.page == id ? 18 : 8, height: 8)
            .foregroundColor(vm.page == id ? Color.green: Color(.systemGray3))
           
            .cornerRadius(4, corners: .allCorners)
    }
    
    // Button
    private var nextPageBtn: some View {
        Button(action: {
            withAnimation{
                if vm.page < 3 {
                    vm.nextPage()
                }else {
                    self.viewControllerHolder?.present(style: .fullScreen){
                        TabBar()
                    }
                }
            }
        },
               label: {
            AText().text(text: "Следующий", size: 22, font: .medium)
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
