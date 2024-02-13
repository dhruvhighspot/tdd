import 'dart:convert';

import 'package:get/get.dart';
import '../../../api/api_services.dart';
import '../../../api/app_url.dart';
import '../model/home_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final http.Client client;
  HomeController({required this.client});
  RxBool isLoading = false.obs;
  RxList<UsersResponse> userDataList = <UsersResponse>[].obs;

  @override
  void onInit() async {
    await todoRequest();
    super.onInit();
  }

  // Future<void> todoRequest() async {
  //   try {
  //     final response = await client.get(Uri.parse(ApiUrl.userListUrl));
  //     List<dynamic> res = jsonDecode(response.body) as List<dynamic>;
  //     final List<UsersResponse> jsonResponse = res.map((data) => UsersResponse.fromJson(data)).toList();
  //     if (jsonResponse.isNotEmpty) {
  //       userDataList.assignAll(jsonResponse);
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<void> todoRequest() async {
    try {
      isLoading(true);
      userDataList.removeRange(0, userDataList.length);
      final List<dynamic> response = await ApiServices(client: http.Client()).getService(url: ApiUrl.userListUrl);
      final List<UsersResponse> jsonResponse = response.map((data) => UsersResponse.fromJson(data)).toList();
      if (jsonResponse.isNotEmpty) {
        userDataList.assignAll(jsonResponse);
        // userDataList.value=[];
      }
    } catch (e) {
      // debugPrint(e.toString());
      rethrow;
    } finally {
      isLoading(false);
    }
  }
}
