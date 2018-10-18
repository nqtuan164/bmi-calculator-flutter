import 'package:bmi_calculator_gender/utils/widgets.dart';
import 'package:flutter/material.dart';

class GenderLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: screenAwareSize(1.0, context),
        top: screenAwareSize(1.0, context)
      ),
      child: Container(
        height: screenAwareSize(1.0, context),
        width: 1.0,
        color: Color.fromRGBO(216, 217, 223, 0.6),
      ),
    );
  }

}