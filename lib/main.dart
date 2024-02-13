import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tdd/pages/auth/controller/auth_controller.dart';
import 'package:tdd/pages/auth/view/login_page.dart';
import 'pages/home/view/home_page.dart';
import 'package:http/http.dart' as http;

//  coverage:ignore-start
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  runApp(const MyApp());
}
// coverage:ignore-end

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController(client: http.Client()));

    return GetMaterialApp(
      title: 'TDD Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(
        controller: authController,
      ),
    );
  }
}
