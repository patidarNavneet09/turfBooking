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
  RoadAccident? roadAccident;
  Fine? fine;
  Fine? otherCharges;
  DeliveryInformation? deliveryInformation;
  EndTripDetail? endTripDetail;

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
      this.tolls,
      this.roadAccident,
      this.fine,
      this.otherCharges,
      this.deliveryInformation,
      this.endTripDetail});

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
    repairs = json['repairs'] != "" ? Repairs.fromJson(json['repairs']) : null;
    tolls = json['tolls'] != "" ? Tolls.fromJson(json['tolls']) : null;
    roadAccident = json['road_accident'] != ""
        ? RoadAccident.fromJson(json['road_accident'])
        : null;
    fine = json['fine'] != "" ? Fine.fromJson(json['fine']) : null;
    otherCharges = json['other_charges'] != ""
        ? Fine.fromJson(json['other_charges'])
        : null;
    deliveryInformation = json['delivery_information'] != ""
        ? DeliveryInformation.fromJson(json['delivery_information'])
        : null;
    endTripDetail = json['end_trip_detail'] != ""
        ? EndTripDetail.fromJson(json['end_trip_detail'])
        : null;
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
    if (roadAccident != null) {
      data['road_accident'] = roadAccident!.toJson();
    }
    if (fine != null) {
      data['fine'] = fine!.toJson();
    }
    if (otherCharges != null) {
      data['other_charges'] = otherCharges!.toJson();
    }
    if (deliveryInformation != null) {
      data['delivery_information'] = deliveryInformation!.toJson();
    }
    if (endTripDetail != null) {
      data['end_trip_detail'] = endTripDetail!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
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
    final Map<String, dynamic> data = <String, dynamic>{};
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

class RoadAccident {
  String? id;
  String? tripId;
  String? driverId;
  String? accidentCategory;
  String? cost;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  RoadAccident(
      {this.id,
      this.tripId,
      this.driverId,
      this.accidentCategory,
      this.cost,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt});

  RoadAccident.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    accidentCategory = json['accident_category'];
    cost = json['cost'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['driver_id'] = driverId;
    data['accident_category'] = accidentCategory;
    data['cost'] = cost;
    data['image'] = image;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Fine {
  String? id;
  String? tripId;
  String? name;
  String? image;
  String? amount;
  String? description;
  String? createdAt;
  String? updatedAt;

  Fine(
      {this.id,
      this.tripId,
      this.name,
      this.image,
      this.amount,
      this.description,
      this.createdAt,
      this.updatedAt});

  Fine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    name = json['name'];
    image = json['image'];
    amount = json['amount'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['name'] = name;
    data['image'] = image;
    data['amount'] = amount;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class OtherCharges {
  String? id;
  String? tripId;
  String? name;
  String? image;
  String? amount;
  String? description;
  String? createdAt;
  String? updatedAt;

  OtherCharges(
      {this.id,
      this.tripId,
      this.name,
      this.image,
      this.amount,
      this.description,
      this.createdAt,
      this.updatedAt});

  OtherCharges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    name = json['name'];
    image = json['image'];
    amount = json['amount'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['name'] = name;
    data['image'] = image;
    data['amount'] = amount;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class DeliveryInformation {
  String? id;
  String? tripId;
  String? image;
  String? deliveryNote;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  DeliveryInformation(
      {this.id,
      this.tripId,
      this.image,
      this.deliveryNote,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  DeliveryInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    image = json['image'];
    deliveryNote = json['delivery_note'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['image'] = image;
    data['delivery_note'] = deliveryNote;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class EndTripDetail {
  String? id;
  String? tripId;
  String? dieselMeterImage;
  String? odometerImage;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  EndTripDetail(
      {this.id,
      this.tripId,
      this.dieselMeterImage,
      this.odometerImage,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  EndTripDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    dieselMeterImage = json['diesel_meter_image'];
    odometerImage = json['odometer_image'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['diesel_meter_image'] = dieselMeterImage;
    data['odometer_image'] = odometerImage;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
