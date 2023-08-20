import 'package:bmi_app/widgets/info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    SharedPreferences.getInstance();

    return CupertinoPageScaffold(
      child: _dataCard(),
    );
  }

  Widget _dataCard() {
    return Center(
      child: FutureBuilder(
        future: SharedPreferences.getInstance(), //get share preference
        builder: (BuildContext _context, AsyncSnapshot _snapshot) {
          if (_snapshot.hasData) {
            final _prefs =
                _snapshot.data as SharedPreferences; // get data from preference
            final _date = _prefs.getString('bmi_date');
            final _data = _prefs.getStringList("bmi_data");

            return InfoCard(
              height: _deviceHeight! * 0.25,
              width: _deviceWidth! * 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _statusText(
                    _data![1],
                  ),
                  _statusDate(_date!),
                  _statusbmi(_data[0]),
                ],
              ),
            );
          } else {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.blue,
              ),
            );
          }
          ;
        },
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
    DateTime _parsDate = DateTime.parse(_date);
    return Text(
      "${_parsDate.day}/${_parsDate.month}/${_parsDate.year}",
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
    );
  }

  Widget _statusbmi(String _bmi) {
    return Text(
      double.parse(_bmi).toStringAsFixed(2),
      style: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
    );
  }
}
