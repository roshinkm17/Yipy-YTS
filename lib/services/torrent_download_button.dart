import 'package:flutter/material.dart';
import 'package:yipy_yts/constants.dart';

class TorrentDownloadButton extends StatelessWidget {
  TorrentDownloadButton(
      {this.size, this.quality, this.type, this.downloadLink});
  final String size, type, quality, downloadLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 40),
      child: RaisedButton(
        color: greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          quality + " " + type + " ($size)",
          style: size12Medium.copyWith(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }
}
