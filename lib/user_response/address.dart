import 'package:json_annotation/json_annotation.dart';

import 'geo.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  @JsonKey(name: 'street')
  String? street;
  @JsonKey(name: 'suite')
  String? suite;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'zipcode')
  String? zipcode;
  @JsonKey(name: 'geo')
  Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return _$AddressFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
