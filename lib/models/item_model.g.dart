// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      private: json['private'] as bool?,
      owner: OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      gitUrl: json['git_url'] as String,
      stargazersCount: json['stargazers_count'] as int,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'url': instance.url,
      'git_url': instance.gitUrl,
      'stargazers_count': instance.stargazersCount,
    };
