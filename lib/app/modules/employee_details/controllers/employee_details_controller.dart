import 'package:employee_directory/app/data/employee.dart';
import 'package:get/get.dart';

class EmployeeDetailsController extends GetxController {
  var arguments;

  @override
  void onInit() {
    arguments = Get.arguments['employee'] as Employee;
    super.onInit();
  }
}
