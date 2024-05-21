//
//  TestContentView.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 19.05.2024.
//

import SwiftUI

struct TestContentView: View {
    
    var body: some View {
        CollectionView(items: AppData.shared.product)
                  
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    

}

#Preview {
    TestContentView()
}
