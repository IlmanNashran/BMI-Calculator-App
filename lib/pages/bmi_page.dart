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
  int _age = 25, _weight = 73, _height = 70;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
        child: Container(
      height: _deviceHeight! * 0.85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _ageSelectContainer(),
              _weightSelectContainer(),
            ],
          ),
          _heightSelectContainer(),
        ],
      ),
    ));
  }

  Widget _ageSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.45,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Age Yr",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Text(
            _age.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _age--;
                    });
                  },
                  child: const Text('-'),
                  textStyle: TextStyle(fontSize: 25, color: Colors.red),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _age++;
                    });
                  },
                  child: const Text('+'),
                  textStyle: TextStyle(fontSize: 25, color: Colors.blue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _weightSelectContainer() {
    return InfoCard(
      width: _deviceWidth! * 0.45,
      height: _deviceHeight! * 0.20,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "weight KG",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Text(
            _weight.toString(),
            style: const TextStyle(
                color: Colors.black, fontSize: 45, fontWeight: FontWeight.w700),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(() {
                      _weight--;
                    });
                  },
                  child: const Text('-'),
                  textStyle: TextStyle(fontSize: 25, color: Colors.red),
                ),
              ),
              SizedBox(
                width: 50,
                child: CupertinoDialogAction(
                  onPressed: () {
                    setState(
                      () {
                        _weight++;
                      },
                    );
                  },
                  child: Text('+'),
                  textStyle: TextStyle(fontSize: 25, color: Colors.blue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _heightSelectContainer() {
    return InfoCard(
      height: _deviceHeight! * 0.15,
      width: _deviceWidth! * 0.90,
      child: Column(
        children: [
          const Text(
            "height in",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Text(
            _height.toString(),
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: _deviceWidth! * 0.80,
            child: CupertinoSlider(
                min: 0,
                max: 96,
                divisions: 96,
                value: _height.toDouble(),
                onChanged: (_value) {
                  setState(() {
                    _height = _value.toInt();
                  });
                }),
          )
        ],
      ),
    );
  }
}
