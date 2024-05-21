//
//  StrikethroughText.swift
//  AvocadoKZ
//
//  Created by bakebrlk on 21.05.2024.
//

import SwiftUI

struct StrikethroughText: UIViewRepresentable {
    var text: String
    var color: UIColor

    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        updateAttributedString(for: label)
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        updateAttributedString(for: uiView)
    }

    private func updateAttributedString(for label: UILabel) {
        let attributedString = NSAttributedString(
            string: text,
            attributes: [
                .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                .strikethroughColor: color
            ]
        )
        label.attributedText = attributedString
    }
}
