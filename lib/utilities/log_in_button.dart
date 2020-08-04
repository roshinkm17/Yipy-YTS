import 'package:flutter/material.dart';

class LogInButton extends StatelessWidget {
  LogInButton({this.onPressed});
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: onPressed,
      child: Text(
        "Log in",
        style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      color: Colors.white54,
    );
  }
}
