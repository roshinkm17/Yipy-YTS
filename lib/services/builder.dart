import 'package:flutter/material.dart';

class CustomBuilder extends StatelessWidget {
  CustomBuilder({@required this.array});
  final array;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: array.length,
      itemBuilder: (BuildContext context, int index) {
        return array[index];
      },
    );
  }
}
