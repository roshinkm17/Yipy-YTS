import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/screens/genre_select.dart';
import 'package:yipy_yts/utilities/custom_textfield.dart';
import 'package:yipy_yts/utilities/log_in_button.dart';

class LogInScreen extends StatefulWidget {
  static String id = "log-in_screen_id";
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Text("Log\nin", style: TextStyle(fontSize: 100, color: Colors.white24, fontWeight: FontWeight.bold, height: 1))),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    CustomTextField(labelText: "Email", obscureText: false),
                    SizedBox(height: 20),
                    CustomTextField(labelText: "Password", obscureText: true),
                    SizedBox(height: 20),
                    Hero(
                        tag: 'loginButton',
                        child: Container(
                            width: double.infinity,
                            child: LogInButton(
                              onPressed: () {},
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
