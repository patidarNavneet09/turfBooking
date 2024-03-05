class RepairsModel {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  RepairsModel({this.status, this.statusCode, this.message, this.data});

  RepairsModel.fromJson(Map<String, dynamic> json) {
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
  String? uploadBill;
  String? tripId;
  String? driverId;
  String? shopName;
  String? repairName;
  String? repairCost;
  String? spareName;
  String? spareCost;
  String? totalAmount;
  String? updatedAt;
  String? createdAt;
  String? id;

  Data(
      {this.uploadBill,
      this.tripId,
      this.driverId,
      this.shopName,
      this.repairName,
      this.repairCost,
      this.spareName,
      this.spareCost,
      this.totalAmount,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    uploadBill = json['upload_bill'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    shopName = json['shop_name'];
    repairName = json['repair_name'];
    repairCost = json['repair_cost'];
    spareName = json['spare_name'];
    spareCost = json['spare_cost'];
    totalAmount = json['total_amount'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['upload_bill'] = uploadBill;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['shop_name'] = shopName;
    data['repair_name'] = repairName;
    data['repair_cost'] = repairCost;
    data['spare_name'] = spareName;
    data['spare_cost'] = spareCost;
    data['total_amount'] = totalAmount;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
