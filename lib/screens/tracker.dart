import 'package:covid_app_flutter/screens/country.dart';
import 'package:covid_app_flutter/screens/global.dart';
import 'package:flutter/material.dart';
import 'navigation_option.dart';

enum NavigationStatus {
  GLOBAL,
  COUNTRY,
}

class TrackerScreen extends StatefulWidget {
  const TrackerScreen({Key? key}) : super(key: key);

  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  NavigationStatus navigation = NavigationStatus.GLOBAL;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text("Covid19 Global Live Tracker"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 22,horizontal: 35),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
                child: navigation == NavigationStatus.GLOBAL
                    ? Global()
                    : Country(),
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationOption(
                    title: "Global",
                    selected: navigation == NavigationStatus.GLOBAL,
                    onSelected: () {
                      setState(() {
                        navigation = NavigationStatus.GLOBAL;
                      });
                    }),
                NavigationOption(
                    title: "Country",
                    selected: navigation == NavigationStatus.COUNTRY,
                    onSelected: () {
                      setState(() {
                        navigation = NavigationStatus.COUNTRY;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
