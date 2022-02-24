import 'package:flutter/material.dart';

class BottomSwipeSheet extends StatefulWidget {
  const BottomSwipeSheet({Key? key}) : super(key: key);

  @override
  State<BottomSwipeSheet> createState() => _BottomSwipeSheetState();
}

enum ButtonState { init, load, done }

class _BottomSwipeSheetState extends State<BottomSwipeSheet> {
  ButtonState buttonState = ButtonState.init;

  @override
  Widget build(BuildContext context) {
    bool isStreched = buttonState == ButtonState.init;
    bool done = buttonState == ButtonState.done;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black87,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                labelText: "Name",
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                contentPadding: const EdgeInsets.all(10),
                focusColor: Colors.black,
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              keyboardType: const TextInputType.numberWithOptions(),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.black87,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),
                labelText: "Salary",
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                contentPadding: const EdgeInsets.all(10),
                focusColor: Colors.black,
                icon: const Icon(
                  Icons.currency_rupee,
                  color: Colors.black,
                  size: 40,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
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
    );
  }

  buildOutlineButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: 2,
            color: Colors.black,
          ),
          shape: const StadiumBorder()),
      onPressed: () async {
        setState(() => buttonState = ButtonState.load);
        await Future.delayed(const Duration(seconds: 2));
        setState(() => buttonState = ButtonState.done);
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.of(context).pop();
      },
      child: const Text(
        "Submit",
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
      ),
    );
  }

  buildLoading(bool done) {
    Color col = done ? Colors.green : Colors.indigoAccent;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(15),
      child: done
          ? const Center(
              child: Icon(
                Icons.done,
                color: Colors.white,
                size: 30,
              ),
            )
          : const CircularProgressIndicator(color: Colors.white),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: col,
      ),
    );
  }
}
