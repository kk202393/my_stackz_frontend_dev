// import 'dart:convert';

// BookingResponse welcomeFromJson(String str) =>
//     BookingResponse.fromJson(json.decode(str));

// String welcomeToJson(BookingResponse data) => json.encode(data.toJson());

// class BookingResponse {
//   bool success;
//   ConsumerOrderDetails consumerOrderDetails;
//   String massage;

//   BookingResponse({
//     required this.success,
//     required this.consumerOrderDetails,
//     required this.massage,
//   });

//   factory BookingResponse.fromJson(Map<String, dynamic> json) =>
//       BookingResponse(
//         success: json["success"],
//         consumerOrderDetails:
//             ConsumerOrderDetails.fromJson(json["consumerOrderDetails"]),
//         massage: json["massage"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "consumerOrderDetails": consumerOrderDetails.toJson(),
//         "massage": massage,
//       };
// }

// class ConsumerOrderDetails {
//   String id;
//   ConsumerUserId consumerUserId;
//   ConsumerBookingStatus consumerBookingStatus;
//   int servicecategoryId;
//   int subcategoryId;
//   int categoryId;
//   String bookingDate;
//   TimeSlotId timeSlotId;
//   // UseraddressId useraddressId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String bookingId;
//   int v;

//   ConsumerOrderDetails({
//     required this.id,
//     required this.consumerUserId,
//     required this.consumerBookingStatus,
//     required this.servicecategoryId,
//     required this.subcategoryId,
//     required this.categoryId,
//     required this.bookingDate,
//     required this.timeSlotId,
//     // required this.useraddressId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.bookingId,
//     required this.v,
//   });

//   factory ConsumerOrderDetails.fromJson(Map<String, dynamic> json) =>
//       ConsumerOrderDetails(
//         id: json["_id"],
//         consumerUserId: ConsumerUserId.fromJson(json["consumer_user_id"]),
//         consumerBookingStatus:
//             ConsumerBookingStatus.fromJson(json["consumer_booking_status"]),
//         servicecategoryId: json["servicecategory_id"],
//         subcategoryId: json["subcategory_id"],
//         categoryId: json["category_id"],
//         bookingDate: json["booking_date"],
//         timeSlotId: TimeSlotId.fromJson(json["time_slot_id"]),
//         // useraddressId: UseraddressId.fromJson(json["useraddress_id"]),
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         bookingId: json["booking_id"],
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "consumer_user_id": consumerUserId.toJson(),
//         "consumer_booking_status": consumerBookingStatus.toJson(),
//         "servicecategory_id": servicecategoryId,
//         "subcategory_id": subcategoryId,
//         "category_id": categoryId,
//         "booking_date": bookingDate,
//         "time_slot_id": timeSlotId.toJson(),
//         // "useraddress_id": useraddressId.toJson(),
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "booking_id": bookingId,
//         "__v": v,
//       };
// }

// class ConsumerBookingStatus {
//   String bookingStatus;

//   ConsumerBookingStatus({
//     required this.bookingStatus,
//   });

//   factory ConsumerBookingStatus.fromJson(Map<String, dynamic> json) =>
//       ConsumerBookingStatus(
//         bookingStatus: json["booking_status"],
//       );

//   Map<String, dynamic> toJson() => {
//         "booking_status": bookingStatus,
//       };
// }

// class ConsumerUserId {
//   String username;

//   ConsumerUserId({
//     required this.username,
//   });

//   factory ConsumerUserId.fromJson(Map<String, dynamic> json) => ConsumerUserId(
//         username: json["username"],
//       );

//   Map<String, dynamic> toJson() => {
//         "username": username,
//       };
// }

// class TimeSlotId {
//   String timeValue;

//   TimeSlotId({
//     required this.timeValue,
//   });

//   factory TimeSlotId.fromJson(Map<String, dynamic> json) => TimeSlotId(
//         timeValue: json["time_value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "time_value": timeValue,
//       };
// }

// class UseraddressId {
//   List<AddressElement> addresses;

//   UseraddressId({
//     required this.addresses,
//   });

//   factory UseraddressId.fromJson(Map<String, dynamic> json) => UseraddressId(
//         addresses: List<AddressElement>.from(
//             json["addresses"].map((x) => AddressElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "addresses": addresses.isNotEmpty
//             ? List<dynamic>.from(addresses.map((x) => x.toJson()))
//             : [],
//       };
// }

// class AddressElement {
//   bool isverified;
//   bool isDefault;
//   AddressEnum address;
//   City city;
//   String pincode;
//   String longitude;
//   String latitude;
//   String id;

//   AddressElement({
//     required this.isverified,
//     required this.isDefault,
//     required this.address,
//     required this.city,
//     required this.pincode,
//     required this.longitude,
//     required this.latitude,
//     required this.id,
//   });

//   factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
//         isverified: json["isverified"],
//         isDefault: json["isDefault"],
//         address: addressEnumValues.map[json["address"]]!,
//         city: cityValues.map[json["city"]]!,
//         pincode: json["pincode"],
//         longitude: json["longitude"],
//         latitude: json["latitude"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "isverified": isverified,
//         "isDefault": isDefault,
//         "address": addressEnumValues.reverse[address],
//         "city": cityValues.reverse[city],
//         "pincode": pincode,
//         "longitude": longitude,
//         "latitude": latitude,
//         "_id": id,
//       };
// }

// enum AddressEnum { LAXMI_NAGAR, PRATAP_COLONY_DHAMPUR_ROAD }

// final addressEnumValues = EnumValues({
//   "Laxmi Nagar": AddressEnum.LAXMI_NAGAR,
//   "Pratap Colony Dhampur Road": AddressEnum.PRATAP_COLONY_DHAMPUR_ROAD
// });

// enum City { ALIGARH, DIBAI }

// final cityValues = EnumValues({"Aligarh": City.ALIGARH, "Dibai": City.DIBAI});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

class BookingResponse {
  bool? success;
  ConsumerOrderDetails? consumerOrderDetails;
  UserDeviceInfo? userDeviceInfo;
  String? massage;

  BookingResponse(
      {this.success,
      this.consumerOrderDetails,
      this.userDeviceInfo,
      this.massage});

  BookingResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    consumerOrderDetails = json['consumerOrderDetails'] != null
        ? ConsumerOrderDetails.fromJson(json['consumerOrderDetails'])
        : null;
    userDeviceInfo = json['userDeviceInfo'] != null
        ? UserDeviceInfo.fromJson(json['userDeviceInfo'])
        : null;
    massage = json['massage'];
  }
}

class ConsumerOrderDetails {
  String? sId;
  ConsumerUserId? consumerUserId;
  ConsumerBookingStatus? consumerBookingStatus;
  int? servicecategoryId;
  int? subcategoryId;
  bool? isaccepted;
  int? categoryId;
  String? bookingDate;
  TimeSlotId? timeSlotId;
  String? useraddressId;
  String? createdAt;
  String? updatedAt;
  String? bookingId;
  int? iV;

  ConsumerOrderDetails(
      {this.sId,
      this.consumerUserId,
      this.consumerBookingStatus,
      this.servicecategoryId,
      this.subcategoryId,
      this.isaccepted,
      this.categoryId,
      this.bookingDate,
      this.timeSlotId,
      this.useraddressId,
      this.createdAt,
      this.updatedAt,
      this.bookingId,
      this.iV});

  ConsumerOrderDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    consumerUserId = json['consumer_user_id'] != null
        ?  ConsumerUserId.fromJson(json['consumer_user_id'])
        : null;
    consumerBookingStatus = json['consumer_booking_status'] != null
        ?  ConsumerBookingStatus.fromJson(json['consumer_booking_status'])
        : null;
    servicecategoryId = json['servicecategory_id'];
    subcategoryId = json['subcategory_id'];
    isaccepted = json['isaccepted'];
    categoryId = json['category_id'];
    bookingDate = json['booking_date'];
    timeSlotId = json['time_slot_id'] != null
        ? TimeSlotId.fromJson(json['time_slot_id'])
        : null;
    useraddressId = json['useraddress_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bookingId = json['booking_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.consumerUserId != null) {
      data['consumer_user_id'] = this.consumerUserId!.toJson();
    }
    if (this.consumerBookingStatus != null) {
      data['consumer_booking_status'] = this.consumerBookingStatus!.toJson();
    }
    data['servicecategory_id'] = this.servicecategoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['isaccepted'] = this.isaccepted;
    data['category_id'] = this.categoryId;
    data['booking_date'] = this.bookingDate;
    if (this.timeSlotId != null) {
      data['time_slot_id'] = this.timeSlotId!.toJson();
    }
    data['useraddress_id'] = this.useraddressId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['booking_id'] = this.bookingId;
    data['__v'] = this.iV;
    return data;
  }
}

class ConsumerUserId {
  String? username;

  ConsumerUserId({this.username});

  ConsumerUserId.fromJson(Map<String, dynamic> json) {
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    return data;
  }
}

class ConsumerBookingStatus {
  String? bookingStatus;

  ConsumerBookingStatus({this.bookingStatus});

  ConsumerBookingStatus.fromJson(Map<String, dynamic> json) {
    bookingStatus = json['booking_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_status'] = this.bookingStatus;
    return data;
  }
}

class TimeSlotId {
  String? timeValue;

  TimeSlotId({this.timeValue});

  TimeSlotId.fromJson(Map<String, dynamic> json) {
    timeValue = json['time_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time_value'] = this.timeValue;
    return data;
  }
}

class UserDeviceInfo {
  String? sId;
  String? userMobileIMEINo;
  String? userId;
  String? userAndroidID;
  String? userSocketID;
  String? firebaseDeviceToken;
  String? createdAt;
  String? updatedAt;
  int? iV;

  UserDeviceInfo(
      {this.sId,
      this.userMobileIMEINo,
      this.userId,
      this.userAndroidID,
      this.userSocketID,
      this.firebaseDeviceToken,
      this.createdAt,
      this.updatedAt,
      this.iV});

  UserDeviceInfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userMobileIMEINo = json['user_mobile_IMEI_No'];
    userId = json['user_id'];
    userAndroidID = json['user_android_ID'];
    userSocketID = json['user_socketID'];
    firebaseDeviceToken = json['firebase_device_token'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_mobile_IMEI_No'] = this.userMobileIMEINo;
    data['user_id'] = this.userId;
    data['user_android_ID'] = this.userAndroidID;
    data['user_socketID'] = this.userSocketID;
    data['firebase_device_token'] = this.firebaseDeviceToken;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
