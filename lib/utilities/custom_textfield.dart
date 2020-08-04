import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.labelText, this.obscureText});
  final String labelText;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: TextField(
        style: TextStyle(color: Colors.white54, fontSize: 20),
        obscureText: obscureText,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            filled: true,
            fillColor: Color(0xff363636),
            labelText: "$labelText",
            labelStyle: TextStyle(
              color: Color(0xff5e5a5a),
              fontSize: 20,
            )),
      ),
    );
  }
}
