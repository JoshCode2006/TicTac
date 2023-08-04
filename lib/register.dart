import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/game_page.dart';
import 'package:tictactoe/landscape.dart';
import 'dimensions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController player1 = TextEditingController();
    TextEditingController player2 = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0XFFB886F8),
      body: Padding(
        padding: EdgeInsets.all(Dimensions.dim_20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Dimensions.dim_200,),
              Text(
                "Welcome 👋👋",
                style: GoogleFonts.tinos(
                  textStyle: TextStyle(
                      fontSize: Dimensions.dim_40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "Please enter your name to get started",
                style: TextStyle(fontSize: Dimensions.dim_20, color: Colors.white),
              ),
              SizedBox(
                height: Dimensions.dim_50,
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.dim_10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.dim_30),
                ),
                child: TextField(
                  controller: player1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Player 1 Name",
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.dim_30,
              ),
              Container(
                padding: EdgeInsets.all(Dimensions.dim_10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.dim_30),
                ),
                child: TextField(
                  controller: player2,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Player 2 Name",
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.dim_40,
              ),
              InkWell(
                onTap: () {
                  if (player1.text.trim() != "" && player2.text.trim() != "") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LayoutBuilder(
                          builder: (context, constraints) {
                            if (constraints.maxWidth > Dimensions.landscapeWidth) {
                              return LandScape(
                                player1: player1.text,
                                player2: player2.text,
                              );
                            } else {
                              return GamePage(
                                player1: player1.text,
                                player2: player2.text,
                              );
                            }
                          },
                        );
                      }),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please Fill Out All Fields",
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  height: Dimensions.dim_60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xffffbf6b),
                    borderRadius: BorderRadius.circular(Dimensions.dim_10),
                  ),
                  child: Center(
                    child: Text(
                      "Start Game",
                      style: TextStyle(
                        fontSize: Dimensions.dim_40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
