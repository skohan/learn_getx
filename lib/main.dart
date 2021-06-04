import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
        // appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text("Clicks ${c.count}"),
            ),
            ElevatedButton(
                child: Text("Go to Other"), onPressed: () => Get.to(Other())),
          ],
        )),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add), onPressed: c.increment));
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
