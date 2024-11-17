// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_guide_2024/models/foto_model.dart';

List<Photos> photosFromJson(String str) =>
    List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
