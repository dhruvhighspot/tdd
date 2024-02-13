import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd/pages/auth/controller/auth_controller.dart';
import 'package:tdd/pages/home/controller/home_controller.dart';
import 'package:tdd/pages/home/model/home_model.dart';
import 'package:tdd/pages/home/view/home_page.dart';
import 'package:http/http.dart' as http;

// class MockHttpClient extends Mock implements http.Client {}

// class MockHomeController extends Mock implements HomeController {}

void main() {
  late HomeController homeController;
  // late MockHttpClient mockHttpClient;
  setUp(() {
    // mockHttpClient = MockHttpClient();
    homeController = HomeController(client: http.Client());
  });
  group('HomePage Widget Test', () {
    testWidgets('HomePage should have an AppBar with Users List title', (WidgetTester tester) async {
      // Arrange
      homeController.isLoading.value = true;
      await tester.pumpWidget(GetMaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: Text('User List'),
              ),
              body: GetBuilder<HomeController>(
                init: HomeController(client: http.Client()),
                builder: (_) => RefreshIndicator(
                    onRefresh: () => homeController.todoRequest(),
                    child: ListView.builder(itemBuilder: (context, index) {
                      return Container(
                          height: Get.height * 0.8, child: const Center(child: CircularProgressIndicator()));
                    })),
              ))));
      await tester.pumpWidget(const GetMaterialApp(home: HomePage()));
      await tester.pump(Duration(seconds: 5));
      // Act
      expect(find.widgetWithText(AppBar, 'Users List'), findsOneWidget);

      // Assert
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });
    // testWidgets('HomePage displays loading indicator before users are loaded', (WidgetTester tester) async {
    //   // Mock your HomeController or its response if necessary
    //
    //   await tester.pumpWidget(GetMaterialApp(home: HomePage()));
    //
    //   // Initially, you might show a loading indicator or a blank list
    //   // For simplicity, let's assume the initial state shows a CircularProgressIndicator
    //   // expect(find.byType(CircularProgressIndicator), findsOneWidget);
    // });
    // testWidgets('Shows loading indicator when isLoading is true', (WidgetTester tester) async {
    //   final controller = MockHomeController();
    //   controller.isLoading.value = true;
    //   // when(controller.isLoading).thenReturn(true);
    //   // when(controller.userDataList).thenReturn([
    //   //   UsersResponse(
    //   //       id: 1,
    //   //       name: "Emily Johnson",
    //   //       company: "ABC Corporation",
    //   //       username: "emily_johnson",
    //   //       email: "emily.johnson@abccorporation.com",
    //   //       address: "123 Main St",
    //   //       zip: "12345",
    //   //       state: "California",
    //   //       country: "USA",
    //   //       phone: "+1-555-123-4567",
    //   //       photo: "http://placeimg.com/640/480/people")
    //   // ]);
    //   // when(() => controller.todoRequest()).thenAnswer((_) async {});
    //
    //   // Get.put<HomeController>(controller);
    //
    //   await tester.pumpWidget(GetMaterialApp(home: HomePage()));
    //   await tester.pump(); // Pump once to allow the UI to render
    //
    //   expect(find.byType(CircularProgressIndicator), findsWidgets);
    // });
    // testWidgets('Test Home Page with Empty Data', (WidgetTester tester) async {
    //   await tester.pumpWidget(const GetMaterialApp(
    //     home: HomePage(),
    //   ));
    //   expect(find.text('Users List'), findsOneWidget);
    //   final mockController = MockHomeController();
    //   // when(mockController.userDataList).thenReturn([]);
    //   // when(() => mockController.todoRequest()).thenAnswer((_) async => {});
    //   //
    //   // Get.lazyPut<HomeController>(() => mockController);
    //
    //   await tester.pumpWidget(GetMaterialApp(home: HomePage()));
    //   await tester.pump(); // Needed to complete the Future and rebuild the widget with new data
    //
    //   // Verify that the UI now contains elements for the user data
    //   expect(find.byType(ListTile), findsWidgets);
    // });
  });
}
