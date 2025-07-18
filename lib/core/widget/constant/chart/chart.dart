import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../colors.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      textStyle: const TextStyle(color: Colors.white),
      tooltipPosition: TooltipPosition.pointer,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SfCartesianChart(
        backgroundColor: mainColor,
        // optional: makes the background dark
        legend: Legend(
          isVisible: true,
          textStyle: const TextStyle(color: Colors.white),
        ),
        primaryXAxis: NumericAxis(
          labelStyle: const TextStyle(color: Colors.white),
        ),
        primaryYAxis: NumericAxis(
          labelStyle: const TextStyle(color: Colors.white),
        ),
        tooltipBehavior: _tooltipBehavior,
        series: _getDefaultData(),
      ),
    );
  }

  List<LineSeries<SalesData, num>> _getDefaultData() {
    final List<SalesData> chartData = <SalesData>[
      SalesData(DateTime(2005, 1, 1), 'India', 1.5, 21, 28, 680, 760),
      SalesData(DateTime(2006, 1, 1), 'China', 2.2, 24, 44, 550, 880),
      SalesData(DateTime(2007, 1, 1), 'USA', 3.32, 36, 48, 440, 788),
      SalesData(DateTime(2008, 1, 1), 'Japan', 4.56, 38, 50, 350, 560),
      SalesData(DateTime(2009, 1, 1), 'Russia', 5.87, 54, 66, 444, 566),
      SalesData(DateTime(2010, 1, 1), 'France', 6.8, 57, 78, 780, 650),
      SalesData(DateTime(2011, 1, 1), 'Germany', 8.5, 70, 84, 450, 800),
    ];

    return <LineSeries<SalesData, num>>[
      LineSeries<SalesData, num>(
        enableTooltip: true,
        dataSource: chartData,
        xValueMapper: (SalesData sales, _) => sales.y,
        yValueMapper: (SalesData sales, _) => sales.y4,
        width: 2,
        markerSettings: const MarkerSettings(
          isVisible: true,
          height: 3,
          width: 4,
          shape: DataMarkerType.circle,
          borderWidth: 3,
          borderColor: Colors.red,
        ),
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.auto,
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      LineSeries<SalesData, num>(
        enableTooltip: true,
        dataSource: chartData,
        width: 2,
        xValueMapper: (SalesData sales, _) => sales.y,
        yValueMapper: (SalesData sales, _) => sales.y3,
        markerSettings: const MarkerSettings(
          isVisible: true,
          height: 3,
          width: 4,
          shape: DataMarkerType.circle,
          borderWidth: 3,
          borderColor: Colors.white,
        ),
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.auto,
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
    ];
  }
}

/// Model class
class SalesData {
  final DateTime x;
  final String country;
  final double y;
  final double y2;
  final double y3;
  final double y4;
  final double y5;

  SalesData(this.x, this.country, this.y, this.y2, this.y3, this.y4, this.y5);
}
