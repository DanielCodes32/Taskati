class UserModel {
  String fullName;
  String email;
  String phone;
  String bio;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.bio,
  });

  static UserModel current = UserModel(
    fullName: "Daniel",
    email: "hello@halallab.co",
    phone: "01234567899",
    bio: "I love fast food",
  );
}