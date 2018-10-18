import 'package:bmi_calculator_gender/utils/widgets.dart';
import 'package:bmi_calculator_gender/widgets/cart_title.dart';
import 'package:bmi_calculator_gender/widgets/weight/weight_background.dart';
import 'package:bmi_calculator_gender/widgets/weight/weight_slider.dart';
import 'package:flutter/material.dart';

class WeightCard extends StatefulWidget {
  @override
  _WeightCardState createState() => _WeightCardState();
}

class _WeightCardState extends State<WeightCard> {
  int weight;

  @override
  void initState() {
    // TODO: implement initState
    weight = 70;
    super.initState();
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
                CardTitle('WEIGHT', subtitle: "(kg)"),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _drawSlider(),
                    ),
                  ),
                ),
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

  _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, contraints) => WeightSlider(
          minValue: 30,
          maxValue: 110,
          width: contraints.maxWidth,
          value: weight,
          onChanged: (val) => setState(() => weight = val),
        )
      ),
    );
  }
}