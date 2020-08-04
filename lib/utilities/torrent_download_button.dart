import 'package:flutter/material.dart';
import 'package:yipy_yts/constants.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class TorrentDownloadButton extends StatefulWidget {
  TorrentDownloadButton({this.size, this.quality, this.type, this.downloadLink, this.title});
  final String size, type, quality, downloadLink, title;

  @override
  _TorrentDownloadButtonState createState() => _TorrentDownloadButtonState();
}

class _TorrentDownloadButtonState extends State<TorrentDownloadButton> {
  bool downloadCompleted = false;
  var progress;
  var progressString = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 40),
      child: RaisedButton(
        color: greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading
            ? CircularProgressIndicator()
            : Text(
                widget.quality + " " + widget.type + " (${widget.size})",
                style: size12Medium.copyWith(color: Colors.white),
              ),
        onPressed: () async {
          setState(() {
            loading = true;
          });
          Dio dio = Dio();
          try {
            var dir = await getApplicationDocumentsDirectory();
            await dio.download(widget.downloadLink, "${dir.path}/sample.torrent", onReceiveProgress: (actual, total) {
              setState(() {
                progressString = ((actual / total) * 100).toStringAsFixed(0) + "%";
                print(actual);
              });
            });
          } catch (e) {
            print(e);
          }
          setState(() {
            loading = false;
            final snackBar = SnackBar(content: Text('Download Complete!'));
            Scaffold.of(context).showSnackBar(snackBar);
          });
        },
      ),
    );
  }
}
