// To parse this JSON data, do
//
//     final people = peopleFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_guide_2024/models/people_model.dart';

List<People> peopleFromJson(String str) =>
    List<People>.from(json.decode(str).map((x) => People.fromJson(x)));

String peopleToJson(List<People> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
