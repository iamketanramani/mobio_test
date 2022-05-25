import 'package:flutter/material.dart';
import 'package:test/models/model_product.dart';
import 'package:test/resources/app_colors.dart';
import 'package:test/resources/app_strings.dart';
import 'package:test/widget/widget_network_image.dart';

class WidgetOrderSummary extends StatefulWidget {
  final int? index;
  final ModelProduct? item;

  const WidgetOrderSummary({
    Key? key,
    this.index,
    this.item,
  }) : super(key: key);

  @override
  State<WidgetOrderSummary> createState() => _WidgetOrderSummaryState();
}

class _WidgetOrderSummaryState extends State<WidgetOrderSummary> {
  @override
  Widget build(BuildContext context) {
    var total = double.parse(widget.item!.quantity!) *
        double.parse(
            widget.item!.price!.replaceAll('\$', '').replaceAll(',', ''));

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          SizedBox(
            width: 70,
            height: 70,
            child: ClipOval(
              child: WidgetNetworkImage(
                image: widget.item!.picture!,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    widget.item!.productName!,
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product Quantity
                      Text(
                        '${AppStrings.strQty} : ${widget.item!.quantity!}',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Product Price
                      Text(
                        '${AppStrings.strPrice} : ${widget.item!.price!}',
                        style: const TextStyle(
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  // Product Color
                  Text(
                    '${AppStrings.strSelectedColor} : ${widget.item!.selectedColor!}',
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Product Brand
                  Text(
                    '${AppStrings.strSelectedBrand} : ${widget.item!.selectedBrand!}',
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Total Price
                  Text(
                    '${AppStrings.strTotalPrice} : \$$total',
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
