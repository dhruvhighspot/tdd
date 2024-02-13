import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdd/pages/home/controller/home_controller.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final HomeController controller;
  const HomePage({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
      ),
      // body: Container(),
      body: GetBuilder<HomeController>(
          init: HomeController(client: http.Client()),
          builder: (homeController) {
            return RefreshIndicator(
              onRefresh: () => homeController.todoRequest(),
              child: Obx(
                () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: homeController.userDataList.isEmpty ? 1 : homeController.userDataList.length,
                    itemBuilder: (context, index) {
                      return homeController.isLoading.value == true
                          ? Container(height: Get.height * 0.8, child: const Center(child: CircularProgressIndicator()))
                          : homeController.userDataList.isEmpty
                              ? Container(
                                  height: Get.height * 0.8,
                                  child: const Center(
                                    child: Text('No User Found'),
                                  ),
                                )
                              : ListTile(
                                  leading: CircleAvatar(
                                    child: CachedNetworkImage(
                                      imageUrl: homeController.userDataList[index].photo.toString(),
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(
                                        Icons.error,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    homeController.userDataList[index].username.toString(),
                                  ),
                                  subtitle: Text(
                                    homeController.userDataList[index].email.toString(),
                                    style: TextStyle(fontSize: 12),
                                  ),
                                );
                    }),
              ),
            );
          }),
    );
  }
}
