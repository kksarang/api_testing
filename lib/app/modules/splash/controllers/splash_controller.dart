import 'dart:async';

import 'package:employee_directory/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final _splashDuration = Duration(seconds: 3);
  @override
  void onInit() {
    super.onInit();
    Timer(_splashDuration, () => Get.offNamed(Routes.HOME));
  }
}
