class ProductAttributeModel {
  String? name;
  final List<String>? values;
  ProductAttributeModel({this.name, this.values});

  /// Json Format
  toJson() {
    return {'Name': name, 'Values': values};
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) {
      return ProductAttributeModel();
    }
    return ProductAttributeModel(
      name: data['Name'],
      values: List<String>.from(data['Values']),
    );
  }
}
