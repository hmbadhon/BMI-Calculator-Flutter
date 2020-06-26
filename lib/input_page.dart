import 'package:bmicalculatorpractice/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'reusable_icon.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'bottom_icon.dart';
import 'bmi_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 22;
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
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: ReusableCard(
                    cardChild: ReusableIcon(
                      icon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                    colour: selectedGender == Gender.male
                        ? KActiveColor
                        : KInactiveColor,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: ReusableCard(
                    cardChild: ReusableIcon(
                      icon: FontAwesomeIcons.venus,
                      genderText: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? KActiveColor
                        : KInactiveColor,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: KCardInsideText,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(height.toString(), style: KBoldFont),
                      Text(
                        'CM',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTickMarkColor: Colors.grey,
                      thumbColor: Colors.pink,
                      overlayColor: Color(0x29FF0000),
                    ),
                    child: Slider(
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
              colour: KActiveColor,
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: KCardInsideText,
                      ),
                      Text(
                        weight.toString(),
                        style: KBoldFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BottomIcon(
                            icon: FontAwesomeIcons.minus,
                            onTab: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          BottomIcon(
                            icon: FontAwesomeIcons.plus,
                            onTab: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: KActiveColor,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: KCardInsideText,
                      ),
                      Text(
                        age.toString(),
                        style: KBoldFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BottomIcon(
                            icon: FontAwesomeIcons.minus,
                            onTab: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          BottomIcon(
                            icon: FontAwesomeIcons.plus,
                            onTab: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  colour: KActiveColor,
                ),
              ),
            ],
          )),
          BottomButton(
            onPress: () {
              BmiBrain bmi = BmiBrain(weight: weight, height: height);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    result: bmi.bmiCal(),
                    textTitle: bmi.bmiTitle(),
                    textComment: bmi.bmiComments(),
                  ),
                ),
              );
            },
            bottomText: 'CALCULATE',
          )
        ],
      ),
    );
  }
}
