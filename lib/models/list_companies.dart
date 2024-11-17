// To parse this JSON data, do
//
//     final company = companyFromJson(jsonString);

import 'dart:convert';
import 'package:flutter_guide_2024/models/company_model.dart';

List<Company> companyFromJson(String str) =>
    List<Company>.from(json.decode(str).map((x) => Company.fromJson(x)));

String companyToJson(List<Company> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
