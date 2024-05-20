//
//  UIKit_To_SwiftUI.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct UIKit_To_SwiftUI: UIViewControllerRepresentable {
    
    @State private var view = UIVIewAA()
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        self.view = uiViewController as! UIVIewAA
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return view
    }
}
