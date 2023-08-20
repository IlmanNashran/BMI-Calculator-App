import 'package:bmi_app/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BmiPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BmiPageState();
  }
}

//------------------------------------------------------

class _BmiPageState extends State<BmiPage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
        child: Container(
      child: Center(
        child: InfoCard(
          width: _deviceWidth! * 0.45,
          height: _deviceHeight! * 0.20,
          child: Container(),
        ),
      ),
    ));
  }
}
