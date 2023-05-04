import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
import 'company.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {


  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'username')
  String? username;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'address')
  Address? address;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'website')
  String? website;

  @JsonKey(name: 'company')
  Company? company;

  UserResponse({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  //called when data is taken from json
  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }
  //called when data is kept to json
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
