import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/entities/product_entity.dart';
import 'package:shop_app/models/Product.dart';

class ProductRepository {
  final productCollection = FirebaseFirestore.instance.collection("Products");

  Future<Product> getProduc(String productId) async {
    try {
      return productCollection.doc(productId).get().then((value) =>
          Product.fromEntity(ProductEntity.fromDocument(value.data()!)));
    } catch (e) {
      rethrow;
    }
  }
}
