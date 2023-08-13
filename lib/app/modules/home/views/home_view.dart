// ignore_for_file: require_trailing_commas

import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_directory/app/constants/app_colors.dart';
import 'package:employee_directory/app/constants/app_constants.dart';
import 'package:employee_directory/app/constants/strings.dart';
import 'package:employee_directory/app/modules/home/controllers/home_controller.dart';
import 'package:employee_directory/app/network/endpoints.dart';
import 'package:employee_directory/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  final height = Get.mediaQuery.size.height;
  final width = Get.mediaQuery.size.width;
  @override
  Widget build(BuildContext context) {
    controller.initialized;
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text(AppConstants.appName),
      ),
      body: buildHomeBody(),
    );
  }

  Widget buildHomeBody() {
    print(height);
    return SizedBox(
      width: width,
      height: height - kToolbarHeight,
      // color: Colors.red,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 6),
            SizedBox(
              // color: Colors.green,
              width: width,
              height: height * 0.068,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                ),
                child: TextField(
                  onChanged: (v) => controller.onEmployeeSearch(v),
                  cursorColor: AppColors.appColorPrimary,
                  cursorWidth: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: Strings.searchHintText,
                    hintStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                    contentPadding: const EdgeInsets.only(bottom: 4, left: 6, right: 4),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColors.textFeildBorderColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: AppColors.textFeildBorderColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 0.7,
                        color: AppColors.appColorPrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width,
              height: height - (kToolbarHeight + (height * 0.11)),
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    final employee = controller.employeeList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 6,
                      ),
                      child: Material(
                        elevation: 5,
                        shadowColor: AppColors.employeeListShadowColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: SizedBox(
                          height: height > 595 ? height * 0.1 : height * 0.14,
                          child: Center(
                            child: ListTile(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                Get.toNamed(
                                  Routes.EMPLOYEE_DETAILS,
                                  arguments: {'employee': employee},
                                );
                              },
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.withOpacity(0.3),
                                backgroundImage: CachedNetworkImageProvider(
                                  employee.profileImage ?? Endpoints.profilePlaceHolderUrl,
                                ),
                              ),
                              title: Text(employee.name ?? ''),
                              subtitle: Text(employee.company?.name ?? ''),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: controller.employeeList.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
