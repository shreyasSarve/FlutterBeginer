import 'package:bloc/bloc/employee_bloc.dart';
import 'package:bloc/employye.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatefulWidget {
  
  final Employee employee;

  EmployeeCard(this.employee, {Key? key}) : super(key: key);

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              widget.employee.id.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.employee.name,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  widget.employee.salary.toString(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              icon: const Icon(
                Icons.thumb_up,
                color: Colors.green,
                size: 30,
              ),
              onPressed: () {
                _employeeBloc.salaryIncrement.add(widget.employee);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: IconButton(
              icon: const Icon(
                Icons.thumb_down,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
