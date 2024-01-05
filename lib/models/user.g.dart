// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['korisnikId'] as int?,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['korisnickoIme'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'korisnikId': instance.korisnikId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'korisnickoIme': instance.korisnickoIme,
    };
