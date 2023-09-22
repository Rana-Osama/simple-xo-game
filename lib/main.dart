import 'package:flutter/material.dart';
import 'package:simple_xo_game/BoardScreen.dart';
import 'package:simple_xo_game/LoginScreen.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        BoardScreen.routeName: (_) => BoardScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}
