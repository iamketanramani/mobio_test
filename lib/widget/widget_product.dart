import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/controller/product_controller.dart';
import 'package:test/models/model_product.dart';
import 'package:test/resources/app_colors.dart';
import 'package:test/resources/app_strings.dart';
import 'package:test/utils/validation_helper.dart';
import 'package:test/widget/widget_network_image.dart';

class WidgetProduct extends StatefulWidget {
  final int? index;
  final ModelProduct? item;

  const WidgetProduct({
    Key? key,
    this.index,
    this.item,
  }) : super(key: key);

  @override
  State<WidgetProduct> createState() => _WidgetProductState();
}

class _WidgetProductState extends State<WidgetProduct> {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();

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

                  // Product Price
                  Text(
                    '${AppStrings.strPrice} : ${widget.item!.price!}',
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Product Color
                  Row(
                    children: [
                      ...widget.item!.colors!.map((data) {
                        return InkWell(
                          onTap: () {
                            widget.item!.selectedColor = data;
                            controller.updateProductAt(
                              widget.index!,
                              widget.item!,
                            );
                          },
                          child: UnconstrainedBox(
                            child: Row(
                              children: [
                                Radio(
                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -3,
                                  ),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: (widget.item!.selectedColor!
                                              .isNotEmpty &&
                                          widget.item!.selectedColor!.trim() ==
                                              data.trim())
                                      ? true
                                      : false,
                                  groupValue: true,
                                  onChanged: (value) {
                                    widget.item!.selectedColor = data;
                                    controller.updateProductAt(
                                      widget.index!,
                                      widget.item!,
                                    );
                                  },
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  data,
                                  style: const TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          ),
                        );
                      }).toList()
                    ],
                  ),

                  // Product Brand
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blackColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: const Text(
                          AppStrings.strSelect,
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 14,
                          ),
                        ),
                        value: widget.item!.selectedBrand!.isEmpty
                            ? null
                            : widget.item!.selectedBrand!,
                        onChanged: (newVal) {
                          var brandId = newVal! as String;
                          widget.item!.selectedBrand = brandId;
                          controller.updateProductAt(
                            widget.index!,
                            widget.item!,
                          );
                        },
                        items: widget.item!.brands!.map((Brands item) {
                          return DropdownMenuItem(
                            value: item.name,
                            child: Text(
                              item.name!,
                              textAlign: TextAlign.start,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),

                  // Product Quantity
                  TextFormField(
                    initialValue: widget.item!.quantity,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    inputFormatters: ValidationHelper.allowDigitsOnly,
                    style: const TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                    ),
                    maxLength: 3,
                    decoration: const InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      hintText: AppStrings.strEnterQuantity,
                      hintStyle: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(3),
                        ),
                        borderSide: BorderSide(
                          width: 1,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    onChanged: ((value) {
                      Future.delayed(const Duration(seconds: 1), () {
                        widget.item!.quantity = value;
                        controller.updateProductAt(
                          widget.index!,
                          widget.item!,
                        );
                      });
                    }),
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
