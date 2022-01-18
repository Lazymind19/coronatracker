import 'package:covid_app_flutter/models/global_summary.dart';
import 'package:covid_app_flutter/screens/global_statistics.dart';
import 'package:covid_app_flutter/services/CovidServices.dart';
import 'package:flutter/material.dart';


CovidService covidService = CovidService();

class Global extends StatefulWidget {
  const Global({Key? key}) : super(key: key);

  @override
  _GlobalState createState() => _GlobalState();
}

class _GlobalState extends State<Global> {
  late Future<GlobalSummaryModel> summary;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    summary = covidService.getGlobalSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Padding(
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Global Corona Virus Case",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),),
              GestureDetector(
                onTap: (){
                  setState(() {
                    summary = covidService.getGlobalSummary();
                  });
                },
                  child: Icon(Icons.refresh,color: Colors.white,))
            ],
          ),
        ),
        FutureBuilder(
          future: summary,
            builder: (context,snapShot){
            var data = snapShot.data;
            if(snapShot.hasError)
              return Center(
                child: Text("Something error occurs"),
              );
            switch(snapShot.connectionState){
              case ConnectionState.waiting:
                return Center(
                  child: Text("Loading.."),
                );
              default:
                return !snapShot.hasData ? Center(
                  child: Text("Empty"),
                )
                    :GlobalStatistics(
                  summary: data as GlobalSummaryModel);
            }

            })
      ],
    );
  }
}
