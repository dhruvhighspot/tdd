import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/constants/validators.dart';

void main() {
  Validators validators = Validators();

  group('Username Validation', () {
    test('returns error message if username is empty', () {
      var result = validators.usernameValidator('');
      expect(result, 'Enter Email');
    });

    test('returns null if username is not empty', () {
      var result = validators.usernameValidator('user@example.com');
      expect(result, null);
    });
  });

  group('Password Validation', () {
    test('returns error message if password is empty', () {
      var result = validators.passwordValidator('');
      expect(result, 'Enter password');
    });

    test('returns null if password is not empty', () {
      var result = validators.passwordValidator('password123');
      expect(result, null);
    });
  });
}
