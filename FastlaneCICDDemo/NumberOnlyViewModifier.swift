//
//  NumberOnlyViewModifier.swift
//  FastlaneCICDDemo
//
//  Created by Pawel Milek on 9/13/23.
//

import SwiftUI
import Combine

struct NumberOnlyViewModifier: ViewModifier {
    @Binding var text: String
    var shouldIncludeDecimal: Bool

    func body(content: Content) -> some View {
        content
            .keyboardType(shouldIncludeDecimal ? .decimalPad : .numberPad)
            .onReceive(Just(text)) { newValue in
                var numbers = "0123456789"
                let decimalSeparator = Locale.autoupdatingCurrent.decimalSeparator ?? "."
                if shouldIncludeDecimal {
                    numbers += decimalSeparator
                }

                if newValue.components(separatedBy: decimalSeparator).count - 1 > 1 {
                    let filtered = newValue
                    text = String(filtered.dropLast())
                } else {
                    let filtered = newValue.filter { numbers.contains($0) }
                    if filtered != newValue {
                        text = filtered
                    }
                }
            }
    }
}

extension View {
    func numberOnly(_ text: Binding<String>, includeDecimal: Bool = false) -> some View {
        self.modifier(NumberOnlyViewModifier(text: text, shouldIncludeDecimal: includeDecimal))
    }
}
