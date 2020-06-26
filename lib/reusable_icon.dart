import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableIcon extends StatelessWidget {
  final String genderText;
  final IconData icon;

  ReusableIcon({@required this.icon, @required this.genderText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: KCardInsideText,
        )
      ],
    );
  }
}
