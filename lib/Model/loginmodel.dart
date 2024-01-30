class LoginResponse {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  LoginResponse({this.status, this.statusCode, this.message, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? updatedAt;
  String? createdAt;
  String? id;
  String? fcmToken;
  String? deviceId;
  String? deviceType;
  String? token;
  String? image;

  Data(
      {this.email,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.fcmToken,
      this.deviceId,
      this.deviceType,
      this.token,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    fcmToken = json['fcm_token'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    token = json['token'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['fcm_token'] = fcmToken;
    data['device_id'] = deviceId;
    data['device_type'] = deviceType;
    data['token'] = token;
    data['image'] = image;
    return data;
  }
}
