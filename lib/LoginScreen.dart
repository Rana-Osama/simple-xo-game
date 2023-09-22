import 'package:flutter/material.dart';
import 'package:simple_xo_game/BoardScreen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String player1Name = '';

  String player2Name = '';

  String errorPlayer1 = '';

  String errorPlayer2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Text('Tic Tac Toe', style: TextStyle(fontSize: 35))),
        backgroundColor: Color(0xFF1CB9B5),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(25),
                  child: Image.asset(
                    'assets/images/xo.jpg',
                    width: 300,
                  )),
              SizedBox(
                height: 80,
              ),
              TextField(
                onChanged: (newText) {
                  player1Name = newText;
                },
                decoration: InputDecoration(
                    hintText: 'Player 1 Name ',
                    filled: true,
                    fillColor: Colors.white,
                    errorText: errorPlayer1,
                    hintStyle: TextStyle(
                      color: Color(0xFF1CB9B5),
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Color(0xFF1CB9B5), width: 50))),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                onChanged: (newText) {
                  player2Name = newText;
                },
                decoration: InputDecoration(
                    hintText: 'Player 2 Name ',
                    filled: true,
                    fillColor: Colors.white,
                    errorText: errorPlayer2,
                    hintStyle: TextStyle(
                      color: Color(0xFF1CB9B5),
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Color(0xFF1CB9B5), width: 50),
                    )),
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (player1Name.isEmpty || player2Name.isEmpty) {
                      setState(() {
                        if (player1Name.isEmpty) {
                          errorPlayer1 = 'Please enter player 1 name';
                        } else {
                          errorPlayer1 = '';
                        }
                        if (player2Name.isEmpty) {
                          errorPlayer2 = 'Please enter player 2 name';
                        } else {
                          errorPlayer2 = '';
                        }
                      });
                      return;
                    }
                    setState(() {
                      Navigator.pushNamed(context, BoardScreen.routeName,
                          arguments: BoardScreenArgs(
                              player1Name: player1Name,
                              player2Name: player2Name));
                      errorPlayer1 = '';
                      errorPlayer2 = '';
                    });
                  },
                  child: Text(
                    'Start Game',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1CB9B5),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
