//
//  CalculatorViewViewModel.swift
//  FastlaneCICDDemo
//
//  Created by Pawel Milek on 9/12/23.
//

import Foundation
import SwiftUI

extension CalculatorView {

    @MainActor
    final class ViewModel: ObservableObject {
        @Published var hasCalculateResult = false
        @Published var isCalculateButtonEnable = false
        @Published private var model: CalculatorModel

        private var hasFirstValue = false
        private var hasSecondValue = false

        var handleFirstValueBinding: Binding<String> {
            Binding(
                get: { self.model.firstValue },
                set: { newValue in
                    self.model.firstValue = newValue
                    self.hasFirstValue = !newValue.isEmpty
                    self.validateCalculationButtonState()
                    print(self.model)
                }
            )
        }

        var handleSecondValueBinding: Binding<String> {
            Binding(
                get: { self.model.secondValue },
                set: { newValue in
                    self.model.secondValue = newValue
                    self.hasSecondValue = !newValue.isEmpty
                    self.validateCalculationButtonState()
                    print(self.model)
                }
            )
        }

        var result: Int {
            model.result
        }

        init(model: CalculatorModel) {
            self.model = model
        }

        func calculate() {
            defer { hasCalculateResult.toggle() }

            if let firstNumber = Int(model.firstValue),
               let secondNumber = Int(model.secondValue) {
                model.result = firstNumber + secondNumber
            } else {
                model.result = 0
            }
        }

        private func validateCalculationButtonState() {
            isCalculateButtonEnable = hasFirstValue && hasSecondValue
        }
    }

}
