import 'package:bloc/employye.dart';
import 'package:flutter/material.dart';

class BottomSwipeSheet extends StatefulWidget {
  const BottomSwipeSheet({Key? key}) : super(key: key);

  @override
  State<BottomSwipeSheet> createState() => _BottomSwipeSheetState();
}

enum ButtonState { init, load, done }

class _BottomSwipeSheetState extends State<BottomSwipeSheet> {
  ButtonState buttonState = ButtonState.init;
  final _nameController = TextEditingController();
  final _salaryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bgColor = Colors.black;
  final normalColor = Colors.white;
  final errosColor = Colors.red;
  final normalBorderColor = Colors.white;

  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    bool isStreched = buttonState == ButtonState.init;
    bool done = buttonState == ButtonState.done;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: TextStyle(color: normalColor),
                controller: _nameController,
                cursorColor: normalColor,
                decoration: InputDecoration(
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: errosColor,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: errosColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: normalBorderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: normalBorderColor,
                      width: 1.5,
                    ),
                  ),
                  labelText: "Name",
                  labelStyle: TextStyle(
                    color: normalColor,
                    fontSize: 20,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  focusColor: normalColor,
                  icon: Icon(
                    Icons.person,
                    color: normalColor,
                    size: 40,
                  ),
                ),
                validator: (value) {
                  hasError = _nameValidator(value.toString());
                  if (hasError) {
                    return "Name Must be 4 character large ";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                style: TextStyle(color: normalColor),
                controller: _salaryController,
                keyboardType: const TextInputType.numberWithOptions(),
                cursorColor: normalColor,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: normalBorderColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      color: normalBorderColor,
                      width: 1.5,
                    ),
                  ),
                  labelText: "Salary",
                  labelStyle: TextStyle(
                    color: normalColor,
                    fontSize: 20,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  focusColor: normalColor,
                  icon: Icon(
                    Icons.currency_rupee,
                    color: normalColor,
                    size: 40,
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              width: isStreched ? MediaQuery.of(context).size.width : 60,
              height: 60,
              padding: isStreched
                  ? const EdgeInsets.symmetric(horizontal: 30)
                  : const EdgeInsets.all(0),
              margin: const EdgeInsets.only(top: 20),
              child: isStreched ? buildOutlineButton() : buildLoading(done),
            ),
          ],
        ),
      ),
    );
  }

  buildOutlineButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 2,
            color: normalBorderColor,
          ),
          shape: const StadiumBorder()),
      onPressed: () async {
        setState(() => buttonState = ButtonState.load);
        _formKey.currentState!.validate();
        await Future.delayed(const Duration(seconds: 1));
        if (hasError) {
          setState(
            () => buttonState = ButtonState.init,
          );
        } else {
          setState(() => buttonState = ButtonState.done);
          await Future.delayed(const Duration(milliseconds: 500));
          double _salary = _salaryController.text == null
              ? 0.0
              : double.tryParse(_salaryController.text.toString())!.toDouble();
          Employee _employee = Employee(1, _nameController.text, _salary);
          Navigator.of(context).pop(_employee);
        }
      },
      child: Text(
        "Submit",
        style: TextStyle(
          fontSize: 30,
          color: normalColor,
        ),
      ),
    );
  }

  buildLoading(bool done) {
    Color col = done ? Colors.green : Colors.indigoAccent;
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: done
          ? const Center(
              child: Icon(
                Icons.done_all,
                color: Colors.white,
                size: 40,
              ),
            )
          : const CircularProgressIndicator(color: Colors.white),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: col,
      ),
    );
  }

  _nameValidator(String value) {
    if (value.length < 4) {
      return true;
    } else {
      return false;
    }
  }
}
