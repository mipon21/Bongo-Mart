class CartItemModel {
  String productid;
  String title;
  double price;
  String? image;
  int quantity;
  String variationid;
  String? brandName;
  Map<String, String>? selectedVariation;

  /// Constructor
  CartItemModel({
    required this.productid,
    required this.quantity,
    this.variationid = "",
    this.image,
    this.price = 8.0,
    this.title = "",
    this.brandName,
    this.selectedVariation,
  });

  /// Empty Cart
  static CartItemModel empty() => CartItemModel(productid: "", quantity: 0);

  /// Convert a Cortites to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      "productId": productid,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'variationId': variationid,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productid: json['productId'],
      title: json['title'],
      price: json['price']?.toDouble(),
      image: json['image'],
      quantity: json['quantity'],
      variationid: json['variationId'],
      brandName: json['brandName'],
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, String>.from(json['selectedVariation'])
          : null,
    );
  }
}
