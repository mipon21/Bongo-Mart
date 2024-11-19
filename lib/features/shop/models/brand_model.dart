class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;
  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
      this.isFeatured,
      this.productsCount});

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductsCount': productsCount,
    };
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return BrandModel.empty();
    }
    return BrandModel(
      id: data['Id'],
      name: data['Name'],
      image: data['Image'],
      isFeatured: data['IsFeatured'],
      productsCount: data['ProductsCount'],
    );
  }
}
