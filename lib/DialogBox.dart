import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  String text;
  int score1;
  int score2;
  String player1;
  String player2;

  DialogBox({required this.text, required this.score1, required this.score2 ,required this.player1,required this.player2});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: 350,
          child: AlertDialog(
      title: Text('The Result'),
      content: Column(
          children: [
            Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height:25 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.cyan,
                  child: Text('''${player1} Score: 
                  
            $score1'''),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.cyan,
                  child: Text('''${player2} Score: 
                  
            $score2'''),
                ),
              ],
            )
          ],
      ),
      actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
      ],
    ),
        ));
  }
}
