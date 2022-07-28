import 'package:bitcoin_price_ui/model/chart_data.dart';
import 'package:bitcoin_price_ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<ChartData> data;

  @override
  void initState() {
    // TODO: implement initState
    data = [
      ChartData(day: 17, price: 21500),
      ChartData(day: 18, price: 22684),
      ChartData(day: 19, price: 21643),
      ChartData(day: 20, price: 22997),
      ChartData(day: 21, price: 22883),
      ChartData(day: 22, price: 22635),
      ChartData(day: 23, price: 21800),
      ChartData(day: 24, price: 23500),
      ChartData(day: 25, price: 21354),
      ChartData(day: 26, price: 22354),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.bgColor,
        title: const Text(
          'Bitcoin Price',
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'BITCOIN',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 24),
            ),
            const SizedBox(height: 10),
            CircleAvatar(radius: 36, child: Image.asset('image/btc.png')),
            const SizedBox(height: 10),
            const Text(
              '(BTC)',
              style: TextStyle(
                color: Colors.white24,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SfCartesianChart(
                margin: const EdgeInsets.all(8),
                borderWidth: 0,
                borderColor: Colors.transparent,
                plotAreaBorderWidth: 0,
                primaryXAxis: NumericAxis(
                  minimum: 17,
                  maximum: 26,
                  isVisible: false,
                  interval: 1,
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                ),
                primaryYAxis: NumericAxis(
                  minimum: 19000,
                  maximum: 24000,
                  isVisible: false,
                  interval: 1,
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                ),
                series: <ChartSeries<ChartData, int>>[
                  SplineAreaSeries(
                      dataSource: data,
                      xValueMapper: (ChartData data, _) => data.day,
                      yValueMapper: (ChartData data, _) => data.price,
                      splineType: SplineType.natural,
                      gradient: LinearGradient(
                          colors: [
                            AppStyle.splintColor,
                            AppStyle.bgColor.withAlpha(150)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  SplineSeries(
                    color: AppStyle.accentColor,
                    width: 4,
                    markerSettings: MarkerSettings(
                        color: AppStyle.splintColor,
                        borderColor: AppStyle.accentColor,
                        borderWidth: 3,
                        shape: DataMarkerType.circle,
                        isVisible: true),
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.price,
                    dataSource: data,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Sell',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  icon: const Icon(Icons.upload, color: Colors.white),
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      side: BorderSide(color: AppStyle.accentColor)),
                ),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.download),
                    label: Text('Buy'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: AppStyle.splintColor
                ),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
