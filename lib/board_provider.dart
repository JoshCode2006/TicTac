import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/register.dart';

class BoardProvider extends ChangeNotifier {
  late bool gameOver = false;
  late String currentPlayer = "X";
  late List board = List.generate(
    3,
    (index) => List.generate(3, (index) => ""),
  );
  late String winner = "";

  resetGame() {
    gameOver = false;
    currentPlayer = "X";
    winner = "";
    board = List.generate(
      3,
      (index) => List.generate(3, (index) => ""),
    );
    notifyListeners();
  }

  checkWin(List table) {
    for (int i = 0; i < 3; i++) {
      if (table[i][0] == currentPlayer &&
          table[i][1] == currentPlayer &&
          table[i][2] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
        notifyListeners();

        break;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (table[0][i] == currentPlayer &&
          table[1][i] == currentPlayer &&
          table[2][i] == currentPlayer) {
        winner = currentPlayer;
        gameOver = true;
        notifyListeners();

        break;
      }
    }
    if (table[0][0] == currentPlayer &&
        table[1][1] == currentPlayer &&
        table[2][2] == currentPlayer) {
      winner = currentPlayer;
      gameOver = true;
      notifyListeners();
    }
    if (table[0][2] == currentPlayer &&
        table[1][1] == currentPlayer &&
        table[2][0] == currentPlayer) {
      winner = currentPlayer;
      gameOver = true;
      notifyListeners();
    }
    if (!board.any((row) => row.any((cell) => cell == ""))) {
      winner = "Tie";
      gameOver = true;
      notifyListeners();
    }
  }

  makeMove(BuildContext context, row, int col, player1, player2) {
    if (gameOver == false && board[row][col] == "") {
      board[row][col] = currentPlayer;
      checkWin(board);
      currentPlayer = currentPlayer == "X" ? "O" : "X";
      notifyListeners();

      if (winner != "") {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                content: Text(
                  winner != "Tie"
                      ? "The winner is ${winner == "X" ? "$player1 (X)" : "$player2 (O)"}"
                      : "It's a Tie",
                ),
                actions: [
                  MaterialButton(
                    onPressed: () {
                      resetGame();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Reset",
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Restart",
                    ),
                  )
                ],
              );
            });
            notifyListeners();
      }
    }
  }
}
