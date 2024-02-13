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
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockAuthController mockAuthController;
  late AuthController authController;
  setUpAll(() {
    mockAuthController = MockAuthController();
    authController = AuthController(client: http.Client());
  });
  group('Test Loging Page', () {
    testWidgets('LoginPage Widget Test', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
          home: LoginPage(
        controller: authController,
      )));
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

    testWidgets('LoginPage Widget Test', (WidgetTester tester) async {
      final GlobalKey<FormState> formKeyTest = GlobalKey<FormState>();

      await tester.pumpWidget(GetMaterialApp(
        home: LoginPage(controller: authController),
      ));
      // expect(find.text('Username'), findsOneWidget);
      // expect((tester.widget(find.byKey(Key('userField'))) as TextFormField).initialValue, equals('Username'));
      // expect((tester.widget(find.byKey(Key('passwordField'))) as TextFormField).initialValue, equals('Password'));
      // print("HELLO1");
      // expect(formKeyTest.currentState!.validate(), false);
      // print("HELLO1+");
      await tester.pump(Duration(seconds: 2));
      final userKey = find.byKey(Key('userField'));
      final passKey = find.byKey(Key('passwordField'));
      // await tester.tap(userKey);
      await tester.enterText(userKey, 'michael');
      expect(authController.username, 'michael');
      await tester.enterText(passKey, 'success-password');
      expect(authController.password, 'success-password');

      // await tester.tap(find.byKey(Key('loginButton')));

      //
      // Finder emailField = find.byKey(Key('userField'));
      // await tester.enterText(emailField, 'userField');
      //
      // Finder passwordField = find.byKey(Key('passwordField'));
      // await tester.enterText(passwordField, 'passwordField');

      // debugPrint(authController.username);
      // expect(authController.username, 'Username');
      // final Finder finder = find.byKey(const Key('loginButton'));
      // expect(finder, findsOneWidget);
      // expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
      // await tester.pumpWidget(LoginPage());
    });
  });
}
