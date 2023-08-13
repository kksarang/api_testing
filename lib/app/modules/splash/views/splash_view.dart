import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'package:employee_directory/app/constants/app_colors.dart';
import 'package:employee_directory/app/constants/app_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  final width = Get.mediaQuery.size.width;
  final height = Get.mediaQuery.size.height;
  @override
  Widget build(BuildContext context) {
    controller.initialized;
    return Scaffold(
        body: SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            AppConstants.appName,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          Positioned(
            bottom: height * 0.01,
            child: SpinKitFadingFour(
              color: AppColors.appColorPrimary,
              size: 16.0,
            ),
          )
        ],
      ),
    ));
  }
}
