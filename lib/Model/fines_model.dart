class FinesModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  FinesModel({this.status, this.statusCode, this.message, this.data});

  FinesModel.fromJson(Map<String, dynamic> json) {
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
  String? image;
  String? tripId;
  String? name;
  String? amount;
  String? description;
  String? updatedAt;
  String? createdAt;
  String? id;

  Data(
      {this.image,
      this.tripId,
      this.name,
      this.amount,
      this.description,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    tripId = json['trip_id'];
    name = json['name'];
    amount = json['amount'];
    description = json['description'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['trip_id'] = tripId;
    data['name'] = name;
    data['amount'] = amount;
    data['description'] = description;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
