import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  final String id;
  final String phone;
  final String name;
  final String photo;

  const MyUserEntity(
      {required this.id,
      required this.phone,
      required this.name,
      required this.photo});

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'phone': phone,
      'name': name,
      'photo': photo,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      phone: doc['phone'] as String,
      name: doc['name'] as String,
      photo: doc['photo'] as String,
    );
  }

  @override
  List<Object?> get props => [id, phone, name, photo];

  @override
  String toString() {
    return '''UserEntity: {
      id: $id
      phone: $phone
      name: $name
      photo: $photo
    }''';
  }
}
