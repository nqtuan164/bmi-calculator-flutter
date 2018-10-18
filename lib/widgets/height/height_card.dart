import 'package:bmi_calculator_gender/utils/widgets.dart';
import 'package:bmi_calculator_gender/widgets/cart_title.dart';
import 'package:bmi_calculator_gender/widgets/height/height_picker.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatefulWidget {
  final int height;
  final int minHeight;
  final int maxHeight;
  final double widgetHeight;
  final ValueChanged<int> onChanges;

  const HeightCard({
    Key key,
    this.height,
    this.minHeight = 145,
    this.maxHeight = 190,
    this.widgetHeight,
    this.onChanges
  }) : super(key: key);

  @override
  _HeightCardState createState() => _HeightCardState();
}

class _HeightCardState extends State<HeightCard> {
  int height;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    height = widget.height ?? 170;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(screenAwareSize(1.5, context)),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CardTitle('HEIGHT', subtitle: '(cm)'),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: screenAwareSize(0.8, context)),
                        child: LayoutBuilder(builder: (context, constraints) {
                          return HeightPicker(
                            widgetHeight: constraints.maxHeight,
                            height: height,
                            onChange: (val) => setState(() => height = val),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
      decoration: BoxDecoration(boxShadow: [
        new BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.05), blurRadius: 5.0)
      ]),
    );
  }
}
