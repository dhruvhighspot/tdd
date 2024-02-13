import 'package:http/http.dart' as http;
import 'package:tdd/api/exception_handle.dart';

class ApiServices {
  final http.Client client;
  ApiServices({required this.client});
  final HandleException handleException = HandleException();
  dynamic getService({required String url}) async {
    try {
      final response =
          await client.get(Uri.parse(url), headers: {"Content-Type": "application/json", "Accept": "application/json"});
      return handleException.returnResponse(response: response);
    } catch (e) {
      rethrow;
    }
  }
  //
  // dynamic postService({required String url, required String body}) async {
  //   try {
  //     final response = await client.post(Uri.parse(url),
  //         body: body, headers: {"Content-Type": "application/json", "Accept": "application/json"});
  //
  //     return handleException.returnResponse(response: response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
