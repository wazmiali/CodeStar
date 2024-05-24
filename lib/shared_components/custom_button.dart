import 'package:flutter/material.dart';
// material

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xff035fa8), // 0xff035fa8
  });

  // final VoidCallback onPressed = (){};

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          fixedSize: Size.fromWidth(350),
          // should be able to change, should be able to change the background color
          padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      onPressed: onPressed,
      child: Text(text!),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  final String? text;
  final VoidCallback onPressed;

  CustomButton1({
    required this.text,
    required this.onPressed,
  });

  // final VoidCallback onPressed = (){};

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
          style: FilledButton.styleFrom(
              // side: BorderSide(width: 5.0, color: Colors.blue),
              foregroundColor: const Color.fromARGB(102, 0, 127, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              fixedSize: Size.fromWidth(MediaQuery.of(context).size.width - 40),
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
              textStyle: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )),
          onPressed: onPressed,
          child: Text(text!)),
    );
  }
}
