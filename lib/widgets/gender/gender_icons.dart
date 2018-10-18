import 'package:bmi_calculator_gender/models/gender.dart';
import 'package:bmi_calculator_gender/utils/widgets.dart';
import 'package:bmi_calculator_gender/widgets/gender/gender_line.dart';
import 'package:bmi_calculator_gender/widgets/gender/gender_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';


class GenderIconTranslated extends StatelessWidget {

  static final Map<Gender, String> _genderImages = {
    Gender.female: 'images/gender_female.svg',
    Gender.other: 'images/gender_other.svg',
    Gender.male: 'images/gender_male.svg',
  };

  final Gender gender;

  const GenderIconTranslated({Key key, this.gender}) : super(key: key);

  bool get _isOtherGender => gender == Gender.other;

  String get _assetName => _genderImages[gender];

  double _iconSize(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 2.5 : 2.3, context);
  }

  double _genderLeftPadding(BuildContext context) {
    return screenAwareSize(_isOtherGender ? 0.5 : 0.0, context);
  }

  @override
  Widget build(BuildContext context) {
//    print(this.gender);
//    print(this._isOtherGender);
//    print(this._assetName);
//    print(this._iconSize(context));

    Widget icon = Padding(
      padding: EdgeInsets.only(left: _genderLeftPadding(context)),
      child: SvgPicture.asset(
        _assetName,
        height: _iconSize(context),
        width: _iconSize(context),
      ),
    );

    Widget rotatedIcon = Transform.rotate(
      angle: -genderAngles[gender],
      child: icon,
    );

    Widget iconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          rotatedIcon,
          GenderLine(),
        ],
      ),
    );

    Widget rotatedIconWithALine = Transform.rotate(
      alignment: Alignment.bottomCenter,
      angle: genderAngles[gender],
      child: iconWithALine,
    );

    Widget centeredIconWithALine = Padding(
      padding: EdgeInsets.only(bottom: circleSize(context) / 2),
      child: rotatedIconWithALine,
    );

    return centeredIconWithALine;
  }

}