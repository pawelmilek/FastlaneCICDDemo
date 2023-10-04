//
//  FastlaneCICDDemoApp.swift
//  FastlaneCICDDemo
//
//  Created by Pawel Milek on 9/12/23.
//

import SwiftUI

@main
struct FastlaneCICDDemoApp: App {
    @StateObject private var viewModel = CalculatorView.ViewModel(model: CalculatorModel())

    var body: some Scene {
        WindowGroup {
            CalculatorView(viewModel: viewModel)
        }
    }
}
