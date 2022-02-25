// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:bloc/employye.dart';

enum EmployeeActions { Add, IncrementSalary, DecrementSalary }

class EmployeeBloc {
  // ignore: prefer_final_fields
  List<Employee> _employeeList = [
    Employee(1, "Shreyas Sarve", 10000),
    Employee(2, "Shruti Sarve", 20000),
    Employee(3, "Gita Sarve", 30000),
    Employee(4, "Shankar Sarve", 40000),
    Employee(5, "Amit Bhagat", 50000),
  ];
  final _employeeStreamController = StreamController<List<Employee>>();
  final _employeeSalaryIncrementController = StreamController<Employee>();
  final _employeeSalaryDecrementController = StreamController<Employee>();
  final _employeeAddingController = StreamController<Employee>();

//getters
  Stream<List<Employee>> get employeeListStream =>
      _employeeStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink =>
      _employeeStreamController.sink;

  StreamSink<Employee> get salaryIncrement =>
      _employeeSalaryIncrementController.sink;
  StreamSink<Employee> get salaryDecrement =>
      _employeeSalaryDecrementController.sink;
  StreamSink<Employee> get employeeAdded => _employeeAddingController.sink;

  EmployeeBloc() {
    _employeeStreamController.add(_employeeList);
    _employeeSalaryIncrementController.stream.listen(incrementSalary);
    _employeeSalaryDecrementController.stream.listen(decrementSalary);
    _employeeAddingController.stream.listen(addEmployee);
  }
  incrementSalary(Employee employee) {
    double incrementedSalary = employee.salary * 20 / 100;
    _employeeList[employee.id - 1].salary = employee.salary + incrementedSalary;

    employeeListSink.add(_employeeList);
  }

  decrementSalary(Employee employee) {
    double decrementedSalary = employee.salary * 20 / 100;
    _employeeList[employee.id - 1].salary = employee.salary - decrementedSalary;

    employeeListSink.add(_employeeList);
  }

  addEmployee(Employee employee) {
    employee.id = _employeeList.length + 1;
    _employeeList.add(employee);
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeStreamController.close();
    _employeeSalaryIncrementController.close();
    _employeeSalaryDecrementController.close();
    _employeeAddingController.close();
  }
}
