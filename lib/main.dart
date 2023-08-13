import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:splash/splash.dart';

import 'app/data/employee.dart';
import 'app/routes/app_pages.dart';
import 'package:employee_directory/app/constants/app_colors.dart';
import 'package:employee_directory/app/constants/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  registerHiveAdapters();
  await Hive.openBox<Employee>(AppConstants.employeeDb);
  runApp(
    GetMaterialApp(
      title: "Employee Directory Application",
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          primaryColor: AppColors.appColorPrimary,
          splashColor: AppColors.appColorPrimary.withOpacity(0.15),
          scaffoldBackgroundColor: Colors.white,
          splashFactory: WaveSplash.customSplashFactory(
            strokeWidth: 6,
            blurStrength: 0,
          ),
          highlightColor: Colors.transparent),
    ),
  );
}

void registerHiveAdapters() {
  if (!Hive.isAdapterRegistered(EmployeeAdapter().typeId)) Hive.registerAdapter(EmployeeAdapter());
  if ((!Hive.isAdapterRegistered(CompanyAdapter().typeId))) Hive.registerAdapter(CompanyAdapter());
  if ((!Hive.isAdapterRegistered(AddressAdapter().typeId))) Hive.registerAdapter(AddressAdapter());
  if ((!Hive.isAdapterRegistered(GeoAdapter().typeId))) Hive.registerAdapter(GeoAdapter());
}
