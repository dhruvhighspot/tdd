import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:tdd/api/api_services.dart';
import 'package:tdd/api/app_url.dart';
import 'package:tdd/pages/home/controller/home_controller.dart';
import 'package:tdd/pages/home/model/home_model.dart';

class MockApiServices extends Mock implements http.Client {}

void main() {
  group('HomeController Test', () {
    late HomeController homeController;
    late MockApiServices mockApiServices;

    setUp(() {
      mockApiServices = MockApiServices();
      homeController = HomeController(client: mockApiServices);
    });

    test('Test todoRequest Success', () async {
      // Mock response data
      final List<UsersResponse> responseData = [
        UsersResponse(
            id: 1,
            name: "Emily Johnson",
            company: "ABC Corporation",
            username: "emily_johnson",
            email: "emily.johnson@abccorporation.com",
            address: "123 Main St",
            zip: "12345",
            state: "California",
            country: "USA",
            phone: "+1-555-123-4567",
            photo: "http://placeimg.com/640/480/people")
      ];

      when(() => mockApiServices.get(Uri.parse(ApiUrl.userItemUrl)))
          .thenAnswer((_) async => http.Response(responseData.toString(), 200));
      await homeController.todoRequest();
      expect(homeController.userDataList[0].username.toString(), responseData[0].username.toString());
    });

    test('Test todoRequest Failure', () async {
      // Mock ApiServices getService method to throw an exception
      when(() => mockApiServices.get(Uri.parse('http://example.com'))).thenThrow(Exception('Failed to fetch data'));

      // Call todoRequest method
      expect(() => homeController.todoRequest(), throwsException);
    });
  });
}
