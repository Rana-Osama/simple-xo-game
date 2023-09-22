import 'package:flutter/material.dart';

typedef OnPlayerClickCallBack = void Function(int);

class BoardButton extends StatelessWidget {
  String buttonText;

  Function onPlayerClickCallBack;

  int position;

  BoardButton(
      {required this.buttonText,
      required this.onPlayerClickCallBack,
      required this.position});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: ElevatedButton(
            onPressed: () {
              onPlayerClickCallBack(position);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
            child: Text(
              buttonText,
              style: TextStyle(fontSize: 100, color: Colors.black),
            )),
      ),
    );
  }
}
