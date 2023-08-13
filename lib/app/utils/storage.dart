import 'package:employee_directory/app/constants/app_constants.dart';
import 'package:employee_directory/app/data/employee.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorage {
  LocalStorage._privateConstructor();
  static final LocalStorage _instance = LocalStorage._privateConstructor();

  static LocalStorage get instance {
    return _instance;
  }

  static final employeeBox = Hive.box<Employee>(AppConstants.employeeDb);

  void addEmployee(int key, Employee employee) async {
    await employeeBox.put(key, employee);
  }

  void deleteEmployee(int id) async {
    await employeeBox.delete(id);
  }

  Future<List<Employee>> getEmployees() async {
    List<Employee> _temporaryEmployeeList = [];
    var data = await employeeBox.values;
    _temporaryEmployeeList.addAll(data);
    return _temporaryEmployeeList;
  }
}
