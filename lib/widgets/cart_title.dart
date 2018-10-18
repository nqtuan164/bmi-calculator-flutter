import 'package:flutter/material.dart';

const TextStyle _titleStyle = TextStyle(
    fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black54);
const TextStyle _subtitleStyle = TextStyle(
  fontSize: 10.0,
  fontWeight: FontWeight.w500,
  color: Colors.black45,
);

class CardTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardTitle(this.title, {Key key, this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
      text: this.title,
      style: _titleStyle,
      children: <TextSpan>[
        TextSpan(
          text: subtitle ?? "",
          style: _subtitleStyle,
        ),
      ],
    ));
  }
}
