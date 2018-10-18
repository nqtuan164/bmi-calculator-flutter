import 'package:bmi_calculator_gender/widgets/gender/gender_arrow.dart';
import 'package:bmi_calculator_gender/widgets/gender/gender_icons.dart';
import 'package:bmi_calculator_gender/widgets/gender/gender_styles.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_gender/models/gender.dart';
import 'package:bmi_calculator_gender/utils/widgets.dart';
import 'package:bmi_calculator_gender/widgets/cart_title.dart';
import 'package:bmi_calculator_gender/widgets/gender/gender_circle.dart';


/// Gender Card
class GenderCard extends StatefulWidget {
  final Gender initialGender;

  const GenderCard({Key key, this.initialGender}) : super(key: key);

  @override
  _GenderCardState createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> with SingleTickerProviderStateMixin {
  Gender selectedGender;
  AnimationController _arrowAnimationController;

  @override
  void initState() {
    selectedGender = widget.initialGender ?? Gender.other;
    _arrowAnimationController = new AnimationController(
      vsync: this,
      lowerBound: -defaultGenderAngle,
      upperBound:  defaultGenderAngle,
      value: genderAngles[selectedGender]
    );
    super.initState();
  }

  @override
  void dispose() {
    _arrowAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: screenAwareSize(1.5, context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CardTitle('GENDER'),
                Padding(
                  padding: EdgeInsets.only(top: screenAwareSize(2.0, context)),
                  child: _drawMainStack(),
                )
              ],
            ),
          ),
        ),
        elevation: 0.0,
      ),
      decoration: BoxDecoration(boxShadow: [
        new BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 5.0
        )
      ]),
    );
  }

  Widget _drawMainStack() {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _drawCircleIndicator(),
          GenderIconTranslated(
            gender: Gender.female,
          ),
          GenderIconTranslated(
            gender: Gender.other,
          ),
          GenderIconTranslated(
            gender: Gender.male,
          ),
          _drawGestureDetector()
        ],
      ),
    );
  }

  Widget _drawCircleIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        GenderCirle(),
        GenderArrow(listenable: _arrowAnimationController)
      ],
    );
  }

  _drawGestureDetector() {
    return Positioned.fill(child: TapHandler(onGenderTapped: (gender) {
      print(gender);
      _setSelectedGender(gender);
    }));
  }

  _setSelectedGender(Gender gender) {
    setState(() => selectedGender = gender);
    _arrowAnimationController.animateTo(
      genderAngles[gender],
      duration: Duration(milliseconds: 150)
    );
  }
}

///
class TapHandler extends StatelessWidget {
  final Function(Gender) onGenderTapped;

  const TapHandler({Key key, this.onGenderTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.female))),
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.other))),
        Expanded(
            child: GestureDetector(onTap: () => onGenderTapped(Gender.male))),
      ],
    );
  }

}