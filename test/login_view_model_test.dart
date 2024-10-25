import 'package:flutter_test/flutter_test.dart';

import 'login_view_model.dart';


void main() {
  late LoginViewModel loginViewModel;

  setUp(() {
    loginViewModel = LoginViewModel();
  });

  group('Email Validation', () {
    test('returns true for a valid email', () {
      expect(loginViewModel.validateEmail('test@example.com'), isTrue);
    });

    test('returns false for an invalid email', () {
      expect(loginViewModel.validateEmail('invalid-email'), isFalse);
      expect(loginViewModel.validateEmail('test@.com'), isFalse);
      expect(loginViewModel.validateEmail('test@com'), isFalse);
    });
  });

  group('Password Validation', () {
    test('returns true for a valid password (8 characters or more)', () {
      expect(loginViewModel.validatePassword('password123'), isTrue);
    });

    test('returns false for a password less than 8 characters', () {
      expect(loginViewModel.validatePassword('pass12'), isFalse);
    });

    test('returns false for an empty password', () {
      expect(loginViewModel.validatePassword(''), isFalse);
    });
  });
}
