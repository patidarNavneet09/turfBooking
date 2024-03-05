class ProfileGet {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  ProfileGet({this.status, this.statusCode, this.message, this.data});

  ProfileGet.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? image;
  String? countryCode;
  String? phoneNumber;
  String? license;
  String? nationalId;
  String? emailVerifiedAt;
  String? status;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.image,
      this.countryCode,
      this.phoneNumber,
      this.license,
      this.nationalId,
      this.emailVerifiedAt,
      this.status,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    image = json['image'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    license = json['license'];
    nationalId = json['national_id'];
    emailVerifiedAt = json['email_verified_at'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['image'] = image;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['license'] = license;
    data['national_id'] = nationalId;
    data['email_verified_at'] = emailVerifiedAt;
    data['status'] = status;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
