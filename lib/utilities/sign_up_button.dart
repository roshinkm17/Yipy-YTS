import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  SignUpButton({this.onPressed});
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      padding: EdgeInsets.all(20),
      highlightElevation: 10,
      splashColor: Colors.black,
      highlightColor: Colors.black,
      color: Colors.black,
      child: Text(
        "Sign up",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white54),
      ),
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      borderSide: BorderSide(color: Colors.white24, width: 5),
    );
  }
}
