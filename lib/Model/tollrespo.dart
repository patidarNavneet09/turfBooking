class TollModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  TollModel({this.status, this.statusCode, this.message, this.data});

  TollModel.fromJson(Map<String, dynamic> json) {
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
  String? tollImage;
  String? tripId;
  String? driverId;
  String? tollName;
  String? amount;
  String? updatedAt;
  String? createdAt;
  String? id;

  Data(
      {this.tollImage,
      this.tripId,
      this.driverId,
      this.tollName,
      this.amount,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    tollImage = json['toll_image'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    tollName = json['toll_name'];
    amount = json['amount'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['toll_image'] = tollImage;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['toll_name'] = tollName;
    data['amount'] = amount;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
