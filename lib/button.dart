import 'package:flutter/material.dart';
import 'dimensions.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function? onTap;

  const MyButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        width: Dimensions.dim_250,
        height: Dimensions.dim_60,
        decoration: BoxDecoration(
          color: const Color(0xffffbf6b),
          borderRadius: BorderRadius.circular(Dimensions.dim_10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: Dimensions.dim_30,
            ),
          ),
        ),
      ),
    );
  }
}
