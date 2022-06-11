import 'package:flutter/material.dart';
import '../Constants.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.Data});
  final IconData icon;
  final String Data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          Data,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
