import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobiletesting/login_screen/login_view_model.dart';
import 'package:mobiletesting/login_screen/sort_order.dart';
import 'package:mobiletesting/login_screen/login_service.dart';
import 'package:mockito/annotations.dart';

import 'login_view_model_test.mocks.dart';

@GenerateMocks([BuildContext, LoginService])
void main() {
  group('LoginViewModel', () {
    late LoginViewModel loginViewModel;
    late MockLoginService mockLoginService;

    setUp(() {
      mockLoginService = MockLoginService();
      loginViewModel = LoginViewModel(mockLoginService, SortOrder.ascending);
    });

    group('onDigitPressed', () {
      test(
          'given inputted pin is empty when digit is pressed then inputted pin should be added',
          () {
        // Arrange
        loginViewModel.onDigitPressed(1, MockBuildContext());
        loginViewModel.onDigitPressed(2, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());
        loginViewModel.onDigitPressed(4, MockBuildContext());
        loginViewModel.onDigitPressed(5, MockBuildContext());
        loginViewModel.onDigitPressed(6, MockBuildContext());

        // Act/When
        loginViewModel.onDigitPressed(7, MockBuildContext());

        // Assert
        expect(loginViewModel.inputtedPin, "123456");
      }, tags: 'unit');

      test(
          'given inputted pin is 6 digits when digit is pressed then inputted pin should not be added',
          () {},
          tags: 'unit');
      group('FE pin validation', () {});
      group('handle network call', () {});
    });
    group('onDeleteButtonPressed', () {
      test(
          'given inputted pin is not empty when delete button is click then last digit from inputtedPin will be removed',
          () {
        // Arrange
        loginViewModel.onDigitPressed(1, MockBuildContext());
        loginViewModel.onDigitPressed(2, MockBuildContext());
        loginViewModel.onDigitPressed(3, MockBuildContext());

        // Act/When
        loginViewModel.onDeleteButtonPressed();

        // Assert
        expect(loginViewModel.inputtedPin, "12");
      }, tags: 'unit');
    });

    group('onDeleteButtonPressedNoDigit', () {
      test(
          'given inputted pin is empty when delete button is click then nothing happen',
          () {
        // Arrange

        // Act/When
        loginViewModel.onDeleteButtonPressed();

        // Assert
        expect(loginViewModel.inputtedPin, "");
      }, tags: 'unit');
    });

    group('onDeleteButtonPressedOneDigit', () {
      test(
          'given inputted pin is one digit when delete button is click then number remain "1"',
          () {
        // Arrange
        loginViewModel.onDigitPressed(1, MockBuildContext());

        // Act/When
        loginViewModel.onDeleteButtonPressed();

        // Assert
        expect(loginViewModel.inputtedPin, "");
      }, tags: 'unit');
    });

    group('navigation', () {});
  });
}
