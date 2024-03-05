class Statusresponse {
  bool? status;
  int? statusCode;
  String? message;
  Data? data;

  Statusresponse({this.status, this.statusCode, this.message, this.data});

  Statusresponse.fromJson(Map<String, dynamic> json) {
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
      this.weightOfCargo,
      this.initialDiesel,
      this.mileageAllowanceCurrency,
      this.mileageAllowance,
      this.movementSheetCurrency,
      this.movementSheet,
      this.roadTollCurrency,
      this.roadToll,
      this.status,
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
    weightOfCargo = json['weight_of_cargo'];
    initialDiesel = json['initial_diesel'];
    mileageAllowanceCurrency = json['mileage_allowance_currency'];
    mileageAllowance = json['mileage_allowance'];
    movementSheetCurrency = json['movement_sheet_currency'];
    movementSheet = json['movement_sheet'];
    roadTollCurrency = json['road_toll_currency'];
    roadToll = json['road_toll'];
    status = json['status'];
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
    data['weight_of_cargo'] = weightOfCargo;
    data['initial_diesel'] = initialDiesel;
    data['mileage_allowance_currency'] = mileageAllowanceCurrency;
    data['mileage_allowance'] = mileageAllowance;
    data['movement_sheet_currency'] = movementSheetCurrency;
    data['movement_sheet'] = movementSheet;
    data['road_toll_currency'] = roadTollCurrency;
    data['road_toll'] = roadToll;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
