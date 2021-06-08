import 'dart:convert';

import 'package:get/state_manager.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
import 'config.dart';

class DataController extends GetxController {
  Rx<bool> isLoading = true.obs;
  Rx<DataModel> data = DataModel().obs;
  Rx<String> test = "hello world".obs;
  final client = http.Client();

  int getCountOfRegions() {
    return data.value.regionData.length;
  }

  RegionData getRegionDataAt(int index) {
    return data.value.regionData.elementAt(index);
  }

  Future<void> getData() async {
    isLoading(true);
    final response = await http.get(Uri.parse(Config.dataUrl));

    if (response.statusCode == 200) {
      // print(response.body);
      data.value = DataModel.fromJson(jsonDecode(response.body));
    }

    isLoading(false);
  }
}
