// To parse this JSON data, do
//
//     final mfuwalletModel = mfuwalletModelFromJson(jsonString);

import 'dart:convert';

List<MfuwalletModel> mfuwalletModelFromJson(String str) =>
    List<MfuwalletModel>.from(
        json.decode(str).map((x) => MfuwalletModel.fromJson(x)));

String mfuwalletModelToJson(List<MfuwalletModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MfuwalletModel {
  MfuwalletModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.amount,
  });

  int id;
  String email;
  String username;
  String password;
  String amount;

  factory MfuwalletModel.fromJson(Map<String, dynamic> json) => MfuwalletModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "amount": amount,
      };
}
