
import 'dart:convert';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

void pickerCountryCode({
  required BuildContext context,
  required void Function(Country) onSelect,
}) => 
    showCountryPicker(
      context: context,
      showPhoneCode: true,
       onSelect: onSelect);

class PickCountryCode {
  final String phoneCode;
  final String flagEmoji;
  
  PickCountryCode({
    required this.phoneCode,
     required this.flagEmoji
     });

  PickCountryCode copyWith({
    String? phoneCode,
    String? flagEmoji
  }){
    return PickCountryCode(
      phoneCode: phoneCode ?? this.phoneCode,
      flagEmoji: flagEmoji ?? this.flagEmoji
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneCode': phoneCode,
      'flagEmoji': flagEmoji, 
    };
  }

  factory PickCountryCode.fromMap(Map<String, dynamic> map){
    return PickCountryCode(
      phoneCode: map['phoneCode'] as String,
      flagEmoji: map['flagEmoji'] as String
      );
  }

  String toJson() => json.encode(toMap());

}