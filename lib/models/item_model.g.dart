// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as int?,
      nodeId: json['node_id'] as String?,
      name: json['name'] as String?,
      fullName: json['full_name'] as String?,
      private: json['private'] as bool?,
      owner: json['owner'] == null
          ? null
          : OwnerModel.fromJson(json['owner'] as Map<String, dynamic>),
      htmlUrl: json['html_url'] as String?,
      description: json['description'] as String?,
      fork: json['fork'] as bool?,
      url: json['url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      pushedAt: json['pushed_at'] as String?,
      gitUrl: json['git_url'] as String?,
      sshUrl: json['ssh_url'] as String?,
      cloneUrl: json['clone_url'] as String?,
      homepage: json['home_page'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      stargazersCount: json['stargazers_count'] as int?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'full_name': instance.fullName,
      'private': instance.private,
      'owner': instance.owner,
      'html_url': instance.htmlUrl,
      'description': instance.description,
      'fork': instance.fork,
      'url': instance.url,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pushed_at': instance.pushedAt,
      'git_url': instance.gitUrl,
      'ssh_url': instance.sshUrl,
      'clone_url': instance.cloneUrl,
      'home_page': instance.homepage,
      'score': instance.score,
      'stargazers_count': instance.stargazersCount,
    };
