

import 'dart:convert';

BookingResponse welcomeFromJson(String str) => BookingResponse.fromJson(json.decode(str));

String welcomeToJson(BookingResponse data) => json.encode(data.toJson());

class BookingResponse {
    bool success;
    ConsumerOrderDetails consumerOrderDetails;
    String massage;

    BookingResponse({
        required this.success,
        required this.consumerOrderDetails,
        required this.massage,
    });

    factory BookingResponse.fromJson(Map<String, dynamic> json) => BookingResponse(
        success: json["success"],
        consumerOrderDetails: ConsumerOrderDetails.fromJson(json["consumerOrderDetails"]),
        massage: json["massage"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "consumerOrderDetails": consumerOrderDetails.toJson(),
        "massage": massage,
    };
}

class ConsumerOrderDetails {
  String id;
  ConsumerUserId consumerUserId;
  ConsumerBookingStatus consumerBookingStatus;
  int servicecategoryId;
  int subcategoryId;
  int categoryId;
  String bookingDate;
  TimeSlotId timeSlotId; 
  UseraddressId useraddressId; 
  DateTime createdAt;
  DateTime updatedAt;
  String bookingId;
  int v;

  ConsumerOrderDetails({
    required this.id,
    required this.consumerUserId,
    required this.consumerBookingStatus,
    required this.servicecategoryId,
    required this.subcategoryId,
    required this.categoryId,
    required this.bookingDate,
    required this.timeSlotId,
    required this.useraddressId,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingId,
    required this.v,
  });

  factory ConsumerOrderDetails.fromJson(Map<String, dynamic> json) => ConsumerOrderDetails(
    id: json["_id"],
    consumerUserId: ConsumerUserId.fromJson(json["consumer_user_id"]),
    consumerBookingStatus: ConsumerBookingStatus.fromJson(json["consumer_booking_status"]),
    servicecategoryId: json["servicecategory_id"],
    subcategoryId: json["subcategory_id"],
    categoryId: json["category_id"],
    bookingDate: json["booking_date"],
    timeSlotId: TimeSlotId.fromJson(json["time_slot_id"]),
    useraddressId: UseraddressId.fromJson(json["useraddress_id"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    bookingId: json["booking_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "consumer_user_id": consumerUserId.toJson(),
    "consumer_booking_status": consumerBookingStatus.toJson(),
    "servicecategory_id": servicecategoryId,
    "subcategory_id": subcategoryId,
    "category_id": categoryId,
    "booking_date": bookingDate,
    "time_slot_id": timeSlotId.toJson(), 
    "useraddress_id": useraddressId.toJson(), 
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "booking_id": bookingId,
    "__v": v,
  };
}

class ConsumerBookingStatus {
    String bookingStatus;

    ConsumerBookingStatus({
        required this.bookingStatus,
    });

    factory ConsumerBookingStatus.fromJson(Map<String, dynamic> json) => ConsumerBookingStatus(
        bookingStatus: json["booking_status"],
    );

    Map<String, dynamic> toJson() => {
        "booking_status": bookingStatus,
    };
}

class ConsumerUserId {
    String username;

    ConsumerUserId({
        required this.username,
    });

    factory ConsumerUserId.fromJson(Map<String, dynamic> json) => ConsumerUserId(
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
    };
}

class TimeSlotId {
    String timeValue;

    TimeSlotId({
        required this.timeValue,
    });

    factory TimeSlotId.fromJson(Map<String, dynamic> json) => TimeSlotId(
        timeValue: json["time_value"],
    );

    Map<String, dynamic> toJson() => {
        "time_value": timeValue,
    };
}

class UseraddressId {
    List<AddressElement> addresses;

    UseraddressId({
        required this.addresses,
    });

    factory UseraddressId.fromJson(Map<String, dynamic> json) => UseraddressId(
        addresses: List<AddressElement>.from(json["addresses"].map((x) => AddressElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "addresses": List<dynamic>.from(addresses.map((x) => x.toJson())),
    };
}

class AddressElement {
    bool isverified;
    bool isDefault;
    AddressEnum address;
    City city;
    String pincode;
    String longitude;
    String latitude;
    String id;

    AddressElement({
        required this.isverified,
        required this.isDefault,
        required this.address,
        required this.city,
        required this.pincode,
        required this.longitude,
        required this.latitude,
        required this.id,
    });

    factory AddressElement.fromJson(Map<String, dynamic> json) => AddressElement(
        isverified: json["isverified"],
        isDefault: json["isDefault"],
        address: addressEnumValues.map[json["address"]]!,
        city: cityValues.map[json["city"]]!,
        pincode: json["pincode"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "isverified": isverified,
        "isDefault": isDefault,
        "address": addressEnumValues.reverse[address],
        "city": cityValues.reverse[city],
        "pincode": pincode,
        "longitude": longitude,
        "latitude": latitude,
        "_id": id,
    };
}

enum AddressEnum {
    LAXMI_NAGAR,
    PRATAP_COLONY_DHAMPUR_ROAD
}

final addressEnumValues = EnumValues({
    "Laxmi Nagar": AddressEnum.LAXMI_NAGAR,
    "Pratap Colony Dhampur Road": AddressEnum.PRATAP_COLONY_DHAMPUR_ROAD
});

enum City {
    ALIGARH,
    DIBAI
}

final cityValues = EnumValues({
    "Aligarh": City.ALIGARH,
    "Dibai": City.DIBAI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
