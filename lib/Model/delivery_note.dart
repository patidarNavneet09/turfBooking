class DeliverNote {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  DeliverNote({this.status, this.statusCode, this.message, this.data});

  DeliverNote.fromJson(Map<String, dynamic> json) {
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
  String? deliveryNote;
  String? updatedAt;
  String? createdAt;
  String? id;

  Data(
      {this.image,
      this.tripId,
      this.deliveryNote,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    tripId = json['trip_id'];
    deliveryNote = json['delivery_note'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['trip_id'] = tripId;
    data['delivery_note'] = deliveryNote;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
