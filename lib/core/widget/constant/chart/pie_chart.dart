import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MyPieChart extends StatelessWidget {
  final String pieText;

  final Map<String, double> dataMap;

  final List<Color> colorList = [
    Colors.blue,
    Colors.white, // full circle in white
  ];

  MyPieChart(this.pieText, this.dataMap);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 0,
        chartRadius: MediaQuery.of(context).size.width / 5.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 10,
        centerText: pieText,
        centerTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        legendOptions: const LegendOptions(
          showLegends: false,
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: false,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ),
    );
  }
}
