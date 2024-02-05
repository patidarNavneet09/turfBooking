class Tripdetails {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  Tripdetails({this.status, this.statusCode, this.message, this.data});

  Tripdetails.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? loadingLocation;
  String? offloadingLocation;
  String? startDate;
  String? endDate;
  String? revenue;
  String? typeOfCargo;
  String? weightOfCargo;
  String? initialDiesel;
  String? mileageAllowanceCurrency;
  String? mileageAllowance;
  String? movementSheetCurrency;
  String? movementSheet;
  String? roadTollCurrency;
  String? roadToll;
  String? status;
  String? truck;
  String? isStatus;
  String? createdAt;
  String? updatedAt;
  AddOnDiesel? addOnDiesel;
  EnrouteDiesel? enrouteDiesel;
  Repairs? repairs;
  Tolls? tolls;

  Data(
      {this.id,
      this.name,
      this.loadingLocation,
      this.offloadingLocation,
      this.startDate,
      this.endDate,
      this.revenue,
      this.typeOfCargo,
      this.weightOfCargo,
      this.initialDiesel,
      this.mileageAllowanceCurrency,
      this.mileageAllowance,
      this.movementSheetCurrency,
      this.movementSheet,
      this.roadTollCurrency,
      this.roadToll,
      this.status,
      this.truck,
      this.isStatus,
      this.createdAt,
      this.updatedAt,
      this.addOnDiesel,
      this.enrouteDiesel,
      this.repairs,
      this.tolls});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    loadingLocation = json['loading_location'];
    offloadingLocation = json['offloading_location'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    revenue = json['revenue'];
    typeOfCargo = json['type_of_cargo'];
    weightOfCargo = json['weight_of_cargo'];
    initialDiesel = json['initial_diesel'];
    mileageAllowanceCurrency = json['mileage_allowance_currency'];
    mileageAllowance = json['mileage_allowance'];
    movementSheetCurrency = json['movement_sheet_currency'];
    movementSheet = json['movement_sheet'];
    roadTollCurrency = json['road_toll_currency'];
    roadToll = json['road_toll'];
    status = json['status'];
    isStatus = json['is_status'];
    truck = json['truck'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    addOnDiesel = json['add_on_diesel'] != ""
        ? AddOnDiesel.fromJson(json['add_on_diesel'])
        : null;
    enrouteDiesel = json['enroute_diesel'] != ""
        ? EnrouteDiesel.fromJson(json['enroute_diesel'])
        : null;
    repairs =
        json['repairs'] != "" ? new Repairs.fromJson(json['repairs']) : null;
    tolls = json['tolls'] != "" ? new Tolls.fromJson(json['tolls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['loading_location'] = loadingLocation;
    data['offloading_location'] = offloadingLocation;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['revenue'] = revenue;
    data['type_of_cargo'] = typeOfCargo;
    data['weight_of_cargo'] = weightOfCargo;
    data['initial_diesel'] = initialDiesel;
    data['mileage_allowance_currency'] = mileageAllowanceCurrency;
    data['mileage_allowance'] = mileageAllowance;
    data['movement_sheet_currency'] = movementSheetCurrency;
    data['movement_sheet'] = movementSheet;
    data['road_toll_currency'] = roadTollCurrency;
    data['road_toll'] = roadToll;
    data['status'] = status;
    data['truck'] = truck;
    data['is_status'] = isStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (addOnDiesel != null) {
      data['add_on_diesel'] = addOnDiesel!.toJson();
    }
    if (enrouteDiesel != null) {
      data['enroute_diesel'] = enrouteDiesel!.toJson();
    }
    if (repairs != null) {
      data['repairs'] = repairs!.toJson();
    }
    if (tolls != null) {
      data['tolls'] = tolls!.toJson();
    }
    return data;
  }
}

class AddOnDiesel {
  String? id;
  String? tripId;
  String? driverId;
  String? quantityInLitres;
  String? unitPrice;
  String? petrolStationImage;
  String? petrolStation;
  String? createdAt;
  String? updatedAt;

  AddOnDiesel(
      {this.id,
      this.tripId,
      this.driverId,
      this.quantityInLitres,
      this.unitPrice,
      this.petrolStationImage,
      this.petrolStation,
      this.createdAt,
      this.updatedAt});

  AddOnDiesel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    quantityInLitres = json['quantity_in_litres'];
    unitPrice = json['unit_price'];
    petrolStationImage = json['petrol_station_image'];
    petrolStation = json['petrol_station'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['quantity_in_litres'] = quantityInLitres;
    data['unit_price'] = unitPrice;
    data['petrol_station_image'] = petrolStationImage;
    data['petrol_station'] = petrolStation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class EnrouteDiesel {
  String? id;
  String? tripId;
  String? driverId;
  String? quantity;
  String? unitPrice;
  String? petrolStationImage;
  String? petrolStation;
  String? createdAt;
  String? updatedAt;

  EnrouteDiesel(
      {this.id,
      this.tripId,
      this.driverId,
      this.quantity,
      this.unitPrice,
      this.petrolStationImage,
      this.petrolStation,
      this.createdAt,
      this.updatedAt});

  EnrouteDiesel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    petrolStationImage = json['petrol_station_image'];
    petrolStation = json['petrol_station'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['quantity'] = quantity;
    data['unit_price'] = unitPrice;
    data['petrol_station_image'] = petrolStationImage;
    data['petrol_station'] = petrolStation;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Repairs {
  String? id;
  String? tripId;
  String? driverId;
  String? shopName;
  String? repairName;
  String? repairCost;
  String? spareName;
  String? spareCost;
  String? totalAmount;
  String? uploadBill;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Repairs(
      {this.id,
      this.tripId,
      this.driverId,
      this.shopName,
      this.repairName,
      this.repairCost,
      this.spareName,
      this.spareCost,
      this.totalAmount,
      this.uploadBill,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Repairs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    shopName = json['shop_name'];
    repairName = json['repair_name'];
    repairCost = json['repair_cost'];
    spareName = json['spare_name'];
    spareCost = json['spare_cost'];
    totalAmount = json['total_amount'];
    uploadBill = json['upload_bill'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['shop_name'] = shopName;
    data['repair_name'] = repairName;
    data['repair_cost'] = repairCost;
    data['spare_name'] = spareName;
    data['spare_cost'] = spareCost;
    data['total_amount'] = totalAmount;
    data['upload_bill'] = uploadBill;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Tolls {
  String? id;
  String? tripId;
  String? driverId;
  String? tollName;
  String? amount;
  String? tollImage;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Tolls(
      {this.id,
      this.tripId,
      this.driverId,
      this.tollName,
      this.amount,
      this.tollImage,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Tolls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    tollName = json['toll_name'];
    amount = json['amount'];
    tollImage = json['toll_image'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['toll_name'] = tollName;
    data['amount'] = amount;
    data['toll_image'] = tollImage;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
