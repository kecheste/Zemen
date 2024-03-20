import 'package:shop_app/entities/product_entity.dart';

class Product {
  final String id;
  final String title, description;
  final List<String> images;
  final String price;
  final String author;

  Product({
    required this.id,
    required this.images,
    required this.title,
    required this.price,
    required this.description,
    required this.author,
  });

  static final empty = Product(
      id: "", images: [], title: "", price: "", description: "", author: "");

  Product copyWith(
      {String? id,
      String? title,
      String? description,
      List<String>? images,
      String? price,
      String? author}) {
    return Product(
        id: id ?? this.id,
        images: images ?? this.images,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        author: author ?? this.author);
  }

  ProductEntity toEntity() {
    return ProductEntity(
        id: id,
        title: title,
        description: description,
        images: images,
        price: price,
        author: author);
  }

  static Product fromEntity(ProductEntity entity) {
    return Product(
        id: entity.id,
        images: entity.images,
        title: entity.title,
        price: entity.price,
        description: entity.description,
        author: entity.author);
  }
}

List<Product> demoProducts = [
  Product(
      id: "1",
      images: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      title: "Wireless Controller for PS4™",
      price: "64.99",
      description: description,
      author: "hk737Y11hGSDebtdX66mks7iFKW2"),
  Product(
      id: "2",
      images: [
        "assets/images/Image Popular Product 2.png",
      ],
      title: "Nike Sport White - Man Pant",
      price: "50.5",
      description: description,
      author: "hk737Y11hGSDebtdX66mks7iFKW2"),
  Product(
      id: "3",
      images: [
        "assets/images/glap.png",
      ],
      title: "Gloves XC Omega - Polygon",
      price: "36.55",
      description: description,
      author: "hk737Y11hGSDebtdX66mks7iFKW2"),
  Product(
      id: "4",
      images: [
        "assets/images/wireless headset.png",
      ],
      title: "Logitech Head",
      price: "20.20",
      description: description,
      author: "hk737Y11hGSDebtdX66mks7iFKW2"),
  Product(
      id: "1",
      images: [
        "assets/images/ps4_console_white_1.png",
        "assets/images/ps4_console_white_2.png",
        "assets/images/ps4_console_white_3.png",
        "assets/images/ps4_console_white_4.png",
      ],
      title: "Wireless Controller for PS4™",
      price: "64.99",
      description: description,
      author: "hk737Y11hGSDebtdX66mks7iFKW2"),
  Product(
      id: "2",
      images: [
        "assets/images/Image Popular Product 2.png",
      ],
      title: "Nike Sport White - Man Pant",
      price: "50.5",
      description: description,
      author: "hk737Y11hGSDebtdX66mks7iFKW2"),
  Product(
      id: "3",
      images: [
        "assets/images/glap.png",
      ],
      title: "Gloves XC Omega - Polygon",
      price: "36.55",
      description: description,
      author: "hk737Y11hGSDebtdX66mks7iFKW2"),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
