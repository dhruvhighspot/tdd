import 'dart:convert';
import 'package:http/http.dart' as http;
//
class HandleException {
  dynamic returnResponse({required http.Response response}) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 401:
        return jsonDecode(response.body);
      default:
        return Exception('Something went wrong');
    }
  }
}
//
// class HandleException {
//   dynamic returnResponse({required http.Response response}) {
//     switch (response.statusCode) {
//       case 200:
//         var responseJson = jsonDecode(response.body.toString());
//         return responseJson;
//       case 400:
//         throw BadRequestException(response.body.toString());
//       // case 401:
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//       default:
//         throw FetchDataException(
//             'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
//     }
//   }
// }
//
// class AppException implements Exception {
//   final _message;
//   final _prefix;
//
//   AppException([this._message, this._prefix]);
//
//   String toString() {
//     return '$_prefix$_message';
//   }
// }
//
// class FetchDataException extends AppException {
//   FetchDataException([String? message]) : super(message, "Error During Communication: ");
// }
//
// class BadRequestException extends AppException {
//   BadRequestException([message]) : super(message, "Invalid Request: ");
// }
//
// class UnauthorisedException extends AppException {
//   UnauthorisedException([message]) : super(message, "Unauthorised: ");
// }
