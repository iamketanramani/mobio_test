import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/product_controller.dart';
import 'package:test/models/model_product.dart';
import 'package:test/resources/app_strings.dart';
import 'package:test/widget/widget_order_summary.dart';

class ScreenOrderSummary extends StatelessWidget {
  const ScreenOrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.strOrderSummary),
      ),
      body: SafeArea(
        child: ListView.builder(
          key: const ObjectKey('key1'),
          shrinkWrap: true,
          itemCount: controller.productList.length,
          itemBuilder: ((context, index) {
            ModelProduct item = controller.productList[index];
            return WidgetOrderSummary(
              key: UniqueKey(),
              index: index,
              item: item,
            );
          }),
        ),
      ),
    );
  }
}
