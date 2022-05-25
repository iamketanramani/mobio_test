class ModelProduct {
  String? id;
  String? price;
  String? picture;
  List<String>? colors;
  String? productName;
  List<Brands>? brands;
  String? selectedColor = '';
  String? selectedBrand = '';
  String? quantity = '';

  ModelProduct({
    this.id,
    this.price,
    this.picture,
    this.colors,
    this.productName,
    this.brands,
    this.selectedColor = '',
    this.selectedBrand = '',
    this.quantity = '',
  });

  ModelProduct.fromJson(Map<String, dynamic> json) {
    id = json["_id"].toString();
    price = json["price"].toString();
    picture = json["picture"].toString();
    colors = json["colors"] == null ? [] : List<String>.from(json["colors"]);
    productName = json["productName"].toString();
    brands = json["brands"] == null
        ? []
        : (json["brands"] as List).map((e) => Brands.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["price"] = price;
    data["picture"] = picture;
    if (colors != null) data["colors"] = colors;
    data["productName"] = productName;
    if (brands != null) {
      data["brands"] = brands?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Brands {
  String? id;
  String? name;

  Brands({this.id, this.name});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    name = json["name"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    return data;
  }
}
