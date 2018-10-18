import 'package:flutter/material.dart';
import 'package:bmi_calculator_gender/widgets/gender/gender_styles.dart';

class GenderCirle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSize(context),
      height: circleSize(context),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(244, 244, 244, 1.0)
      ),
    );
  }
}