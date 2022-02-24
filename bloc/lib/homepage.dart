import 'package:bloc/bloc/employee_bloc.dart';
import 'package:bloc/employye.dart';
import 'package:bloc/ui/bottom_sheet.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();
  @override
  void dispose() {
    super.dispose();
    _employeeBloc.dispose();
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
        body: Stack(
          children: [
            Container(
              child: StreamBuilder<List<Employee>>(
                stream: _employeeBloc.employeeListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 5.0,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                snapshot.data![index].id.toString(),
                                style: const TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
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
                                    snapshot.data![index].name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    snapshot.data![index].salary.toString(),
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
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
                                  _employeeBloc.salaryIncrement
                                      .add(snapshot.data![index]);
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
                                onPressed: () {
                                  final Employee _employee =
                                      snapshot.data![index];
                                  _employeeBloc.salaryDecrement.add(_employee);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Text("Error Occured");
                  }
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            size: 40,
            color: Colors.black,
          ),
          onPressed: () {
            

            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const BottomSwipeSheet(),
            );
          },
        ),
      ),
    );
  }
}
