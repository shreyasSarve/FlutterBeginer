import 'package:bloc/bloc/employee_bloc.dart';
import 'package:bloc/employye.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final EmployeeBloc employeeBloc = EmployeeBloc();
  @override
  void dispose() {
    super.dispose();
    employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "Bloc App",
          ),
        ),
        body: Container(
            child: StreamBuilder<List<Employee>>(
          stream: employeeBloc.employeeListStream,
          builder: (context, snapshot) => Container(),
        )),
      ),
    );
  }
}
