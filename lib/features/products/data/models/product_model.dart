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

final fakeProduct = ProductModel(
  id: "68ad9d40-802a-42e2-9269-dafc9e7dd314",
  productCode: "PRD-20251007-BA1985",
  name: "Smart Dishwasher",
  description: "A modern smart dishwasher with advanced cleaning features.",
  arabicName: "غسالة أطباق بوش",
  arabicDescription: "غسالة أطباق ذكية من بوش بتقنيات متطورة لتنظيف مثالي.",
  coverPictureUrl:
      "https://cdn.mafrservices.com/sys-master-root/hfc/hb1/32680781611038/561732_main.jpg?im=Resize=400",
  productPictures: null,
  price: 200.00,
  stock: 5,
  weight: 9355.245,
  color: "White",
  rating: 3.3,
  reviewsCount: 3,
  discountPercentage: 20.0,
  sellerId: "eab68d32-5f9c-4eb2-61c7-08ddccead94a",
  categories: ["Appliances"],
);
