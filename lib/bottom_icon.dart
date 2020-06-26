import 'package:flutter/material.dart';
import 'constants.dart';

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final Function onTab;
  BottomIcon({@required this.icon, @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTab,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: KInactiveColor,
    );
  }
}
