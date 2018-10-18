
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:bmi_calculator_gender/models/gender.dart';
import 'package:bmi_calculator_gender/utils/widgets.dart';

const double defaultGenderAngle = math.pi / 4;
const Map<Gender, double> genderAngles = {
  Gender.female: -defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: defaultGenderAngle,
};

double circleSize(BuildContext context) => screenAwareSize(6.5, context);