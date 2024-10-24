import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sims_ppob/app/theme/themes.dart';
import 'package:sims_ppob/app/utils/box.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Box.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Box.token != null ? Routes.CORE : Routes.AUTH,
      getPages: AppPages.routes,
      theme: Themes.theme,
    ),
  );
}
