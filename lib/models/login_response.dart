class LoginResponse {
  late String massage;
  late bool success;
  late User user;
  late List<dynamic> userAddress;
  late String userRole;
  late String token;
  LoginResponse({
    required this.success,
    required this.massage,
    required this.user,
    required this.userAddress,
    required this.userRole,
    required this.token,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    // List<UserAddress> data = json['userAddress'].map((e) => userAddress.add(e));
    success = json['success'];
    massage = json['massage'];
    user = User.fromJson(json['user']);
    userAddress = json['userAddress'] ?? [];
    userRole = json['userRole'];
    token = json['token']; 
  }

  // Map<String, dynamic> toJson() {
  //   final _data = <String, dynamic>{};
  //   _data['success'] = success;
  //   _data['massage'] = massage;
  //   _data['user'] = user.toJson();
  //   _data['userAddress'] = userAddress.map((e)=>e.toJson()).toList();
  //   _data['userRole'] = userRole;
  //   _data['token'] = token;
  //   return _data;
  // }
}

class User {
  User({
    required this.id,
    required this.username,
    required this.userRole,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late String id;
  late String username;
  late int userRole;
  late String email;
  late String firstName;
  late String lastName;
  late int phoneNumber;
  late String password;
  late String dob;
  late String createdAt;
  late String updatedAt;
  late int V;

  User.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    username = json['username'];
    userRole = json['user_role'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    dob = json['dob'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['user_role'] = userRole;
    _data['email'] = email;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['phone_number'] = phoneNumber;
    _data['password'] = password;
    _data['dob'] = dob;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class UserAddress {
  UserAddress({
    required this.id,
    required this.userId,
    required this.addresses,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late String id;
  late String userId;
  late List<Addresses> addresses;
  late String createdAt;
  late String updatedAt;
  late int V;

  UserAddress.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    userId = json['user_id'];
    addresses = json['userAddress'].map((e) => Addresses.fromJson(e)).toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['user_id'] = userId;
    _data['addresses'] = addresses.map((e) => e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}

class Addresses {
  Addresses({
    required this.isDefault,
    required this.address,
    required this.city,
    required this.pincode,
    required this.longitude,
    required this.latitude,
    required this.id,
  });
  late final bool isDefault;
  late final String address;
  late final String city;
  late final String pincode;
  late final String longitude;
  late final String latitude;
  late final String id;

  Addresses.fromJson(Map<String, dynamic> json) {
    isDefault = json['isDefault'];
    address = json['address'];
    city = json['city'];
    pincode = json['pincode'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isDefault'] = isDefault;
    _data['address'] = address;
    _data['city'] = city;
    _data['pincode'] = pincode;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    _data['_id'] = id;
    return _data;
  }
}
