import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:state_management_piechart/pages/main_bloc/chart_bloc.dart';
import 'package:state_management_piechart/ui/AppSlider.dart';

class MainBloc extends StatelessWidget {

  final List<Color> colorList = [
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.grey,
  ];

  @override
  Widget build(BuildContext context) {
    final ChartBloc bloc = Provider.of<ChartBloc>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: _buildContent(bloc),
      ),
    );
  }

  Widget _buildContent(ChartBloc bloc){
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          PieChart(
            dataMap: bloc.statistics,
            showLegends: true,
            chartValueFontSize: 24,
            legendFontColor: Colors.black,
            chartLegendSpacing: 25,
            colorList: colorList,
          ),
          AppSlider(
            color: Colors.blue,
            onChanged: (value) => bloc.updateModel(ChartBloc.flutter, value),
          ),
          SizedBox(
            height: 8.0,
          ),
          AppSlider(
            color: Colors.orange,
            onChanged: (value) => bloc.updateModel(ChartBloc.reactNative, value),
          ),
          SizedBox(
            height: 8.0,
          ),
          AppSlider(
            color: Colors.green,
            onChanged: (value) => bloc.updateModel(ChartBloc.android, value),
          ),
          SizedBox(
            height: 8.0,
          ),
          AppSlider(
            color: Colors.grey,
            onChanged: (value) => bloc.updateModel(ChartBloc.ios, value),
          ),
        ],
      ),
    );
  }

  static Widget create() {
    return ChangeNotifierProvider<ChartBloc>.value(
      value: ChartBloc(),
      child: MainBloc(),
    );
  }
}
