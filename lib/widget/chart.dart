import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,height: 300,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData,String>>[
          SplineSeries<SalesData,String>(
            color: const Color.fromARGB(255, 47, 125, 121),
            width: 3,
            dataSource: <SalesData>[
              SalesData(100, 'mon'),
              SalesData(20, 'Tue'),
              SalesData(40, 'Wen'),
              SalesData(15, 'Sat'),
              SalesData(5, 'Sun'),
            ],
            xValueMapper: (SalesData sales,_)=>sales.year,
            yValueMapper: (SalesData sales,_)=>sales.sales,
          )
        ],
      ),
    );
  }


}
class SalesData{
  SalesData(this.sales,this.year);
 final String? year;
 final int? sales;

}