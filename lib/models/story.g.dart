// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      json['pricaId'] as int?,
      json['naslov'] as String?,
      json['opis'] as String?,
      json['novcaniCilj'] as int?,
      json['aktivna'] as bool?,
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'pricaId': instance.pricaId,
      'naslov': instance.naslov,
      'opis': instance.opis,
      'novcaniCilj': instance.novcaniCilj,
      'aktivna': instance.aktivna,
    };
