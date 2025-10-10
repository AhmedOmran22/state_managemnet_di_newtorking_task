class ProductModel {
  final String? id;
  final String? productCode;
  final String? name;
  final String? description;
  final String? arabicName;
  final String? arabicDescription;
  final String? coverPictureUrl;
  final List<String>? productPictures;
  final double? price;
  final int? stock;
  final double? weight;
  final String? color;
  final double? rating;
  final int? reviewsCount;
  final double? discountPercentage;
  final String? sellerId;
  final List<String>? categories;

  ProductModel({
    this.id,
    this.productCode,
    this.name,
    this.description,
    this.arabicName,
    this.arabicDescription,
    this.coverPictureUrl,
    this.productPictures,
    this.price,
    this.stock,
    this.weight,
    this.color,
    this.rating,
    this.reviewsCount,
    this.discountPercentage,
    this.sellerId,
    this.categories,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      productCode: json['productCode'],
      name: json['name'],
      description: json['description'],
      arabicName: json['arabicName'],
      arabicDescription: json['arabicDescription'],
      coverPictureUrl: json['coverPictureUrl'],
      productPictures: json['productPictures'] != null
          ? List<String>.from(json['productPictures'])
          : null,
      price: (json['price'] as num).toDouble(),
      stock: json['stock'],
      weight: (json['weight'] as num).toDouble(),
      color: json['color'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'],
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      sellerId: json['sellerId'],
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : null,
    );
  }
}
