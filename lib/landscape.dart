import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/board_provider.dart';
import 'package:tictactoe/register.dart';
import 'dimensions.dart';

class LandScape extends StatefulWidget {
  final String player1;
  final String player2;

  const LandScape({
    Key? key,
    required this.player1,
    required this.player2,
  }) : super(key: key);

  @override
  State<LandScape> createState() => _LandScapeState();
}

class _LandScapeState extends State<LandScape> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BoardProvider>(builder: (context, boardModel, child) {
      return Scaffold(
        backgroundColor: const Color(0XFFB886F8),
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                )),
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.dim_10,
                    top: Dimensions.dim_10,
                  ),
                  width: Dimensions.dim_40,
                  height: Dimensions.dim_40,
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    CupertinoIcons.back,
                    size: Dimensions.dim_30,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dimensions.dim_15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.dim_10),
                                color: Colors.deepPurple,
                                border: Border.all(
                                  color: Colors.white,
                                  width:
                                      boardModel.currentPlayer == "X" ? 5 : 0,
                                ),
                              ),
                              width: Dimensions.dim_120,
                              height: Dimensions.dim_120,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.player1,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: Dimensions.dim_20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "X",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimensions.dim_60,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.dim_10),
                                color: Colors.deepPurple,
                                border: Border.all(
                                  color: Colors.white,
                                  width:
                                      boardModel.currentPlayer == "O" ? 5 : 0,
                                ),
                              ),
                              width: Dimensions.dim_120,
                              height: Dimensions.dim_120,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.player2,
                                      style: TextStyle(
                                          fontSize: Dimensions.dim_20,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "O",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimensions.dim_60,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: Dimensions.dim_350,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(Dimensions.dim_20),
                      ),
                      height: double.infinity,
                      child: Center(
                        child: SizedBox(
                          child: GridView.builder(
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: 9,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                int row = index ~/ 3;
                                int col = index % 3;
                                return GestureDetector(
                                  onTap: () {
                                    boardModel.makeMove(context, row, col,
                                        widget.player1, widget.player2);
                                  },
                                  child: Container(
                                    color: Colors.deepPurple,
                                    margin: EdgeInsets.all(Dimensions.dim_10),
                                    child: Center(
                                      child: Text(
                                        boardModel.board[row][col],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Dimensions.dim_70,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.dim_30,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
