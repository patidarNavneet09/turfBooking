class EndTripModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  EndTripModel({this.status, this.statusCode, this.message, this.data});

  EndTripModel.fromJson(Map<String, dynamic> json) {
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
  String? dieselMeterImage;
  String? odometerImage;
  String? tripId;
  String? updatedAt;
  String? createdAt;
  String? id;

  Data(
      {this.dieselMeterImage,
      this.odometerImage,
      this.tripId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    dieselMeterImage = json['diesel_meter_image'];
    odometerImage = json['odometer_image'];
    tripId = json['trip_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['diesel_meter_image'] = dieselMeterImage;
    data['odometer_image'] = odometerImage;
    data['trip_id'] = tripId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
