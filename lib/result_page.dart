import 'package:bmicalculatorpractice/bottom_button.dart';
import 'package:bmicalculatorpractice/constants.dart';
import 'package:bmicalculatorpractice/input_page.dart';
import 'package:bmicalculatorpractice/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String textTitle;
  final String result;
  final String textComment;
  ResultPage({this.textTitle, this.result, this.textComment});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              'Your Results!',
              style: KBoldFont,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: KActiveColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    textTitle.toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.greenAccent),
                  ),
                  Text(
                    result.toString(),
                    style: KBoldFont,
                  ),
                  Text(
                    textComment,
                    style: KCardInsideText,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InputPage()));
            },
            bottomText: 'RE-CALCULATE BMI',
          )
        ],
      ),
    );
  }
}
