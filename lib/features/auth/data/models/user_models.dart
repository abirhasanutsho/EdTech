class UserModel {
  final String name;
  final String email;
  final String phone;
  final String address;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  // Add a copyWith method to create a new instance with updated values
  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? address,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
    );
  }
}
