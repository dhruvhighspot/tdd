import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:tdd/main.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await tester.pumpWidget(
      const MyApp(),
    );

    await tester.pump();

    // Verify that MyApp is successfully built and does not throw any errors.
    expect(find.byType(MyApp), findsOneWidget);

    // Verify that MaterialApp.router is part of the widget tree.
    expect(find.byType(GetMaterialApp), findsOneWidget);
  });
}
