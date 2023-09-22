import 'package:flutter/material.dart';
import 'package:simple_xo_game/BoardButton.dart';
import 'package:simple_xo_game/DialogBox.dart';


class BoardScreen extends StatefulWidget {
  static const String routeName = 'BoardScreen';

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  List<String> boardState = ['', '', '', '', '', '', '', '', ''];
  int player1Score = 0;

  int player2Score = 0;
  // player 1 = > true , player 2 => false
  bool currentPlayer = true;
  bool previousWinner = true;
  Color player1Color = Colors.cyan;
  Color player2Color = Colors.black;

  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {
    BoardScreenArgs arguments =
        ModalRoute.of(context)?.settings.arguments as BoardScreenArgs;
    player1Name = arguments.player1Name;
    player2Name = arguments.player2Name;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
            alignment: Alignment.center,
            child: Text(
              'Tic Tac Toe',
              style: TextStyle(fontSize: 35),
            )),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: player1Color,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${arguments.player1Name} (X)',
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text('Score: $player1Score',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Container(
                  color:  player2Color,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${arguments.player2Name} (O)',
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text('Score: $player2Score',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  buttonText: boardState[0],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 0,
                ),
                BoardButton(
                  buttonText: boardState[1],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 1,
                ),
                BoardButton(
                  buttonText: boardState[2],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  buttonText: boardState[3],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 3,
                ),
                BoardButton(
                  buttonText: boardState[4],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 4,
                ),
                BoardButton(
                  buttonText: boardState[5],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoardButton(
                  buttonText: boardState[6],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 6,
                ),
                BoardButton(
                  buttonText: boardState[7],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 7,
                ),
                BoardButton(
                  buttonText: boardState[8],
                  onPlayerClickCallBack: onPlayerClick,
                  position: 8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  int counter = 0;

  void onPlayerClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }

    if (previousWinner){
      if (counter.isEven) {
        boardState[index] = 'X';
        player1Color = Colors.black;
        player2Color = Colors.cyan;
      } else {
        boardState[index] = 'O';
       player1Color = Colors.cyan;
        player2Color = Colors.black;
      }
      counter++;

    }else {
      if (counter.isEven) {
        boardState[index] = 'O';
       player1Color = Colors.cyan;
        player2Color = Colors.black;
      } else {
        boardState[index] = 'X';
       player1Color = Colors.black;
         player2Color = Colors.cyan;
      }
      counter++;

    }


    setState(() {});

    if (checkWinner('X')) {
      player1Score += 5;
      showResult('The Winner is ${player1Name}', player1Score, player2Score ,player1Name,player2Name);
      previousWinner = true;
      initBoard();
    } else if (checkWinner("O")) {
      player2Score += 5;
      showResult('The Winner is ${player2Name}', player1Score, player2Score,player1Name,player2Name);
      previousWinner = false ;
      initBoard();
    } else if (counter == 9) {
      showResult('Draw !!', player1Score, player2Score,player1Name,player2Name);
      previousWinner = true;
      //draw
      initBoard();
    }
    currentPlayer = !currentPlayer;
    setState(() {});
  }

  bool checkWinner(String playerSymbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == playerSymbol &&
          boardState[i + 1] == playerSymbol &&
          boardState[i + 2] == playerSymbol) {
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (boardState[i] == playerSymbol &&
          boardState[i + 3] == playerSymbol &&
          boardState[i + 6] == playerSymbol) {
        return true;
      }
    }

    if (boardState[0] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[8] == playerSymbol) {
      return true;
    }

    if (boardState[2] == playerSymbol &&
        boardState[4] == playerSymbol &&
        boardState[6] == playerSymbol) {
      return true;
    }

    return false;
  }

  void initBoard() {
    boardState = ['', '', '', '', '', '', '', '', ''];
    counter = 0;
    if (previousWinner) {
      player1Color = Colors.cyan;
      player2Color = Colors.black;
    
    } else {
      player1Color = Colors.black;
      player2Color = Colors.cyan;
    }

  }


  void showResult(String text, int score1, int score2 , String player1, String player2) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>DialogBox(
        text: text,
        score1: score1,
        score2: score2,
        player1: player1,
        player2: player2,
      ),
    );
    setState(() {});
    }
  }





class BoardScreenArgs {
  String player1Name;
  String player2Name;

  BoardScreenArgs({required this.player1Name, required this.player2Name});
}


