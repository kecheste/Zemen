import 'package:equatable/equatable.dart';
import 'package:shop_app/entities/user_entity.dart';

class MyUser extends Equatable {
  final String id;
  final String phone;
  final String name;
  final String photo;

  const MyUser(
      {required this.id,
      required this.name,
      required this.phone,
      required this.photo});

  toJson() {
    return {'id': id, 'email': name, 'phone': phone, 'photo': photo};
  }

  static final empty = MyUser(id: "", name: "", phone: "", photo: "");

  MyUser copyWith({
    String? id,
    String? phone,
    String? name,
    String? photo,
  }) {
    return MyUser(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        photo: photo ?? this.photo);
  }

  MyUserEntity toEntity() {
    return MyUserEntity(id: id, phone: phone, name: name, photo: photo);
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
        id: entity.id,
        name: entity.name,
        phone: entity.phone,
        photo: entity.photo);
  }

  @override
  List<Object?> get props => [id, phone, name, photo];
}
