// class CreateAccountResponse {
//   bool? success;
//   String? massage;
//   User? user;
//   String? token;

//   CreateAccountResponse({this.success, this.massage, this.user, this.token});

//   CreateAccountResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     massage = json['massage'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//     token = json['token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     data['massage'] = massage;
//     if (user != null) {
//       data['user'] = user!.toJson();
//     }
//     data['token'] = token;
//     return data;
//   }
// }

// class User {
//   String? username;
//   String? userRole;
//   String? email;
//   String? firstName;
//   String? lastName;
//   int? phoneNumber;
//   String? password;
//   String? address;
//   String? createAt;
//   String? updatedAt;
//   String? dob;
//   String? sId;
//   int? iV;

//   User(
//       {this.username,
//         this.userRole,
//         this.email,
//         this.firstName,
//         this.lastName,
//         this.phoneNumber,
//         this.password,
//         this.address,
//         this.createAt,
//         this.updatedAt,
//         this.dob,
//         this.sId,
//         this.iV});

//   User.fromJson(Map<String, dynamic> json) {
//     username = json['username'];
//     userRole = json['user_role'];
//     email = json['email'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     phoneNumber = json['phone_number'];
//     password = json['password'];
//     address = json['address'];
//     createAt = json['create_at'];
//     updatedAt = json['updated_at'];
//     dob = json['dob'];
//     sId = json['_id'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['username'] = username;
//     data['user_role'] = userRole;
//     data['email'] = email;
//     data['first_name'] = firstName;
//     data['last_name'] = lastName;
//     data['phone_number'] = phoneNumber;
//     data['password'] = password;
//     data['address'] = address;
//     data['create_at'] = createAt;
//     data['updated_at'] = updatedAt;
//     data['dob'] = dob;
//     data['_id'] = sId;
//     data['__v'] = iV;
//     return data;
//   }
// }

class CreateAccountResponse {
  bool? success;
  String? massage;
  User? user;
  String? userAddress;
  String? userRole;
  String? token;

  CreateAccountResponse(
      {this.success,
      this.massage,
      this.user,
      this.userAddress,
      this.userRole,
      this.token});

  CreateAccountResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    massage = json['massage'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    userAddress = json['userAddress'];
    userRole = json['userRole'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['massage'] = massage;
    data['userAddress'] = userAddress;
    data['userRole'] = userRole;
    data['token'] = token;
    return data;
  }
}

class User {
  String? username;
  int? userRole;
  String? email;
  String? firstName;
  String? lastName;
  int? phoneNumber;
  String? password;
  String? dob;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.username,
      this.userRole,
      this.email,
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.password,
      this.dob,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userRole = json['user_role'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    password = json['password'];
    dob = json['dob'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['username'] = this.username;
  //   data['user_role'] = this.userRole;
  //   data['email'] = this.email;
  //   data['first_name'] = this.firstName;
  //   data['last_name'] = this.lastName;
  //   data['phone_number'] = this.phoneNumber;
  //   data['password'] = this.password;
  //   data['dob'] = this.dob;
  //   data['_id'] = this.sId;
  //   data['createdAt'] = this.createdAt;
  //   data['updatedAt'] = this.updatedAt;
  //   data['__v'] = this.iV;
  //   return data;
  // }
}
