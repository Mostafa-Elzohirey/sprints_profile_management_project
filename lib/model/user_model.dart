
import 'dart:convert';

class UserModel {
  String? id;
  String? name;
  String? email;
  int? age;
  String? gender;
  String? phoneNumber;
  String? address;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.age,
    this.gender,
    this.phoneNumber,
    this.address,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) => UserModel(
        id: data['id'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        age: data['age'] as int?,
        gender: data['gender'] as String?,
        phoneNumber: data['phone_number'] as String?,
        address: data['address'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'age': age,
        'gender': gender,
        'phone_number': phoneNumber,
        'address': address,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory UserModel.fromJson(String data) {
    return UserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());
}
