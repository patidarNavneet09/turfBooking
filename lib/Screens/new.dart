// class Tripdetails {
//   bool? status;
//   int? statusCode;
//   String? message;
//   Data? data;

//   Tripdetails({this.status, this.statusCode, this.message, this.data});

//   Tripdetails.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     statusCode = json['status_code'];
//     message = json['message'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['status_code'] = this.statusCode;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   String? id;
//   String? name;
//   String? loadingLocation;
//   String? offloadingLocation;
//   String? startDate;
//   String? endDate;
//   String? revenue;
//   String? typeOfCargo;
//   String? weightOfCargo;
//   String? initialDiesel;
//   String? mileageAllowanceCurrency;
//   String? mileageAllowance;
//   String? movementSheetCurrency;
//   String? movementSheet;
//   String? roadTollCurrency;
//   String? roadToll;
//   String? status;
//   String? isStatus;
//   String? createdAt;
//   String? updatedAt;
//   String? driverId;
//   String? truckId;
//   String? driver;
//   String? truck;
//   String? mileageAllowanceCur;
//   String? movementSheetCurr;
//   String? roadTollCurr;
//   AddOnDiesel? addOnDiesel;
//   EnrouteDiesel? enrouteDiesel;
//   Repairs? repairs;
//   Tolls? tolls;

//   Data(
//       {this.id,
//       this.name,
//       this.loadingLocation,
//       this.offloadingLocation,
//       this.startDate,
//       this.endDate,
//       this.revenue,
//       this.typeOfCargo,
//       this.weightOfCargo,
//       this.initialDiesel,
//       this.mileageAllowanceCurrency,
//       this.mileageAllowance,
//       this.movementSheetCurrency,
//       this.movementSheet,
//       this.roadTollCurrency,
//       this.roadToll,
//       this.status,
//       this.isStatus,
//       this.createdAt,
//       this.updatedAt,
//       this.driverId,
//       this.truckId,
//       this.driver,
//       this.truck,
//       this.mileageAllowanceCur,
//       this.movementSheetCurr,
//       this.roadTollCurr,
//       this.addOnDiesel,
//       this.enrouteDiesel,
//       this.repairs,
//       this.tolls});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     loadingLocation = json['loading_location'];
//     offloadingLocation = json['offloading_location'];
//     startDate = json['start_date'];
//     endDate = json['end_date'];
//     revenue = json['revenue'];
//     typeOfCargo = json['type_of_cargo'];
//     weightOfCargo = json['weight_of_cargo'];
//     initialDiesel = json['initial_diesel'];
//     mileageAllowanceCurrency = json['mileage_allowance_currency'];
//     mileageAllowance = json['mileage_allowance'];
//     movementSheetCurrency = json['movement_sheet_currency'];
//     movementSheet = json['movement_sheet'];
//     roadTollCurrency = json['road_toll_currency'];
//     roadToll = json['road_toll'];
//     status = json['status'];
//     isStatus = json['is_status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     driverId = json['driver_id'];
//     truckId = json['truck_id'];
//     driver = json['driver'];
//     truck = json['truck'];
//     mileageAllowanceCur = json['mileage_allowance_cur'];
//     movementSheetCurr = json['movement_sheet_curr'];
//     roadTollCurr = json['road_toll_curr'];
//     addOnDiesel = json['add_on_diesel'] != null
//         ? new AddOnDiesel.fromJson(json['add_on_diesel'])
//         : null;
//     enrouteDiesel = json['enroute_diesel'] != null
//         ? new EnrouteDiesel.fromJson(json['enroute_diesel'])
//         : null;
//     repairs =
//         json['repairs'] != null ? new Repairs.fromJson(json['repairs']) : null;
//     tolls = json['tolls'] != null ? new Tolls.fromJson(json['tolls']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['loading_location'] = this.loadingLocation;
//     data['offloading_location'] = this.offloadingLocation;
//     data['start_date'] = this.startDate;
//     data['end_date'] = this.endDate;
//     data['revenue'] = this.revenue;
//     data['type_of_cargo'] = this.typeOfCargo;
//     data['weight_of_cargo'] = this.weightOfCargo;
//     data['initial_diesel'] = this.initialDiesel;
//     data['mileage_allowance_currency'] = this.mileageAllowanceCurrency;
//     data['mileage_allowance'] = this.mileageAllowance;
//     data['movement_sheet_currency'] = this.movementSheetCurrency;
//     data['movement_sheet'] = this.movementSheet;
//     data['road_toll_currency'] = this.roadTollCurrency;
//     data['road_toll'] = this.roadToll;
//     data['status'] = this.status;
//     data['is_status'] = this.isStatus;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['driver_id'] = this.driverId;
//     data['truck_id'] = this.truckId;
//     data['driver'] = this.driver;
//     data['truck'] = this.truck;
//     data['mileage_allowance_cur'] = this.mileageAllowanceCur;
//     data['movement_sheet_curr'] = this.movementSheetCurr;
//     data['road_toll_curr'] = this.roadTollCurr;
//     if (this.addOnDiesel != null) {
//       data['add_on_diesel'] = this.addOnDiesel!.toJson();
//     }
//     if (this.enrouteDiesel != null) {
//       data['enroute_diesel'] = this.enrouteDiesel!.toJson();
//     }
//     if (this.repairs != null) {
//       data['repairs'] = this.repairs!.toJson();
//     }
//     if (this.tolls != null) {
//       data['tolls'] = this.tolls!.toJson();
//     }
//     return data;
//   }
// }

// class AddOnDiesel {
//   String? id;
//   String? tripId;
//   String? driverId;
//   String? quantityInLitres;
//   String? unitPrice;
//   String? petrolStationImage;
//   String? petrolStation;
//   String? createdAt;
//   String? updatedAt;

//   AddOnDiesel(
//       {this.id,
//       this.tripId,
//       this.driverId,
//       this.quantityInLitres,
//       this.unitPrice,
//       this.petrolStationImage,
//       this.petrolStation,
//       this.createdAt,
//       this.updatedAt});

//   AddOnDiesel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tripId = json['trip_id'];
//     driverId = json['driver_id'];
//     quantityInLitres = json['quantity_in_litres'];
//     unitPrice = json['unit_price'];
//     petrolStationImage = json['petrol_station_image'];
//     petrolStation = json['petrol_station'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['trip_id'] = this.tripId;
//     data['driver_id'] = this.driverId;
//     data['quantity_in_litres'] = this.quantityInLitres;
//     data['unit_price'] = this.unitPrice;
//     data['petrol_station_image'] = this.petrolStationImage;
//     data['petrol_station'] = this.petrolStation;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class EnrouteDiesel {
//   String? id;
//   String? tripId;
//   String? driverId;
//   String? quantity;
//   String? unitPrice;
//   String? petrolStationImage;
//   String? petrolStation;
//   String? createdAt;
//   String? updatedAt;

//   EnrouteDiesel(
//       {this.id,
//       this.tripId,
//       this.driverId,
//       this.quantity,
//       this.unitPrice,
//       this.petrolStationImage,
//       this.petrolStation,
//       this.createdAt,
//       this.updatedAt});

//   EnrouteDiesel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tripId = json['trip_id'];
//     driverId = json['driver_id'];
//     quantity = json['quantity'];
//     unitPrice = json['unit_price'];
//     petrolStationImage = json['petrol_station_image'];
//     petrolStation = json['petrol_station'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['trip_id'] = this.tripId;
//     data['driver_id'] = this.driverId;
//     data['quantity'] = this.quantity;
//     data['unit_price'] = this.unitPrice;
//     data['petrol_station_image'] = this.petrolStationImage;
//     data['petrol_station'] = this.petrolStation;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Repairs {
//   String? id;
//   String? tripId;
//   String? driverId;
//   String? shopName;
//   String? repairName;
//   String? repairCost;
//   String? spareName;
//   String? spareCost;
//   String? totalAmount;
//   String? uploadBill;
//   Null? deletedAt;
//   String? createdAt;
//   String? updatedAt;

//   Repairs(
//       {this.id,
//       this.tripId,
//       this.driverId,
//       this.shopName,
//       this.repairName,
//       this.repairCost,
//       this.spareName,
//       this.spareCost,
//       this.totalAmount,
//       this.uploadBill,
//       this.deletedAt,
//       this.createdAt,
//       this.updatedAt});

//   Repairs.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tripId = json['trip_id'];
//     driverId = json['driver_id'];
//     shopName = json['shop_name'];
//     repairName = json['repair_name'];
//     repairCost = json['repair_cost'];
//     spareName = json['spare_name'];
//     spareCost = json['spare_cost'];
//     totalAmount = json['total_amount'];
//     uploadBill = json['upload_bill'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['trip_id'] = this.tripId;
//     data['driver_id'] = this.driverId;
//     data['shop_name'] = this.shopName;
//     data['repair_name'] = this.repairName;
//     data['repair_cost'] = this.repairCost;
//     data['spare_name'] = this.spareName;
//     data['spare_cost'] = this.spareCost;
//     data['total_amount'] = this.totalAmount;
//     data['upload_bill'] = this.uploadBill;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Tolls {
//   String? id;
//   String? tripId;
//   String? driverId;
//   String? tollName;
//   String? amount;
//   String? tollImage;
//   Null? deletedAt;
//   String? createdAt;
//   String? updatedAt;

//   Tolls(
//       {this.id,
//       this.tripId,
//       this.driverId,
//       this.tollName,
//       this.amount,
//       this.tollImage,
//       this.deletedAt,
//       this.createdAt,
//       this.updatedAt});

//   Tolls.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     tripId = json['trip_id'];
//     driverId = json['driver_id'];
//     tollName = json['toll_name'];
//     amount = json['amount'];
//     tollImage = json['toll_image'];
//     deletedAt = json['deleted_at'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['trip_id'] = this.tripId;
//     data['driver_id'] = this.driverId;
//     data['toll_name'] = this.tollName;
//     data['amount'] = this.amount;
//     data['toll_image'] = this.tollImage;
//     data['deleted_at'] = this.deletedAt;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
