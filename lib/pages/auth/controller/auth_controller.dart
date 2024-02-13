import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tdd/api/app_url.dart';
import 'package:tdd/pages/auth/model/login_model.dart';

class AuthController extends GetxController {
  final http.Client client;
  AuthController({required this.client});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? username = '';
  String? password = '';
  // final box = GetStorage();

  void updateUsername(value) {
    username = value;
    update();
  }

  void updatePassword(value) {
    password = value;
    update();
  }

  Future<LoginResponse> loginRequest() async {
    try {
      final response =
          await client.post(Uri.parse(ApiUrl.loginUrl), body: {"username": username, "password": password});
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonDecode(response.body));
      }
      throw Exception('Some Error Occurred');
    } catch (e) {
      // debugPrint(e.toString());
      rethrow;
    }
  }
  //
  // Future<void> loginRequest() async {
  //   try {
  //     if (formKey.currentState!.validate()) {
  //       var body = jsonEncode({"username": username, "password": password});
  //       final response = await ApiServices(client: http.Client()).postService(url: ApiUrl.loginUrl, body: body);
  //       LoginResponse jsonResponse = LoginResponse.fromJson(response);
  //       if (jsonResponse.success == true) {
  //         box.write('_token', jsonResponse.token).then((value) => Get.off(() => HomePage()));
  //       } else if (jsonResponse.success == false) {
  //         Get.snackbar(jsonResponse.error!.code.toString(), jsonResponse.error!.message.toString());
  //       }
  //     }
  //
  //     // debugPrint("Token ${box.read('_token')}");
  //   } catch (e) {
  //     // debugPrint(e.toString());
  //     rethrow;
  //   }
  // }
}
