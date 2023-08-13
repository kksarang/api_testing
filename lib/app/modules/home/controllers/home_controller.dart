import 'dart:async';
import 'dart:convert';

import 'package:employee_directory/app/data/employee.dart';
import 'package:employee_directory/app/network/endpoints.dart';
import 'package:employee_directory/app/network/http_client.dart';
import 'package:employee_directory/app/utils/storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final employeeDataList = <Employee>[].obs;
  final employeeList = <Employee>[].obs;

  Timer? _debounceTimer;

  void onEmployeeSearch(String query) {
    if (_debounceTimer?.isActive ?? false) _debounceTimer?.cancel();
    _debounceTimer = Timer(
      const Duration(milliseconds: 600),
      () {
        if (query.isEmpty) {
          employeeList.clear();
          employeeList.addAll(employeeDataList);
        } else {
          employeeList.clear();
          final resultList = employeeDataList
              .where((element) => ((element.name ?? '').toLowerCase().startsWith(query.toLowerCase()) ||
                  (element.email ?? '').toLowerCase().startsWith(query.toLowerCase())))
              .toList();
          employeeList.addAll(resultList);
        }
      },
    );
  }

  Future<void> loadEmployeeListFromServer() async {
    final result = await NetworkClient.request(Endpoints.getEmployeeList);
    final dataList = jsonDecode(result.data) as List<dynamic>;
    for (final element in dataList) {
      final Employee employee = Employee.fromJson(element);
      employeeDataList.add(employee);
      employeeList.add(employee);
      LocalStorage.instance.addEmployee(employee.id!, employee);
    }
  }

  Future<void> loadEmployeeListFromStorage() async {
    final List<Employee> existingEmployeeList = await LocalStorage.instance.getEmployees();
    employeeDataList.addAll(existingEmployeeList);
    employeeList.addAll(existingEmployeeList);
  }

  Future<void> checkEmployeeList() async {
    final List<Employee> existingEmployeeList = await LocalStorage.instance.getEmployees();
    if (existingEmployeeList.isEmpty) {
      loadEmployeeListFromServer();
    } else {
      loadEmployeeListFromStorage();
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkEmployeeList();
  }
}
