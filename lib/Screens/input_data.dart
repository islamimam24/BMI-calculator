import 'package:bmi_calculator/Calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/IconContent.dart';
import '../Components/ReusableCard.dart';
import '../Constants.dart';
import 'Result_Page.dart';
import '../Components/bottom_Button.dart';
import '../Components/Round_Icon_Button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 75;
  int Age = 27;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Builder(
        builder: (context) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
              Expanded(
                child: ReusedCard(
                  OnPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  Colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInActiveCardColour,
                  CardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    Data: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReusedCard(
                  OnPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  Colour: selectedGender == Gender.female
                      ? kActiveCardColour
                      : kInActiveCardColour,
                  CardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    Data: 'Female',
                  ),
                ),
              ),
            ]),
            Expanded(
              child: ReusedCard(
                Colour: kActiveCardColour,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kBigTextStyle,
                        ),
                        Text(
                          'Cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30,
                        ),
                      ),
                      // overlappingShapeStrokeColor: Color(0xff8d8e98)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 150,
                        max: 195,
                        inactiveColor: Color(0xff8d8e98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ReusedCard(
                    Colour: kActiveCardColour,
                    CardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kBigTextStyle,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                func: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                func: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: ReusedCard(
                    Colour: kActiveCardColour,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          Age.toString(),
                          style: kBigTextStyle,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              func: () {
                                setState(() {
                                  Age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              func: () {
                                setState(() {
                                  Age++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmi: calc.calculate_BMI(),
                        results: calc.getResults(),
                        interpretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                });
              },
              buttonTitle: 'Calculate',
            ),
          ],
        ),
      ),
    );
  }
}
