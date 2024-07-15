class User {
  final String fName, lName, email, address;
  final int age;
  const User({
    required this.fName,
    required this.lName,
    required this.email,
    required this.address,
    required this.age,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fName: json['fName'],
      lName: json['lName'],
      email: json['email'],
      address: json['address'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fName': fName,
      'lName': lName,
      'email': email,
      'address': address,
      'age': age,
    };
  }
}
