// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Timeline _$$_TimelineFromJson(Map<String, dynamic> json) => _$_Timeline(
      id: json['id'] as String,
      address: json['address'] as String,
      message: json['message'] as String,
      favorites: json['favorites'] as int? ?? 0,
      postedAt: json['postedAt'] as int,
    );

Map<String, dynamic> _$$_TimelineToJson(_$_Timeline instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'message': instance.message,
      'favorites': instance.favorites,
      'postedAt': instance.postedAt,
    };
