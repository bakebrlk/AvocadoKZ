//
//  TestContentView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 19.05.2024.
//

import SwiftUI

struct TestContentView: View {
    
//    var body: some View {
// 
//            HStack{
//                ProductView( 
//                                    ProductModel(
//                                        imgURL: "https://arbuz.kz/image/s3/arbuz-kz-products/953bfcd1-396a-4c92-a429-cc3fdd0fa9d2-11_5_png.png?w=360&h=360&_c=1713940494",
//                                        title: "Пельмени Arbuz Select фермерские с говядиной",
//                                        whole: 500,
//                                        price: 3390,
//                                        discount: -25,
//                                        fromTheFarm: true,
//                                        description: "это наши пельмени с говядиной. Попробуйте наши говяжьи пельмени - вкусный выбор для семейного обеда или ужина. Изготовлены из натуральных ингредиентов с использованием фермерской говядины.", 
//                                        composition: "(тесто) мука пшеничная в/с, вода питьевая, яйцо, масло растительное, соль поваренная пищевая, (начинка фарш) говядина, лук репчатый, соль поваренная пищевая, черный перец.", 
//                                        country: "Казахстан"
//                                    )
//                                        
//                )
//           
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color(.secondarySystemBackground))
//            .ignoresSafeArea(.all)
//            
//
//    }
//    

    @State private var scrollOffset: CGFloat = 0

       var body: some View {
//           VStack {
//               Text("Scroll Offset: \(scrollOffset)")
//                   .padding()

               ScrollView {
                   GeometryReader { geometry in
                       Color.clear
                           .preference(key: ScrollViewOffsetPreferenceKey.self, value: geometry.frame(in: .named("scrollView")).minY)
                   }
                   .frame(height: 0) // невидимый GeometryReader в верхней части ScrollView

                   VStack {
                       ForEach(0..<100) { index in
                           Text("Item \(index)")
                               .frame(maxWidth: .infinity)
                               .padding()
                               .background(Color.gray.opacity(0.2))
                               .cornerRadius(8)
                       }
                   }
               }
               .coordinateSpace(name: "scrollView")
               .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
                   self.scrollOffset = -value
               }
//           }
       }
}

#Preview {
    TestContentView()
}
