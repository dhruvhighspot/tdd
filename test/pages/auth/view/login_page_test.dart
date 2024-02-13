import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd/constants/validators.dart';
import 'package:tdd/pages/auth/controller/auth_controller.dart';
import 'package:tdd/pages/auth/model/login_model.dart';
import 'package:tdd/pages/auth/view/login_page.dart';
import 'package:tdd/pages/home/view/home_page.dart';
import 'package:http/http.dart' as http;

// Mock your AuthController
class MockAuthController extends Mock implements AuthController {}

void main() {
  group('Test Loging Page', () {
    testWidgets('LoginPage Widget Test', (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(home: LoginPage()));
      await tester.pump(Duration(seconds: 5));
      expect(find.widgetWithText(AppBar, 'Login'), findsOneWidget);
      // expect(find.byKey(testKey), findsOneWidget);

      expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Username'),
          findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Password'),
          findsOneWidget);
      await tester.tap(find.byKey(Key('loginButton')));
      // final Finder finder = find.byKey(const Key('loginButton'));
      // expect(finder, findsOneWidget);
      // expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
      // await tester.pumpWidget(LoginPage());
    });

    late MockAuthController mockAuthController;
    late AuthController authController;
    setUp(() {
      mockAuthController = MockAuthController();
      authController = AuthController(client: http.Client());
    });
    testWidgets('LoginPage Widget Test', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
          home: Scaffold(
              body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextFormField(
          key: Key('emailField'),
          initialValue: 'Username',
          onChanged: (_) => mockAuthController.updateUsername('Username'),
        ),
        TextFormField(
          key: Key('passwordField'),
          validator: Validators().passwordValidator,
          onChanged: (_) => mockAuthController.updatePassword('Password'),
        ),
        ElevatedButton(
          key: Key('loginButton'),
          onPressed: () async {
            //
          },
          child: const Text('Login'),
        ),
      ]))));
      await tester.pump();
      Finder emailField = find.byKey(Key('emailField'));
      await tester.enterText(emailField, 'emailField');

      Finder passwordField = find.byKey(Key('passwordField'));
      await tester.enterText(passwordField, 'passwordField');



      debugPrint(authController.username);
      // expect(authController.username, 'Username');
      // final Finder finder = find.byKey(const Key('loginButton'));
      // expect(finder, findsOneWidget);
      // expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
      // await tester.pumpWidget(LoginPage());
    });
  });
}
