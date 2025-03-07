import 'package:flutter/material.dart';

class Custombtn extends StatelessWidget {
  final color;
  final textcolor;
  final String text;
  final func;
  const Custombtn(
      {super.key,
      this.color,
      required this.text,
      this.textcolor,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textcolor),
          ),
        ),
      ),
    );
  }
}
