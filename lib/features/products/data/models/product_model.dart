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
  bool isFavorite;
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
    this.isFavorite = false,
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
  static ProductModel fakeProduct = ProductModel(
    id: '29f0a5b5-f8eb-4885-ba52-d0f581035222ahjdasjklhdasjd',
    productCode: 'PRD-001',
    name: 'Wireless Headphones',
    description:
        'High-quality wireless headphones with noise cancellation and 30 hours battery life.',
    arabicName: 'سماعات لاسلكية',
    arabicDescription:
        'سماعات لاسلكية عالية الجودة بخاصية عزل الضوضاء وعمر بطارية يصل إلى 30 ساعة.',
    coverPictureUrl:
        'https://images.unsplash.com/photo-1519677100203-a0e668c92439',
    productPictures: [
      'https://images.unsplash.com/photo-1512499617640-c2f999098b59',
      'https://images.unsplash.com/photo-1606813909355-1e8a5d84e91e',
      'https://images.unsplash.com/photo-1574180045827-681f8a1a9622',
    ],
    price: 149.99,
    stock: 25,
    weight: 0.5,
    color: 'Black',
    isFavorite: false,
    rating: 4.7,
    reviewsCount: 128,
    discountPercentage: 10.0,
    sellerId: 'seller_123',
    categories: ['Electronics', 'Audio', 'Headphones'],
  );
}
