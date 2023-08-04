import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/register.dart';
import 'package:google_fonts/google_fonts.dart';

import 'button.dart';
import 'dimensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb886fb),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: Dimensions.dim_15,
                top: Dimensions.dim_10,
                left: Dimensions.dim_10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.volume_up_sharp,
                    size: Dimensions.dim_40,
                  ),
                  SizedBox(
                    width: Dimensions.dim_45,
                    height: Dimensions.dim_45,
                    child: Image.asset(
                      "lib/images/ADS_img.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.dim_100,
            ),
            SizedBox(
              width: double.maxFinite,
              height: Dimensions.dim_500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: Dimensions.dim_60,
                      ),
                      Text(
                        "TIC TAC",
                        style: GoogleFonts.tinos(
                          textStyle: TextStyle(
                            fontSize: Dimensions.dim_50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: Dimensions.dim_100,
                      ),
                      Text(
                        "TOE CLASH",
                        style: GoogleFonts.tinos(
                          textStyle: TextStyle(
                            fontSize: Dimensions.dim_50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.dim_100,
                  ),
                  MyButton(
                    text: "PLAY",
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const RegisterPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: Dimensions.dim_30,
                  ),
                  const MyButton(text: "RATE US"),
                  SizedBox(
                    height: Dimensions.dim_30,
                  ),
                  MyButton(
                    text: "EXIT",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            content:
                                const Text("Are you sure you want to quit"),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),

                              ),
                              MaterialButton(
                                onPressed: () {
                                  SystemNavigator.pop();
                                },
                                child: const Text("Quit"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
