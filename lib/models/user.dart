class User {
  late final String id;
  late final String firstname;
  late final String lastname;
  late final String dob;
  late final String mobile;
  late final String email;
  late final String address;
  late final String avatar;

  User(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.dob,
      required this.mobile,
      required this.email,
      required this.address,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      firstname: data['firstname'],
      lastname: data['lastname'],
      dob: data['dob'],
      mobile: data['mobile'],
      email: data['email'],
      address: data['address'],
      avatar: data['avatar'],
    );
  }
}
