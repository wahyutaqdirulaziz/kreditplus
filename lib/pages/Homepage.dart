import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kreditplus/controllers/produkController.dart';

class HomePage extends StatelessWidget {
  final ProdukController produkController = Get.put(ProdukController());

  @override
  Widget build(BuildContext context) {
    produkController.fetchUpComing();
    return Scaffold(body: Obx(() {
      if (produkController.isLoading.value)
        return Center(child: CircularProgressIndicator());
      else
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: produkController.produk.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                height: 160,
                width: double.maxFinite,
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 140,
                            width: 136,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Image.network(
                                produkController.produk[index].image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              '\$ ${produkController.produk[index].price.toString()}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 140,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              produkController.produk[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              produkController.produk[index].description,
                              style: TextStyle(fontSize: 10),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                    ),
                                    Text(
                                      produkController.produk[index].rating.rate
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
    }));
  }
}
