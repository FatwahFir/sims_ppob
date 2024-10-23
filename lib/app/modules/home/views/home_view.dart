import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/routes/app_pages.dart';
import 'package:sims_ppob/app/utils/box.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Box.session.erase();
            Get.offAllNamed(Routes.AUTH);
          },
          child: Text("click")),
    );
  }
}
