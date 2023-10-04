//
//  FastlaneCICDDemoTests.swift
//  FastlaneCICDDemoTests
//
//  Created by Pawel Milek on 9/12/23.
//

import XCTest
@testable import FastlaneCICDDemo

@MainActor
final class FastlaneCICDDemoTests: XCTestCase {
    private var model: CalculatorModel!
    private var viewModel: CalculatorView.ViewModel!

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {
        model = nil
        viewModel = nil
    }

    func testCalculatorWhenDefaultInitialValuesThenBothAreEmptyString() throws {
        // given
        model = CalculatorModel()

        // when
        viewModel = CalculatorView.ViewModel(model: model)

        // then
        XCTAssertTrue(
            viewModel.handleFirstValueBinding.wrappedValue.isEmpty,
            "Expected first value to be equal zero but got \(viewModel.handleFirstValueBinding)"
        )
        XCTAssertTrue(
            viewModel.handleSecondValueBinding.wrappedValue.isEmpty,
            "Expected result to be equal zero but got \(viewModel.handleSecondValueBinding)"
        )

    }

    func testCalculatorWhenPositiveInitialValuesThenHasPositiveResult() throws {
        // given
        model = CalculatorModel(firstValue: "1", secondValue: "1")
        viewModel = CalculatorView.ViewModel(model: model)

        // when
        viewModel.calculate()

        // then
        XCTAssertTrue(
            viewModel.result > 0,
            "Expected result to be positive but got \(viewModel.result)"
        )
    }

    func testCalculatorWhenNegativeInitialValuesThenHasNegativeResult() throws {
        // given
        model = CalculatorModel(firstValue: "-1", secondValue: "-2")
        viewModel = CalculatorView.ViewModel(model: model)

        // when
        viewModel.calculate()

        // then
        XCTAssertTrue(
            viewModel.result < 0,
            "Expected result to be negative but got \(viewModel.result)"
        )
    }

    func testCalculatorWhenDoneThenHasCalculateResultTrue() throws {
        // given
        model = CalculatorModel(firstValue: "10", secondValue: "30")
        viewModel = CalculatorView.ViewModel(model: model)

        // when
        viewModel.calculate()

        // then
        XCTAssertTrue(
            viewModel.hasCalculateResult,
            "Expected result flag to be TRUE but got \(viewModel.hasCalculateResult)"
        )
    }

    func testCalculatorWhenValuesEnteredThenCalculateButtonEnabled() {
        // given
        model = CalculatorModel()
        viewModel = CalculatorView.ViewModel(model: model)

        // when
        viewModel.handleFirstValueBinding.wrappedValue = "1"
        viewModel.handleSecondValueBinding.wrappedValue = "100"

        XCTAssertTrue(
            viewModel.isCalculateButtonEnable,
            "Expected calculate button flag to be TRUE but got \(viewModel.isCalculateButtonEnable)"
        )
    }

    func testCalculatorWhenDefaultInitValuesThenCalculateButtonDisabled() {
        // given
        model = CalculatorModel()
        viewModel = CalculatorView.ViewModel(model: model)

        // when
        viewModel.handleFirstValueBinding.wrappedValue = "1"
        viewModel.handleSecondValueBinding.wrappedValue = "100"

        XCTAssertTrue(
            viewModel.isCalculateButtonEnable,
            "Expected calculate button flag to be TRUE but got \(viewModel.isCalculateButtonEnable)"
        )
    }
}
