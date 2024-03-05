// To parse this JSON data, do
//
//     final notificationDataModel = notificationDataModelFromJson(jsonString);

import 'dart:convert';

NotificationDataModel notificationDataModelFromJson(String str) =>
    NotificationDataModel.fromJson(json.decode(str));

String notificationDataModelToJson(NotificationDataModel data) =>
    json.encode(data.toJson());

class NotificationDataModel {
  String? cityName;
  String? name;
  String? screen;
  String? clickAction;
  String? propertyId;
  String? cityId;

  NotificationDataModel({
    this.cityName,
    this.name,
    this.screen,
    this.clickAction,
    this.propertyId,
    this.cityId,
  });

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      NotificationDataModel(
        cityName: json["city_name"],
        name: json["name"],
        screen: json["screen"],
        clickAction: json["click_action "],
        propertyId: json["property_id"],
        cityId: json["city_id"],
      );

  Map<String, dynamic> toJson() => {
        "city_name": cityName,
        "name": name,
        "screen": screen,
        "click_action ": clickAction,
        "property_id": propertyId,
        "city_id": cityId,
      };
}
