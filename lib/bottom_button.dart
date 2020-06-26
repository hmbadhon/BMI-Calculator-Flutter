import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String bottomText;
  final Function onPress;
  BottomButton({@required this.bottomText, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 70.0,
        width: double.infinity,
        color: Colors.pink,
        child: Center(
          child: Text(
            bottomText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
