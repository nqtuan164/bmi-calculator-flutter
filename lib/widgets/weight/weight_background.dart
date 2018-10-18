import 'package:bmi_calculator_gender/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeightBackground extends StatelessWidget {
  final Widget child;

  const WeightBackground({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(10.0, context),
          decoration: BoxDecoration(
            color: Color.fromRGBO(244, 244, 244, 1.0),
            borderRadius: new BorderRadius.circular(screenAwareSize(5.0, context))
          ),
          child: child,
        ),
        SvgPicture.asset(
          'images/weight_arrow.svg',
          height: screenAwareSize(1.0, context),
          width: screenAwareSize(2.0, context),
        )
      ],
    );
  }


}