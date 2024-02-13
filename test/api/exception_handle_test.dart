import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get_connect.dart';
import 'package:tdd/api/exception_handle.dart';
import 'package:http/http.dart' as http;

void main() {
  final handleException = HandleException();

  group('Handle Exception Testing Repository - ', () {
    test('200 status Test', () {
      final response = http.Response(jsonEncode({'status': true, 'message': 'successfully'}), 200);
      // debugPrint(handleException.returnResponse(response: response));

      // debugPrint(jsonDecode(response.bodyString!));
      // debugPrint(handleException.returnResponse(response: jsonDecode(response.body)));
      expect(handleException.returnResponse(response: response), jsonDecode(response.body));
    });

    test('401 status Test', () {
      final response = http.Response(jsonEncode({'status': false, 'message': 'un-successfully'}), 401);

      // debugPrint(handleException.returnResponse(response: response));
      debugPrint(response.body);
      // debugPrint(handleException.returnResponse(response: jsonDecode(response.body)));
      expect(handleException.returnResponse(response: response), jsonDecode(response.body));
    });
    //
    // test('Un-authorised Test', () {
    //   final response = Response(
    //       statusCode: 401,
    //       headers: {"Content-Type": "application/json", "Accept": "application/json"},
    //       body: '''{'status': false}''');
    //   // debugPrint(handleException.returnResponse(response: response));
    //   expect(handleException.returnResponse(response: jsonDecode(response.toString())), Exception('Unauthorised'));
    // });
    test('Something went wrong Test', () {
      final response = http.Response(jsonEncode(''), 302);
      print(handleException.returnResponse(response: response));
      print(Exception('Something went wrong'));
      expect(handleException.returnResponse(response: response).toString(),
          Exception('Something went wrong').toString());
    });
  });
}
