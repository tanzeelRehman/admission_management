import 'package:admission_management/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomFillButton extends StatelessWidget {
  final double height;
  final double width;
  final String txt;
  final VoidCallback onPressed;
  const CustomFillButton({
    Key? key,
    required this.height,
    required this.width,
    required this.txt,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: acentcolor, borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          txt,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
