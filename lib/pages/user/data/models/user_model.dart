class UserModel2 {
  String name;
  String email;
  String age;
  String? phone;
  String gender;
  String? address;
  UserModel2({
    this.address,
    this.phone,
    required this.age,
    required this.email,
    required this.gender,
    required this.name,
  });
}
