//
//  ViewControllerKey.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct ViewControllerKey: EnvironmentKey {
    static var defaultValue: ViewControllerHolder {
        return ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)

    }
}
