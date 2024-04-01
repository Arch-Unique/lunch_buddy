class User {
  String firstName, lastName, email, image, id;
  bool confirmed;

  User(
      {this.firstName = "Fisayo",
      this.lastName = "Fosudo",
      this.image = "",
      this.id = "",
      this.confirmed = false,
      this.email = "fisayofosudo@gmail.com"});

  String get fullName => "$firstName $lastName";

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      image: json['user_image'] ?? "",
      id: json['user_id'] ?? "",
      email: json['email'] ?? "",
      confirmed: json['confirmed_email'] ?? false,
    );
  }
}
