// ignore_for_file: depend_on_referenced_packages, non_constant_identifier_names

import 'package:coinfo/models/coinmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CoinControls extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Coin> CoinsList = <Coin>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetcCoins();
  }

  fetcCoins() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('YOUR API URL'));

      List<Coin> coins = coinFromJson(response.body);
      CoinsList.value = coins;
    } finally {
      isLoading(false);
    }
  }
}
