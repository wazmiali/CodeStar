import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final String? text;
  final VoidCallback onPressed;
  final Color backgroundColor ;
  
  
  CustomButton({
    this.text,
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
            borderRadius: BorderRadius.circular(7),
            // 12 is much better
          ),
          fixedSize: Size.fromWidth(350), // should be able to change, should be able to change the background color
          padding: EdgeInsetsDirectional.fromSTEB(0, 17, 0, 17),
          textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      onPressed: onPressed,
      child: Text(text!),
    );
  }
}
