class Dieselrespose {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  Dieselrespose({this.status, this.statusCode, this.message, this.data});

  Dieselrespose.fromJson(Map<String, dynamic> json) {
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
  String? petrolStationImage;
  String? tripId;
  String? driverId;
  String? quantityInLitres;
  String? unitPrice;
  String? petrolStation;
  String? updatedAt;
  String? createdAt;
  String? id;

  Data(
      {this.petrolStationImage,
      this.tripId,
      this.driverId,
      this.quantityInLitres,
      this.unitPrice,
      this.petrolStation,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    petrolStationImage = json['petrol_station_image'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    quantityInLitres = json['quantity_in_litres'];
    unitPrice = json['unit_price'];
    petrolStation = json['petrol_station'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['petrol_station_image'] = petrolStationImage;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['quantity_in_litres'] = quantityInLitres;
    data['unit_price'] = unitPrice;
    data['petrol_station'] = petrolStation;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
