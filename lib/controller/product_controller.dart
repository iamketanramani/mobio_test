import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import 'package:test/models/model_product.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var productList = <ModelProduct>[].obs;

  void getProductList() async {
    productList.clear();
    isLoading(true);

    await rootBundle.loadString('assets/product.json').then((jsonStr) {
      isLoading(false);
      List<ModelProduct> list =
          List<ModelProduct>.from(json.decode(jsonStr).map((x) {
        return ModelProduct.fromJson(x);
      }));
      // print('Ketan: ${list.length}');
      productList.addAll(list); // = list;
    }).onError((error, stackTrace) {
      isLoading(false);
    });

    update();
  }

  void updateProductAt(int index, ModelProduct item) {
    productList[index] = item;
    update();
  }
}
