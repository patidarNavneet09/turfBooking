class MyTrip {
  bool? status;
  int? statusCode;
  String? message;
  List<Data>? data;

  MyTrip({this.status, this.statusCode, this.message, this.data});

  MyTrip.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['status_code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['status_code'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? truck;
  String? driver;
  String? weightOfCargo;
  String? initialDiesel;
  String? mileageAllowanceCurrency;
  String? mileageAllowance;
  String? movementSheetCurrency;
  String? movementSheet;
  String? roadTollCurrency;
  String? roadToll;
  String? status;
  String? isstatus;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.loadingLocation,
      this.offloadingLocation,
      this.startDate,
      this.endDate,
      this.revenue,
      this.typeOfCargo,
      this.truck,
      this.driver,
      this.weightOfCargo,
      this.initialDiesel,
      this.mileageAllowanceCurrency,
      this.mileageAllowance,
      this.movementSheetCurrency,
      this.movementSheet,
      this.roadTollCurrency,
      this.roadToll,
      this.status,
      this.isstatus,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    loadingLocation = json['loading_location'];
    offloadingLocation = json['offloading_location'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    revenue = json['revenue'];
    typeOfCargo = json['type_of_cargo'];
    truck = json['truck'];
    driver = json['driver'];
    weightOfCargo = json['weight_of_cargo'];
    initialDiesel = json['initial_diesel'];
    mileageAllowanceCurrency = json['mileage_allowance_currency'];
    mileageAllowance = json['mileage_allowance'];
    movementSheetCurrency = json['movement_sheet_currency'];
    movementSheet = json['movement_sheet'];
    roadTollCurrency = json['road_toll_currency'];
    roadToll = json['road_toll'];
    status = json['status'];
    isstatus = json['is_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['truck'] = truck;
    data['driver'] = driver;
    data['weight_of_cargo'] = weightOfCargo;
    data['initial_diesel'] = initialDiesel;
    data['mileage_allowance_currency'] = mileageAllowanceCurrency;
    data['mileage_allowance'] = mileageAllowance;
    data['movement_sheet_currency'] = movementSheetCurrency;
    data['movement_sheet'] = movementSheet;
    data['road_toll_currency'] = roadTollCurrency;
    data['road_toll'] = roadToll;
    data['status'] = status;
    data['is_status'] = isstatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
