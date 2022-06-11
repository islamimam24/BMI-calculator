import 'package:flutter/material.dart';
import '../Constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.onTap, this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainer,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        padding: EdgeInsets.only(bottom: 20),
        height: kBottomContainerheight,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
