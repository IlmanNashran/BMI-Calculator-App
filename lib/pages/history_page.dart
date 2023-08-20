import 'package:bmi_app/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HistoryPageState();
  }
}

class _HistoryPageState extends State<HistoryPage> {
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return CupertinoPageScaffold(
      child: _dataCard(),
    );
  }

  Widget _dataCard() {
    return Center(
      child: InfoCard(
        height: _deviceHeight! * 0.25,
        width: _deviceWidth! * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _statusText("normal"),
            _statusDate("05/3/2023"),
            _statusbmi("27.4543"),
          ],
        ),
      ),
    );
  }

  Widget _statusText(String _status) {
    return Text(
      _status,
      style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
    );
  }

  Widget _statusDate(String _date) {
    return Text(
      _date,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
    );
  }

  Widget _statusbmi(String _bmi) {
    return Text(
      _bmi,
      style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
    );
  }
}
