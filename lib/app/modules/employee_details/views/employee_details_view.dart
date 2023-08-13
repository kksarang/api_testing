import 'package:cached_network_image/cached_network_image.dart';
import 'package:employee_directory/app/constants/app_colors.dart';
import 'package:employee_directory/app/constants/diamens.dart';
import 'package:employee_directory/app/constants/strings.dart';
import 'package:employee_directory/app/data/employee.dart';
import 'package:employee_directory/app/modules/employee_details/controllers/employee_details_controller.dart';
import 'package:employee_directory/app/network/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeDetailsView extends GetView<EmployeeDetailsController> {
  final height = Get.mediaQuery.size.height;
  final width = Get.mediaQuery.size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(Strings.employeeDetails),
        centerTitle: false,
      ),
      body: buildEmployeDetailsBody(),
    );
  }

  Widget buildEmployeDetailsBody() {
    return SizedBox(
      width: width,
      height: height - kToolbarHeight,
      child: Column(
        children: [
          Container(
            width: width,
            height: height > 595 ? height * 0.2 : height * 0.23,
            color: const Color.fromARGB(36, 233, 30, 98),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height > 595 ? height * 0.1 : height * 0.11,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, -10),
                        )
                      ],
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(16)),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: width,
                    height: height > 595 ? height * 0.1 : height * 0.12,
                    child: Row(
                      children: [
                        Flexible(child: Container()),
                        Flexible(
                          flex: 2,
                          child: SizedBox(
                            height: height > 595 ? height * 0.1 : height * 0.12,
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: width,
                                  child: Text(
                                    (controller.arguments as Employee).name ?? '',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: width,
                                  child: Text(
                                    (controller.arguments as Employee).company?.name ?? '',
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: width * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      width: width * 0.25,
                      height: width * 0.25,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: (controller.arguments as Employee).profileImage ?? Endpoints.profilePlaceHolderUrl,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildTitleBar(content: Strings.username),
                    buildUserDataWidget(
                      text: (controller.arguments as Employee).username ?? '--',
                    ),
                    buildDivider(),
                    buildTitleBar(content: Strings.email),
                    buildUserDataWidget(
                      text: (controller.arguments as Employee).email ?? '--',
                    ),
                    buildDivider(),
                    buildTitleBar(content: Strings.phoneNumber),
                    buildUserDataWidget(
                      text: (controller.arguments as Employee).phone ?? '--',
                    ),
                    buildDivider(),
                    buildTitleBar(content: Strings.website),
                    buildUserDataWidget(
                      text: (controller.arguments as Employee).website ?? '--',
                    ),
                    buildDivider(),
                    Visibility(
                      visible: (controller.arguments as Employee).company != null,
                      child: buildTitleBar(content: Strings.company),
                    ),
                    Visibility(
                      visible: (controller.arguments as Employee).company != null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Diamens.paddingMedium + 2,
                          horizontal: Diamens.paddingMedium,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 6),
                              buildTitleBar(content: Strings.companyName),
                              buildUserDataWidget(
                                text: (controller.arguments as Employee).company?.name ?? '--',
                                fontSize: 16,
                              ),
                              buildTitleBar(
                                content: Strings.companyCatchPhrase,
                              ),
                              buildUserDataWidget(
                                text: (controller.arguments as Employee).company?.catchPhrase ?? '--',
                                fontSize: 16,
                              ),
                              buildTitleBar(content: Strings.companyBusiness),
                              buildUserDataWidget(
                                text: (controller.arguments as Employee).company?.bs ?? '--',
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // address
                    buildTitleBar(content: Strings.address),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Diamens.paddingMedium + 2,
                        horizontal: Diamens.paddingMedium,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      buildTitleBar(content: Strings.street),
                                      buildUserDataWidget(
                                        text: (controller.arguments as Employee).address?.street ?? '--',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      buildTitleBar(content: Strings.suite),
                                      buildUserDataWidget(
                                        text: (controller.arguments as Employee).address?.suite ?? '--',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      buildTitleBar(content: Strings.city),
                                      buildUserDataWidget(
                                        text: (controller.arguments as Employee).address?.city ?? '--',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      buildTitleBar(content: Strings.zip),
                                      buildUserDataWidget(
                                        text: (controller.arguments as Employee).address?.zipcode ?? '--',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      buildTitleBar(content: Strings.lat),
                                      buildUserDataWidget(
                                        text: (controller.arguments as Employee).address?.geo?.lat ?? '--',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      buildTitleBar(content: Strings.long),
                                      buildUserDataWidget(
                                        text: (controller.arguments as Employee).address?.geo?.lng ?? '--',
                                        fontSize: 16,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    buildDivider()
                  ],
                ),
              ),
              // color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }

  Widget buildUserDataWidget({required String text, double? fontSize}) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height * 0.05, minWidth: width),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(
            left: Diamens.paddingLarge,
            right: Diamens.paddingLarge,
            bottom: Diamens.paddingLarge,
            top: Diamens.paddingMedium,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize ?? 18,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitleBar({required String content}) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height * 0.01, minWidth: width),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(
            top: Diamens.paddingSmall,
            bottom: Diamens.paddingSmall,
            left: Diamens.paddingLarge,
          ),
          child: Text(
            content,
            style: const TextStyle(fontSize: 14, color: AppColors.appColorPrimary),
          ),
        ),
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: width,
        height: 0.4,
        color: Colors.grey.shade300,
      ),
    );
  }
}
