import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yipy_yts/constants.dart';
import 'package:yipy_yts/screens/log_in_screen.dart';
import 'package:yipy_yts/screens/sign_up_screen.dart';
import 'package:yipy_yts/utilities/log_in_button.dart';
import 'package:yipy_yts/utilities/sign_up_button.dart';

class WelcomeScreen extends StatelessWidget {
  static String id = "welcome_screen_id";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    AutoSizeText("Wel\nco\nme",
                        minFontSize: 30, maxLines: 3, style: TextStyle(fontSize: 100, color: Colors.white24, fontWeight: FontWeight.bold, height: 1)),
                    AutoSizeText("to", minFontSize: 30, maxLines: 1, style: TextStyle(color: Colors.white24, fontSize: 32)),
                    AutoSizeText("Yipi",
                        minFontSize: 30, maxLines: 1, style: TextStyle(fontSize: 100, color: Colors.white24, fontWeight: FontWeight.bold, height: 1)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Hero(
                        tag: 'signupButton',
                        child: Container(
                            width: double.infinity,
                            child: SignUpButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SignUpScreen.id);
                              },
                            ))),
                    SizedBox(height: 20),
                    Hero(
                        tag: 'loginButton',
                        child: Container(
                            width: double.infinity,
                            child: LogInButton(
                              onPressed: () {
                                Navigator.pushNamed(context, LogInScreen.id);
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
