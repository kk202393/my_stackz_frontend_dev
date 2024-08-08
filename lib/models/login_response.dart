/*
class LoginResponse {
  bool? success;
  String? massage;
  User? user;
  List<UserAddress>? userAddress;
  String? userRole;
  String? token;

  LoginResponse(
      {this.success,
        this.massage,
        this.user,
        this.userAddress,
        this.userRole,
        this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    massage = json['massage'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['userAddress'] != null) {
      userAddress = <UserAddress>[];
      json['userAddress'].forEach((v) {
        userAddress!.add(new UserAddress.fromJson(v));
      });
    }
    userRole = json['userRole'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['massage'] = massage;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (userAddress != null) {
      data['userAddress'] = userAddress!.map((v) => v.toJson()).toList();
    }
    data['userRole'] = userRole;
    data['token'] = token;
    return data;
  }
}

class User {
  String? sId;
  String? username;
  int? userRole;
  String? email;
  String? firstName;
  String? lastName;
  int? phoneNumber;
  String? password;
  String? dob;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.sId,
        this.username,
        this.userRole,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.password,
        this.dob,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['username'] = username;
    data['user_role'] = userRole;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['password'] = password;
    data['dob'] = dob;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class UserAddress {
  String? sId;
  String? userId;
  List<Addresses>? addresses;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserAddress(
      {this.sId,
        this.userId,
        this.addresses,
        this.createdAt,
        this.updatedAt,
        this.iV});

  UserAddress.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['user_id'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['user_id'] = userId;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Addresses {
  bool? isverified;
  bool? isDefault;
  String? address;
  String? city;
  String? pincode;
  String? longitude;
  String? latitude;
  String? sId;

  Addresses(
      {this.isverified,
        this.isDefault,
        this.address,
        this.city,
        this.pincode,
        this.longitude,
        this.latitude,
        this.sId});

  Addresses.fromJson(Map<String, dynamic> json) {
    isverified = json['isverified'];
    isDefault = json['isDefault'];
    address = json['address'];
    city = json['city'];
    pincode = json['pincode'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isverified'] = isverified;
    data['isDefault'] = isDefault;
    data['address'] = address;
    data['city'] = city;
    data['pincode'] = pincode;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    data['_id'] = sId;
    return data;
  }
}

*/

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginResponse {
  late String massage;
  late bool success;
  late User user;
  late List<UserAddress?> userAddress;
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
    massage = json['massage'] ?? "";
    user = User.fromJson(json['user']);
    userAddress =
        (json['userAddress']).map((e) => UserAddress.fromJson(e)).toList();
    userRole = json['userRole'];
    token = json['token'];
  }
  static Future<void> saveToken(String token) async {
    final storage = const FlutterSecureStorage();
    await storage.write(key: 'token', value: token);
  }

  void handleLoginResponse(Map<String, dynamic> jsonResponse) async {
    final loginResponse = LoginResponse.fromJson(jsonResponse);
    await LoginResponse.saveToken(loginResponse.token);
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
    _data['dob'] = dob;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['_v'] = V;
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
    _data['_v'] = V;
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
