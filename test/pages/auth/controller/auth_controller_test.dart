import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd/api/app_url.dart';
import 'package:tdd/pages/auth/controller/auth_controller.dart';
import 'package:tdd/pages/auth/model/login_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late AuthController authController;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    authController = AuthController(client: mockHttpClient);
  });

  group('AuthController Test', () {
    test('updateUsername should update username', () {
      String testUsername = 'newUser';
      authController.updateUsername(testUsername);
      expect(authController.username, testUsername);
    });

    test('updatePassword should update password', () {
      String testPassword = 'newPass';
      authController.updatePassword(testPassword);
      expect(authController.password, testPassword);
    });

    test('Login Request', () async {
      const username = "michael";
      const password = "success-password";
      // final box = GetStorage();

      when(() => mockHttpClient.post(Uri.parse(ApiUrl.loginUrl), body: {"username": username, "password": password}))
          .thenAnswer((invocation) async => http.Response('''{
              "success": true,
              "message": "Login successful",
              "token":
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNjgwMjM5MDIyLCJleHAiOjI2MTkzMDAwMDAsImlzcyI6ImJlZWNlcHRvci5jb20iLCJhdWQiOiJCZWVjZXB0b3IgdXNlcnMifQ.D-wEdKyDTOk3GlHs8d2yjfYGZ9gYqWfx2wDPY7mTf-w"
            }''', 200));
      authController.updateUsername(username);
      authController.updatePassword(password);
      final result = await authController.loginRequest();
      expect(result, isA<LoginResponse>());
    });

    // test('AuthController updateUsername Test', () {
    //   final authController = Get.put(AuthController(client: mockHttpClient));
    //
    //   // Call the updateUsername method with a test value
    //   authController.updateUsername('test_username');
    //
    //   // Verify that the username variable has been updated
    //   expect(authController.username, 'test_username');
    //
    //   // Verify that the update method has been called
    //   expect(Get.find<AuthController>().initialized, true);
    // });
    //
    // test('LoginController updatePassword Test', () {
    //   // Instantiate the LoginController
    //   final authController = Get.put(AuthController(client: mockHttpClient));
    //
    //   // Call the updatePassword method with a test value
    //   authController.updatePassword('test_password');
    //
    //   // Verify that the password variable has been updated
    //   expect(authController.password, 'test_password');
    //
    //   // Verify that the update method has been called
    //   expect(Get.find<AuthController>().initialized, true);
    // });
  });
}
