import 'package:coinfo/controllers/coincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CoinControls controller = Get.put(CoinControls());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70,
        body: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 20),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Coin Market",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, top: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.orange.shade400,
                                              borderRadius:
                                                  BorderRadius.circular(71),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.orange.shade400,
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Image.network(controller
                                                .CoinsList[index].image),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 20),
                                            Text(
                                                controller
                                                    .CoinsList[index].name,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                            Text(
                                                "${controller.CoinsList[index].priceChangePercentage24H.toStringAsFixed(1)} %",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(height: 20),
                                        Text(
                                            "\$ ${controller.CoinsList[index].currentPrice.round()}",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                        Text(
                                            controller.CoinsList[index].symbol
                                                .toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                ),
              ],
            ),
          ),
        ));
  }
}
