import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:tdd/api/api_services.dart';
import 'package:tdd/api/app_url.dart';
import 'package:tdd/api/exception_handle.dart';
import 'package:tdd/pages/auth/model/login_model.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late HandleException handleException;
  late MockHttpClient mockHttpClient;
  late ApiServices apiServices;
  setUp(() {
    handleException = HandleException();
    mockHttpClient = MockHttpClient();
    apiServices = ApiServices(client: mockHttpClient);
  });

  test('getService should return data for successful call', () async {
    // Setup the mock http client response
    when(() => mockHttpClient.get(Uri.parse(ApiUrl.userItemUrl)))
        .thenAnswer((_) async => http.Response('{"data": "test"}', 200));

    final result = await apiServices.getService(url: 'https://example.com/data');

    expect(result['data'], 'test');
  });
  //
  // test('posService should return data for successful call', () async {
  //   // Setup the mock http client response
  //   when(() => mockHttpClient.post(Uri.parse(ApiUrl.loginUrl)))
  //       .thenAnswer((_) async => http.Response('{"status": true}', 200));
  //
  //   final result = await apiServices.postService(
  //       url: ApiUrl.loginUrl, body: jsonEncode({"username": 'michale', "password": 'success_password'}));
  //   var value = await handleException.returnResponse(response: http.Response('''{'status': true}''', 200));
  //   print(value);
  //   // when(()=> )
  //   // handleException.returnResponse(response: )
  //   // print(jsonResponse);
  // });
  //
  // test('Test Get Services', () async {
  //   var response = '''
  //     [{
  //       "id": 1,
  //       "name": "Emily Johnson",
  //       "company": "ABC Corporation",
  //       "username": "emily_johnson",
  //       "email": "emily.johnson@abccorporation.com",
  //       "address": "123 Main St",
  //       "zip": "12345",
  //       "state": "California",
  //       "country": "USA",
  //       "phone": "+1-555-123-4567",
  //       "photo": "http://placeimg.com/640/480/people"
  //       }]''';
  //   when(mockHttpClient.get(Uri.parse(ApiUrl.userItemUrl),
  //       headers: {"Content-Type": "application/json", "Accept": "application/json"})).thenAnswer((_) async {
  //     return http.Response(response, 200);
  //   });
  //
  //   // Execute the function
  //   final result = await apiServices.getService(url: ApiUrl.userItemUrl);
  //   print(result.statusCode);
  //   expect(result.body, contains(response));
  //   // Verify state changes as expected
  // });
  //
  // test('Test Post Services', () async {
  //   const username = "michael";
  //   const password = "success-password";
  //   // Mock http call
  //   var body = {"username": username, "password": password};
  //   var response = '''
  //     {
  //         "success": true,
  //         "message": "Login successful",
  //         "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNjgwMjM5MDIyLCJleHAiOjI2MTkzMDAwMDAsImlzcyI6ImJlZWNlcHRvci5jb20iLCJhdWQiOiJCZWVjZXB0b3IgdXNlcnMifQ.D-wEdKyDTOk3GlHs8d2yjfYGZ9gYqWfx2wDPY7mTf-w"
  //     }
  //   ''';
  //   when(mockHttpClient.post(Uri.parse(ApiUrl.loginUrl),
  //       body: body, headers: {"Content-Type": "application/json", "Accept": "application/json"})).thenAnswer((_) async {
  //     return http.Response(response, 200);
  //   });
  //
  //   // Execute the function
  //   // final result = await mockHttpClient.post(Uri.parse(ApiUrl.userItemUrl), body: body);
  //   final result = await apiServices.postService(url: ApiUrl.userItemUrl, body: jsonEncode(body));
  //   print(result.statusCode);
  //   expect(result.body, contains(response));
  //   // Verify state changes as expected
  // });

  // setUpAll(() {
  //   Get.testMode = true;
  // });
  // final mockGetConnect = MockGetConnect();
  // late ApiServices apiServices;
  // setUp(() {
  //   // Inject your mockGetConnect into your APIServices class
  //   apiServices = ApiServices();
  //   // apiServices.httpClien = mockGetConnect;
  // });
  //
  // // test('Test Post Service API method', () async {
  // //   final mockGetConnect = MockGetConnect();
  // //
  // //   when(mockGetConnect.get('any', headers: anyNamed('headers')))
  // //       .thenAnswer((_) async =>await  Response(statusCode: 200, body: {"result": "success"}));
  // //   // Act: Call the method you want to test
  // //   final result = await apiServices.getService(url: ApiUrl.loginUrl);
  // //   // Assert: Verify the result or behavior
  // //
  // //   expect(result.statusCode, 200);
  // //   expect(result.body["status"], true);
  // // });
  // //
  // test('Test Post Service API method', () async {
  //   final mockGetConnect = MockGetConnect();
  //
  //   // Arrange: Set up mock response
  //   var testBody = jsonEncode({"username": 'michale', "password": 'password'});
  //   when(mockGetConnect.post(url: ApiUrl.loginUrl, body: testBody))
  //       .thenAnswer((_) async => Response(statusCode: 200, body: {"status": true}));
  //
  //   // Act: Call the method you want to test
  //   final result = await mockGetConnect.po(url: ApiUrl.loginUrl, body: testBody);
  //   // Assert: Verify the result or behavior
  //
  //   expect(result.statusCode, 200);
  //   expect(result.body["status"], true);
  // });
  // });
}
