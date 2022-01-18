import 'package:covid_app_flutter/models/global_summary.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class GlobalStatistics extends StatelessWidget {
  final GlobalSummaryModel summary;
  GlobalStatistics({required this.summary});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildCard("Confirmed", summary.totalConfirmed, summary.newConfirmed, Colors.red),
          buildCard("Active", summary.totalConfirmed - summary.totalRecovered- summary.totalDeaths, summary.newConfirmed- summary.newRecovered- summary.newDeaths, Colors.green),
          buildCard("Recovered",summary.totalRecovered,summary.totalRecovered,Colors.blue.shade900),
          buildCard("Deaths",summary.totalDeaths,summary.totalDeaths,Colors.brown),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4,vertical: 6),
            child: Text(""
                "Statistics updated " + timeago.format(summary.dateTime),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12
            ),),
          )

        ],
      ),
    );
  }

  Widget buildCard(String title, int totalCount, int todayCount, Color color) {
    return Card(
      elevation: 1,
      child: Container(
      height :90,
        padding:EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(title,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),),
            Expanded(child: Container()),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total",
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(
                      totalCount.toString(),
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),

                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Today",
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold
                    ),),
                    Text(todayCount.toString(),
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),)
                  ],
                )

              ],
            )
          ],
        ),
    ),

    );
  }
}
