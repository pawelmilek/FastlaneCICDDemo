//
//  CalculatorView.swift
//  FastlaneCICDDemo
//
//  Created by Pawel Milek on 9/12/23.
//

import SwiftUI
import Combine

struct CalculatorView: View {
    enum FocuseField {
        case first
        case second
    }

    @ObservedObject var viewModel: ViewModel
    @FocusState private var focusedField: FocuseField?

    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    TextField("First value", text: viewModel.handleFirstValueBinding)
                        .focused($focusedField, equals: .first)
                        .numberOnly(viewModel.handleFirstValueBinding)
                    TextField("Second value", text: viewModel.handleSecondValueBinding)
                        .focused($focusedField, equals: .second)
                        .numberOnly(viewModel.handleSecondValueBinding)
                    Button {
                        viewModel.calculate()
                    } label: {
                        Text("Calculate")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(!viewModel.isCalculateButtonEnable)
                }
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .frame(maxHeight: .infinity, alignment: .top)
                .padding()
            }
            .navigationTitle("Sum Numbers")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        focusedField = nil
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .alert("Result", isPresented: $viewModel.hasCalculateResult, actions: {}, message: {
                Text("\(viewModel.result)")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = CalculatorView.ViewModel(model: CalculatorModel())
    static var previews: some View {
        CalculatorView(viewModel: viewModel)
    }
}
