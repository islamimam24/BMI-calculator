import 'package:flutter/material.dart';
import '../Screens/input_data.dart';

class ReusedCard extends StatelessWidget {
  ReusedCard({this.Colour, this.CardChild, this.OnPress});
  final Color Colour;
  final Widget CardChild;
  final Function OnPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnPress,
      child: Container(
        child: CardChild,
        width: 170,
        height: 200,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colour,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
