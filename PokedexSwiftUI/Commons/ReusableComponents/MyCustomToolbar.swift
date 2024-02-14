//
//  MyCustomHeader.swift
//  PokedexSwiftUI
//
//  Created by Bruno Marques on 05/02/24.
//

import Foundation
import SwiftUI

struct MyCustomToolbar: ViewModifier {
    @Environment(\.dismiss) var dismiss
    var title: String
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .tint(PokedexColors.primary)
                    })
                }
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .font(FontMaker.makeFont(.poppinsSemiBold, 18))
                }
            }
    }
}

extension View {
    func myCustomToolbar(title: String) -> some View {
        self.modifier(MyCustomToolbar(title: title))
    }
}
