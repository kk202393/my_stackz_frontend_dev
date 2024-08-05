class MyProfileResponse {
  bool? success;
  User? user;
  List<UserAddress>? userAddress;

  MyProfileResponse({this.success, this.user, this.userAddress});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['userAddress'] != null) {
      userAddress = <UserAddress>[];
      json['userAddress'].forEach((v) {
        userAddress!.add(UserAddress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (userAddress != null) {
      data['userAddress'] = userAddress!.map((v) => v.toJson()).toList();
    }
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
    dob = json['dob'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['username'] = username;
    data['user_role'] = userRole;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
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
        addresses!.add(Addresses.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
    final Map<String, dynamic> data = Map<String, dynamic>();
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
