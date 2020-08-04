import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/screens/genre_select.dart';
import 'package:yipy_yts/utilities/custom_textfield.dart';
import 'package:yipy_yts/utilities/sign_up_button.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "log-in_screen_id";
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Text("Sign\nup", style: TextStyle(fontSize: 100, color: Colors.white24, fontWeight: FontWeight.bold, height: 1))),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomTextField(labelText: "Full Name", obscureText: false),
                    SizedBox(height: 20),
                    CustomTextField(labelText: "Email", obscureText: false),
                    SizedBox(height: 20),
                    CustomTextField(labelText: "Password", obscureText: true),
                    SizedBox(height: 20),
                    Hero(
                        tag: 'signupButton',
                        child: Container(
                            width: double.infinity,
                            child: SignUpButton(
                              onPressed: () {
                                Navigator.pushNamed(context, GenreSelect.id);
                              },
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
