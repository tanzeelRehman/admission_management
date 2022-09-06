import 'package:flutter/material.dart';

class CustomTxtButton extends StatelessWidget {
  final String txt;
  final double size;
  final VoidCallback ontap;
  const CustomTxtButton({
    Key? key,
    required this.txt,
    required this.size,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Text(
        txt,
        style: TextStyle(fontSize: size, color: Colors.grey[600]),
      ),
    );
  }
}
