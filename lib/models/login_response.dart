class LoginResponse {
  final bool success;
  final String message;
  final User? user;
  final List<UserAddress>? userAddress;
  final String userRole;
  final String token;

  LoginResponse({
    required this.success,
    required this.message,
    this.user,
    this.userAddress,
    required this.userRole,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      userAddress: json['userAddress'] != null
          ? (json['userAddress'] as List)
              .map((item) => UserAddress.fromJson(item))
              .toList()
          : null,
      userRole: json['userRole'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'user': user?.toJson(),
      'userAddress': userAddress?.map((address) => address.toJson()).toList(),
      'userRole': userRole,
      'token': token,
    };
  }
}

class User {
  final String id;
  final String username;
  final int userRole;
  final String email;
  final String firstName;
  final String lastName;
  final int phoneNumber;
  final String dob;
  final String createdAt;
  final String updatedAt;
  final int v;

  User({
    required this.id,
    required this.username,
    required this.userRole,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? '',
      username: json['username'] ?? '',
      userRole: json['user_role'] ?? 0,
      email: json['email'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? 0,
      dob: json['dob'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'user_role': userRole,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'dob': dob,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class UserAddress {
  final String id;
  final String userId;
  final List<Address>? addresses;
  final String createdAt;
  final String updatedAt;
  final int v;

  UserAddress({
    required this.id,
    required this.userId,
    this.addresses,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    return UserAddress(
      id: json['_id'] ?? '',
      userId: json['user_id'] ?? '',
      addresses: json['addresses'] != null
          ? (json['addresses'] as List)
              .map((item) => Address.fromJson(item))
              .toList()
          : null,
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user_id': userId,
      'addresses': addresses?.map((address) => address.toJson()).toList(),
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      '__v': v,
    };
  }
}

class Address {
  final String id;
  final bool isVerified;
  final bool isDefault;
  final String address;
  final String city;
  final String pincode;
  final String longitude;
  final String latitude;

  Address({
    required this.id,
    required this.isVerified,
    required this.isDefault,
    required this.address,
    required this.city,
    required this.pincode,
    required this.longitude,
    required this.latitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['_id'] ?? '',
      isVerified: json['isverified'] ?? false,
      isDefault: json['isDefault'] ?? false,
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      pincode: json['pincode'] ?? '',
      longitude: json['longitude'] ?? '',
      latitude: json['latitude'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'isverified': isVerified,
      'isDefault': isDefault,
      'address': address,
      'city': city,
      'pincode': pincode,
      'longitude': longitude,
      'latitude': latitude,
    };
  }
}
