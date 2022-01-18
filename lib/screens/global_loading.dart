import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Globalloading extends StatelessWidget {
  const Globalloading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Column(
        children: [
          loadingCard(),
          loadingCard(),
          loadingCard(),
          loadingCard(),

        ],
      );
  }

  Widget loadingCard(){
    return Card(
      elevation: 1,
      child: Container(
        height: 95,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
        child: Shimmer.fromColors(child: Column(
          children: [
            Container(
              width: 100,
              height: 20,
              color: Colors.white,
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              width:double.infinity,
              height: 15,
              color: Colors.white,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.white,
            )
          ],

        ), baseColor: Colors.grey.shade300, highlightColor: Colors.grey.shade100),
      ),
    );
  }
}
