import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/product_controller.dart';
import 'package:test/models/model_product.dart';
import 'package:test/resources/app_strings.dart';
import 'package:test/screens/screen_order_summary.dart';
import 'package:test/view/app_helper.dart';
import 'package:test/view/toast.dart';
import 'package:test/widget/widget_product.dart';

class ScreenProductList extends StatefulWidget {
  const ScreenProductList({Key? key}) : super(key: key);

  @override
  State<ScreenProductList> createState() => _ScreenProductListState();
}

class _ScreenProductListState extends State<ScreenProductList> {
  validateProduct(context) {
    var controller = Get.find<ProductController>();
    bool isValid = true;

    for (int i = 0; i < controller.productList.length; i++) {
      if (controller.productList[i].selectedColor!.isEmpty) {
        Toast.show(context,
            '${AppStrings.strSelectColor} for ${controller.productList[i].productName!}');
        isValid = false;
        break;
      }
      if (controller.productList[i].selectedBrand!.isEmpty) {
        Toast.show(context,
            '${AppStrings.strSelectBrand} for ${controller.productList[i].productName!}');
        isValid = false;
        break;
      }
      if (controller.productList[i].quantity!.isEmpty) {
        Toast.show(context,
            '${AppStrings.strEnterQuantity} for ${controller.productList[i].productName!}');
        isValid = false;
        break;
      }
      if (double.parse(controller.productList[i].quantity!) <= 0) {
        Toast.show(context,
            '${AppStrings.strEnterValidQuantity} for ${controller.productList[i].productName!}');
        isValid = false;
        break;
      }
    }

    if (isValid) {
      AppHelper.changeScreen(context, const ScreenOrderSummary());
    }
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    controller.getProductList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(AppStrings.strProductList),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: controller.isLoading.value
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : ListView.builder(
                        key: const ObjectKey('key'),
                        shrinkWrap: true,
                        itemCount: controller.productList.length,
                        itemBuilder: ((context, index) {
                          ModelProduct item = controller.productList[index];
                          return WidgetProduct(
                            key: UniqueKey(),
                            index: index,
                            item: item,
                          );
                        }),
                      ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  validateProduct(context);
                },
                child: Text(
                  AppStrings.strSubmitProduct.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
