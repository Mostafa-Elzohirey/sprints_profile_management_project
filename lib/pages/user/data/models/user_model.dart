class UserModel {
  String name;
  String email;
  String age;
  String? phone;
  String gender;
  String? address;
  UserModel({
    this.address,
    this.phone,
    required this.age,
    required this.email,
    required this.gender,
    required this.name,
  });
}
