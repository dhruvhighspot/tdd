import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/pages/auth/model/login_model.dart';

void main() {
  late LoginResponse originalResponse;

  setUp(() {
    originalResponse = LoginResponse(
      success: true,
      error: Error(code: 'invalid_credentials', message: 'Original error message'),
      message: 'Original message',
      token: 'original_token',
    );
  });

  group('LoginResponse Model Test', () {
    test('copyWith', () {
      // Use copyWith to create a new instance with modified values
      final updatedResponse = originalResponse.copyWith();

      // Verify that the copied instance has the null values
      expect(updatedResponse.success, true);
      expect(updatedResponse.error?.code, 'invalid_credentials');
      expect(updatedResponse.message, 'Original message');
      expect(updatedResponse.token, 'original_token');
    });

    test('fromJson and toJson', () {
      // Test data
      final Map<String, dynamic> json = {
        'success': true,
        'error': {'code': 'invalid_credentials', 'message': 'Invalid username or password.'},
        'message': 'Test message',
        'token': 'test_token',
      };

      // Create a LoginResponse instance from JSON
      final loginResponse = LoginResponse.fromJson(json);

      // Verify the values
      expect(loginResponse.success, true);
      expect(loginResponse.message, 'Test message');
      expect(loginResponse.token, 'test_token');

      // Create a JSON from the LoginResponse instance and verify it
      expect(loginResponse.toJson(), json);
    });
  });

  group('Error Model Test', () {
    test('copyWith', () {
      // Create an Error instance
      final error = Error(code: 'invalid_credentials', message: 'Invalid username or password.');

      // Use copyWith to create a new instance with modified values
      final copiedError = error.copyWith();

      // Verify that the copied instance has the null values
      expect(copiedError.code, 'invalid_credentials');
      expect(copiedError.message, 'Invalid username or password.');
    });

    test('fromJson and toJson', () {
      // Test data
      final Map<String, dynamic> json = {
        'code': 'invalid_credentials',
        'message': 'Invalid username or password.',
      };

      // Create an Error instance from JSON
      final error = Error.fromJson(json);

      // Verify the values
      expect(error.code, 'invalid_credentials');
      expect(error.message, 'Invalid username or password.');

      // Create a JSON from the Error instance and verify it
      expect(error.toJson(), json);
    });
  });
}
