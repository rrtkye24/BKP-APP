import 'package:flutter/material.dart';
import '/constant.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.label,
    required this.onChange, this.password = false,
  }) : super(key: key);

  final String label;
   final Function onChange;
  final bool password;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        obscureText: password,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: UnderlineInputBorder(
              borderSide: BorderSide(
            color: mPrimaryColor,
            width: 2,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: mPrimaryColor,
            width: 2,
          )),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          )),
        ),
      ),
    );
  }
}
