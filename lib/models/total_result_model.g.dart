// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalResult _$TotalResultFromJson(Map<String, dynamic> json) => TotalResult(
      totalCount: json['totalCount'] as int?,
      incompleteResults: json['incompleteResults'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TotalResultToJson(TotalResult instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'incompleteResults': instance.incompleteResults,
      'items': instance.items,
    };
