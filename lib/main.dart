import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller.dart';
import 'package:learn_getx/details.dart';
import 'package:learn_getx/model.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  final DataController data = Get.put(DataController());
  @override
  Widget build(context) {
    data.getData();
    return Scaffold(
        appBar: AppBar(
          title: Text("Corona stat"),
        ),
        body: Center(
          child: Obx(() {
            if (data.isLoading.value) {
              return CircularProgressIndicator();
            }
            return Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Active: ${data.data.value.activeCases}"),
                    Text("Deaths: ${data.data.value.deaths}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("New Active: ${data.data.value.activeCasesNew}"),
                    Text("New Deaths: ${data.data.value.deathsNew}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Recovered: ${data.data.value.recovered}"),
                    Text("New Recovered: ${data.data.value.recoveredNew}"),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.getCountOfRegions(),
                      itemBuilder: (_, index) {
                        RegionData r = data.data.value.regionData[index];
                        return ListTile(
                          title: Text("${r.region}"),
                          subtitle: Text("Active cases: ${r.activeCases}"),
                          leading: Icon(Icons.account_tree),
                          onTap: () async => await Get.to(DetailsPage(index)),
                        );
                      }),
                ),
              ],
            );
          }),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.replay_outlined),
            onPressed: () async {
              Get.snackbar("Loding", "Data from server is loading");
              await data.getData();
              Get.snackbar("Done", "Data loaded");
            }));
  }
}

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

class Other extends StatelessWidget {
  final Controller c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text("${c.count}")));
  }
}
