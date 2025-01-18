/// id : "b4b07181-afc0-4ab4-97ba-d3a8a3d7a6ca"
/// name : "John Doe"
/// email : "john.doe@example.com"
/// age : 30
/// gender : "male"
/// phone_number : "0123456789"
/// address : "123 Main Street"
library;

class User {
  User({
    String? id,
    String? name,
    String? email,
    String? age,
    String? gender,
    String? phoneNumber,
    String? address,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _age = age;
    _gender = gender;
    _phoneNumber = phoneNumber;
    _address = address;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _age = json['age'].toString();
    _gender = json['gender'];
    _phoneNumber = json['phone_number'];
    _address = json['address'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _age;
  String? _gender;
  String? _phoneNumber;
  String? _address;

  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get age => _age;
  String? get gender => _gender;
  String? get phoneNumber => _phoneNumber;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['age'] = _age;
    map['gender'] = _gender;
    map['phone_number'] = _phoneNumber;
    map['address'] = _address;
    return map;
  }
}
