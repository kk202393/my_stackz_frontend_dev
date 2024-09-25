class UserDeviceInformation {
  bool? success;
  DeviceInformation? deviceInformation;
  String? massage;

  UserDeviceInformation({this.success, this.deviceInformation, this.massage});

  UserDeviceInformation.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    deviceInformation = json['deviceInformation'] != null
        ? DeviceInformation.fromJson(json['deviceInformation'])
        : null;
    massage = json['massage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (deviceInformation != null) {
      data['deviceInformation'] = deviceInformation!.toJson();
    }
    data['massage'] = massage;
    return data;
  }
}

class DeviceInformation {
  String? sId;
  String? userMobileIMEINo;
  String? userId;
  String? userAndroidID;
  String? userSocketID;
  String? firebaseDeviceToken;
  String? createdAt;
  String? updatedAt;
  int? iV;

  DeviceInformation(
      {this.sId,
        this.userMobileIMEINo,
        this.userId,
        this.userAndroidID,
        this.userSocketID,
        this.firebaseDeviceToken,
        this.createdAt,
        this.updatedAt,
        this.iV});

  DeviceInformation.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['user_mobile_IMEI_No'] = userMobileIMEINo;
    data['user_id'] = userId;
    data['user_android_ID'] = userAndroidID;
    data['user_socketID'] = userSocketID;
    data['firebase_device_token'] = firebaseDeviceToken;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
