class ProductModel {
  factory ProductModel.fromJson(Map<String, dynamic>? json, String? id) {
    if (json == null) return ProductModel();

    return ProductModel(
      id: id,
      name: json['name'] as String?,
      price: (json['price'] != null) ? (json['price'] as num).toDouble() : null,
      imageUrl: json['imageUrl'] as String?,
    );
  }
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.imageUrl,
  });
  final String? id;
  final String? name;
  final double? price;
  final String? imageUrl;

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (imageUrl != null) 'imageUrl': imageUrl,
    };
  }
}
