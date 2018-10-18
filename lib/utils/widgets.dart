import 'package:flutter/material.dart';

const double baseHeight = 65.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}

