class MyProfileResponse {
  bool? success;
  List<User>? user;

  MyProfileResponse({this.success, this.user});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (user != null) {
      data['user'] = user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? sId;
  String? username;
  String? userRole;
  String? email;
  String? firstName;
  String? lastName;
  int? phoneNumber;
  String? address;
  String? dob;
  int? iV;

  User(
      {this.sId,
        this.username,
        this.userRole,
        this.email,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.address,
        this.dob,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    userRole = json['user_role'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    dob = json['dob'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['username'] = username;
    data['user_role'] = userRole;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['dob'] = dob;
    data['__v'] = iV;
    return data;
  }
}
