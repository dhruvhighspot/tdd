import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdd/constants/validators.dart';
import 'package:tdd/pages/auth/controller/auth_controller.dart';
import 'package:http/http.dart' as http;
import 'package:tdd/pages/home/controller/home_controller.dart';
import 'package:tdd/pages/home/view/home_page.dart';

class LoginPage extends StatelessWidget {
  final AuthController controller;
  const LoginPage({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    // AuthController authController = Get.put(AuthController(client: http.Client()));
    HomeController homeController = Get.put(HomeController(client: http.Client()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: Key('userField'),
                validator: Validators().usernameValidator,
                onChanged: (_) => controller.updateUsername(_),
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                key: Key('passwordField'),
                validator: Validators().passwordValidator,
                onChanged: (_) => controller.updatePassword(_),
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                key: Key('loginButton'),
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    final resp = await controller.loginRequest();
                    if (resp.success == true) {
                      Get.off(() => HomePage(
                            controller: homeController,
                          ));
                    } else {
                      Get.snackbar(
                        resp.error!.code.toString(),
                        resp.error!.message.toString(),
                      );
                    }
                    // Handle login logic here
                  }
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
