import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';
import 'package:bmi_calculator/Components/ReusableCard.dart';
import '../Components/bottom_Button.dart';
import 'package:bmi_calculator/Calculator_brain.dart';

void main() => runApp(ResultPage());

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmi,
      @required this.interpretation,
      @required this.results});
  final String bmi;
  final String interpretation;
  final String results;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff0a0e21),
          primaryColor: Color(0xff0a0e21),
          appBarTheme: AppBarTheme(
            color: Color(0xff0a0e21),
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'Your Results',
                  style: kTextRESULtStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusedCard(
                Colour: kActiveCardColour,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      results,
                      style: kBigGreenStyle,
                    ),
                    Text(
                      bmi,
                      style: kTextBMIStyle,
                    ),
                    Text(
                      interpretation,
                      style: kTextDISCStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Re-Calculate',
            ),
          ],
        ),
      ),
    );
  }
}
