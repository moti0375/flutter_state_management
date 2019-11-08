import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:state_management_piechart/ui/AppSlider.dart';

class MainSetState extends StatefulWidget {
  @override
  _MainSetStateState createState() => _MainSetStateState();
}

class _MainSetStateState extends State<MainSetState> {
  static final String flutter = "Flutter";
  static final String reactNative = "ReactNative";
  static final String android = "Android";
  static final String ios = "IOS";

  Map<String, double> statistics = new Map();  //Page state model...
  List<Color> colorList = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.grey,
  ];
  @override
  void initState() {
    super.initState();
    statistics[flutter] = 0.0;
    statistics[reactNative] = 0.0;
    statistics[android] = 0.0;
    statistics[ios] = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildContent(),
    );
  }

  void _handleFlutterOnChange(double d) {
    setState(() {
      statistics[flutter] = d * 100;
    });
  }
  void _handleReactOnChange(double d) {
    setState(() {
      statistics[reactNative] = d * 100;
    });
  }

  void _handleAndroidOnChange(double d) {
    setState(() {
      statistics[android] = d * 100;
    });
  }

  void _handleIosChange(double d) {
    setState(() {
      statistics[ios] = d * 100;
    });
  }

  Widget _buildContent(){
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PieChart(
            dataMap: statistics,
            showLegends: true,
            chartValueFontSize: 24,
            legendFontColor: Colors.black,
            chartLegendSpacing: 25,
            colorList: colorList,
          ),
          AppSlider(
            color: Colors.blue,
            onChanged: _handleFlutterOnChange,
          ),
          SizedBox(
            height: 8.0,
          ),
          AppSlider(
            color: Colors.orange,
            onChanged: _handleReactOnChange,
          ),
          SizedBox(
            height: 8.0,
          ),
          AppSlider(
            color: Colors.green,
            onChanged: _handleAndroidOnChange,
          ),
          SizedBox(
            height: 8.0,
          ),
          AppSlider(
            color: Colors.grey,
            onChanged: _handleIosChange,
          ),
        ],
      ),
    );
  }
}
