import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WeightSlider extends StatelessWidget {
  final int minValue;
  final int maxValue;
  final double width;

  final int value;
  final ValueChanged<int> onChanged;

  final ScrollController scrollController;

  WeightSlider({
    Key key,
    @required this.minValue,
    @required this.maxValue,
    @required this.value,
    @required this.onChanged,
    @required this.width,
  })  : scrollController = new ScrollController(
    initialScrollOffset: (value - minValue) * width / 3,
  ), super(key: key);

  // get extent of item, 3 items will be visibled on container
  double get itemExtent => width / 3;

  int _indexToValue(int index) => minValue + (index - 1);

  @override
  Widget build(BuildContext context) {
    int itemCount = (maxValue - minValue) + 3;
    return new NotificationListener(
      onNotification: _onNotification,
      child: new ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemExtent: itemExtent,
        itemCount: itemCount,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final int itemValue = _indexToValue(index);
          bool isExtra = index == 0 || index == itemCount - 1;

          return isExtra
              ? new Container()
              : GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => _animateTo(itemValue, durationMillis: 50),
                child: FittedBox(
                  child: Text(
                    itemValue.toString(),
                    style: _getTextStyle(itemValue),
                  ),
                  fit: BoxFit.scaleDown,
                ),
              );
        },
      ),
    );
  }

  bool _onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      int middleValue = _offsetToMiddleValue(notification.metrics.pixels);

      if(_userStoppedScrolling(notification)) {
        _animateTo(middleValue);
      }

      if (middleValue != value) {
        onChanged(middleValue);
      }
    }

    return true;
  }

  int _offsetToMiddleIndex(double offset) {
    return (offset + width / 2) ~/ itemExtent;
  }

  int _offsetToMiddleValue(double offset) {
    int indexOfMiddleElement = _offsetToMiddleIndex(offset);
    int middleValue = _indexToValue(indexOfMiddleElement);

    return middleValue;
  }

  bool _userStoppedScrolling(Notification notification) {
    return notification is UserScrollNotification &&
      notification.direction == ScrollDirection.idle &&
      scrollController.position.activity is! HoldScrollActivity;
  }

  _animateTo(int itemValue, {int durationMillis = 200}) {
    double targetExtent = (itemValue - minValue) * itemExtent;
    scrollController.animateTo(
      targetExtent,
      duration: new Duration(milliseconds: durationMillis),
      curve: Curves.decelerate,
    );
  }

  TextStyle _getDefaultTextStyle() {
    return new TextStyle(
      color: Color.fromRGBO(196, 197, 203, 1.0),
      fontSize: 14.0,
    );
  }

  TextStyle _getHighlightTextStyle() {
    return new TextStyle(
      color: Color.fromRGBO(77, 123, 243, 1.0),
      fontSize: 28.0,
    );
  }

  TextStyle _getTextStyle(int itemValue) {
    return itemValue == value
        ? _getHighlightTextStyle()
        : _getDefaultTextStyle();
  }
}
