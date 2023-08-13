import 'package:get/get.dart';

import 'package:employee_directory/app/modules/employee_details/bindings/employee_details_binding.dart';
import 'package:employee_directory/app/modules/employee_details/views/employee_details_view.dart';
import 'package:employee_directory/app/modules/home/bindings/home_binding.dart';
import 'package:employee_directory/app/modules/home/views/home_view.dart';
import 'package:employee_directory/app/modules/splash/bindings/splash_binding.dart';
import 'package:employee_directory/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EMPLOYEE_DETAILS,
      page: () => EmployeeDetailsView(),
      binding: EmployeeDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
