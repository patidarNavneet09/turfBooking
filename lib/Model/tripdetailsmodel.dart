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
  String? tripnumber;
  String? platenumber;
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
  String? isStatus;
  String? createdAt;
  String? updatedAt;
  String? driverId;
  String? truckId;
  String? driver;
  String? truck;
  String? mileageAllowanceCur;
  String? movementSheetCurr;
  String? roadTollCurr;
  List<AddOnDiesels>? addOnDiesels;
  List<EnrouteDiesels>? enrouteDiesels;
  List<Repairs>? repairs;
  List<Tolls>? tolls;
  List<RoadAccidents>? roadAccidents;
  List<Fines>? fines;
  List<OtherCharges>? otherCharges;
  List<DeliveryNote>? deliveryNote;
  List<EndTrip>? endTrip;

  String? latitude;
  String? longitude;
  String? tid;

  Data(
      {this.id,
      this.name,
      this.tripnumber,
      this.platenumber,
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
      this.isStatus,
      this.createdAt,
      this.updatedAt,
      this.driverId,
      this.truckId,
      this.driver,
      this.truck,
      this.mileageAllowanceCur,
      this.movementSheetCurr,
      this.roadTollCurr,
      this.addOnDiesels,
      this.enrouteDiesels,
      this.repairs,
      this.tolls,
      this.roadAccidents,
      this.fines,
      this.otherCharges,
      this.deliveryNote,
      this.endTrip,
      this.latitude,
      this.longitude,
      this.tid});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tripnumber = json['trip_number'];
    platenumber = json['plate_number'];
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    driverId = json['driver_id'];
    truckId = json['truck_id'];
    driver = json['driver'];
    truck = json['truck'];
    mileageAllowanceCur = json['mileage_allowance_cur'];
    movementSheetCurr = json['movement_sheet_curr'];
    roadTollCurr = json['road_toll_curr'];
    if (json['add_on_diesels'] != null) {
      addOnDiesels = <AddOnDiesels>[];
      json['add_on_diesels'].forEach((v) {
        addOnDiesels!.add(AddOnDiesels.fromJson(v));
      });
    }
    if (json['enroute_diesels'] != null) {
      enrouteDiesels = <EnrouteDiesels>[];
      json['enroute_diesels'].forEach((v) {
        enrouteDiesels!.add(EnrouteDiesels.fromJson(v));
      });
    }
    if (json['repairs'] != null) {
      repairs = <Repairs>[];
      json['repairs'].forEach((v) {
        repairs!.add(Repairs.fromJson(v));
      });
    }
    if (json['tolls'] != null) {
      tolls = <Tolls>[];
      json['tolls'].forEach((v) {
        tolls!.add(Tolls.fromJson(v));
      });
    }
    if (json['road_accidents'] != null) {
      roadAccidents = <RoadAccidents>[];
      json['road_accidents'].forEach((v) {
        roadAccidents!.add(RoadAccidents.fromJson(v));
      });
    }
    if (json['fines'] != null) {
      fines = <Fines>[];
      json['fines'].forEach((v) {
        fines!.add(Fines.fromJson(v));
      });
    }
    if (json['other_charges'] != null) {
      otherCharges = <OtherCharges>[];
      json['other_charges'].forEach((v) {
        otherCharges!.add(OtherCharges.fromJson(v));
      });
    }
    if (json['delivery_note'] != null) {
      deliveryNote = <DeliveryNote>[];
      json['delivery_note'].forEach((v) {
        deliveryNote!.add(DeliveryNote.fromJson(v));
      });
    }
    if (json['end_trip'] != null) {
      endTrip = <EndTrip>[];
      json['end_trip'].forEach((v) {
        endTrip!.add(EndTrip.fromJson(v));
      });
    }
    latitude = json['latitude'];
    longitude = json['longitude'];
    tid = json['tid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['trip_number'] = tripnumber;
    data['plate_number'] = platenumber;
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
    data['is_status'] = isStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['driver_id'] = driverId;
    data['truck_id'] = truckId;
    data['driver'] = driver;
    data['truck'] = truck;
    data['mileage_allowance_cur'] = mileageAllowanceCur;
    data['movement_sheet_curr'] = movementSheetCurr;
    data['road_toll_curr'] = roadTollCurr;
    if (addOnDiesels != null) {
      data['add_on_diesels'] = addOnDiesels!.map((v) => v.toJson()).toList();
    }
    if (enrouteDiesels != null) {
      data['enroute_diesels'] = enrouteDiesels!.map((v) => v.toJson()).toList();
    }
    if (repairs != null) {
      data['repairs'] = repairs!.map((v) => v.toJson()).toList();
    }
    if (tolls != null) {
      data['tolls'] = tolls!.map((v) => v.toJson()).toList();
    }
    if (roadAccidents != null) {
      data['road_accidents'] = roadAccidents!.map((v) => v.toJson()).toList();
    }
    if (fines != null) {
      data['fines'] = fines!.map((v) => v.toJson()).toList();
    }
    if (otherCharges != null) {
      data['other_charges'] = otherCharges!.map((v) => v.toJson()).toList();
    }
    if (deliveryNote != null) {
      data['delivery_note'] = deliveryNote!.map((v) => v.toJson()).toList();
    }
    if (endTrip != null) {
      data['end_trip'] = endTrip!.map((v) => v.toJson()).toList();
    }
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['tid'] = tid;
    return data;
  }
}

class AddOnDiesels {
  String? id;
  String? tripId;
  String? driverId;
  String? quantityInLitres;
  String? unitPrice;
  String? petrolStationImage;
  String? petrolStation;
  String? createdAt;
  String? updatedAt;
  String? date;

  AddOnDiesels({
    this.id,
    this.tripId,
    this.driverId,
    this.quantityInLitres,
    this.unitPrice,
    this.petrolStationImage,
    this.petrolStation,
    this.createdAt,
    this.updatedAt,
    this.date,
  });

  AddOnDiesels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    quantityInLitres = json['quantity_in_litres'];
    unitPrice = json['unit_price'];
    petrolStationImage = json['petrol_station_image'];
    petrolStation = json['petrol_station'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    date = json['date'];
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
    data['date'] = date;
    return data;
  }
}

class EnrouteDiesels {
  String? id;
  String? tripId;
  String? driverId;
  String? quantity;
  String? unitPrice;
  String? petrolStationImage;
  String? petrolStation;
  String? createdAt;
  String? updatedAt;

  EnrouteDiesels(
      {this.id,
      this.tripId,
      this.driverId,
      this.quantity,
      this.unitPrice,
      this.petrolStationImage,
      this.petrolStation,
      this.createdAt,
      this.updatedAt});

  EnrouteDiesels.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? updatedAt;

  Tolls(
      {this.id,
      this.tripId,
      this.driverId,
      this.tollName,
      this.amount,
      this.tollImage,
      this.createdAt,
      this.updatedAt});

  Tolls.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    driverId = json['driver_id'];
    tollName = json['toll_name'];
    amount = json['amount'];
    tollImage = json['toll_image'];
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RoadAccidents {
  String? id;
  String? tripId;
  String? driverId;
  String? accidentCategory;
  String? cost;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  RoadAccidents(
      {this.id,
      this.tripId,
      this.driverId,
      this.accidentCategory,
      this.cost,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt});

  RoadAccidents.fromJson(Map<String, dynamic> json) {
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

class Fines {
  String? id;
  String? tripId;
  String? name;
  String? image;
  String? amount;
  String? description;
  String? createdAt;
  String? updatedAt;

  Fines(
      {this.id,
      this.tripId,
      this.name,
      this.image,
      this.amount,
      this.description,
      this.createdAt,
      this.updatedAt});

  Fines.fromJson(Map<String, dynamic> json) {
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

class DeliveryNote {
  String? id;
  String? tripId;
  String? image;
  String? deliveryNote;
  String? createdAt;
  String? updatedAt;

  DeliveryNote(
      {this.id,
      this.tripId,
      this.image,
      this.deliveryNote,
      this.createdAt,
      this.updatedAt});

  DeliveryNote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    image = json['image'];
    deliveryNote = json['delivery_note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['image'] = image;
    data['delivery_note'] = deliveryNote;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class EndTrip {
  String? id;
  String? tripId;
  String? dieselMeterImage;
  String? odometerImage;
  String? createdAt;
  String? updatedAt;

  EndTrip(
      {this.id,
      this.tripId,
      this.dieselMeterImage,
      this.odometerImage,
      this.createdAt,
      this.updatedAt,
      String? truckId});

  EndTrip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripId = json['trip_id'];
    dieselMeterImage = json['diesel_meter_image'];
    odometerImage = json['odometer_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['trip_id'] = tripId;
    data['diesel_meter_image'] = dieselMeterImage;
    data['odometer_image'] = odometerImage;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
