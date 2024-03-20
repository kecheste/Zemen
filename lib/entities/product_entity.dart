import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> images;
  final String price;
  final String author;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.author,
  });

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'images': images,
      'price': price,
      'author': author,
    };
  }

  static ProductEntity fromDocument(Map<String, dynamic> doc) {
    return ProductEntity(
      id: doc['id'] as String,
      title: doc['title'] as String,
      description: doc['description'] as String,
      images: doc['images'] as List<String>,
      price: doc['price'] as String,
      author: doc['author'] as String,
    );
  }

  @override
  List<Object?> get props => [id, title, description, images, price, author];

  @override
  String toString() {
    return '''ProductEntity: {
      id: $id
      title: $title
      description: $description
      images: $images
      price: $price
      author: $author
    }''';
  }
}
