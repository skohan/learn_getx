import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/components.dart';
import 'package:learn_getx/model.dart';

import 'controller.dart';

class DetailsPage extends StatelessWidget {
  final int regionDataIndex;

  DetailsPage(this.regionDataIndex);

  @override
  Widget build(BuildContext context) {
    DataController ctr = Get.find();
    RegionData rd = ctr.getRegionDataAt(this.regionDataIndex);
    // String region;
    //   int activeCases;
    //   int newInfected;
    //   int recovered;
    //   int newRecovered;
    //   int deceased;
    //   int newDeceased;
    //   int totalInfected;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DetailData("Region", rd.region),
              DetailData("Active", "${rd.activeCases}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailData("Infected", "${rd.totalInfected}"),
                  DetailData("New Infected", "${rd.newInfected}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailData("Recovered", "${rd.recovered}"),
                  DetailData("New Recovered", "${rd.newRecovered}"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailData("Deseased", "${rd.deceased}"),
                  DetailData("New Deseased", "${rd.newDeceased}"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
