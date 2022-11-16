import 'package:json_annotation/json_annotation.dart';

import 'base_api_reponse_model.dart';

part 'owner_model.g.dart';

@JsonSerializable()
class OwnerModel extends BaseApiResponseModel<OwnerModel> {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  OwnerModel(
      {this.login,
      this.id,
      this.nodeId,
      this.avatarUrl,
      this.gravatarId,
      this.url,
      this.htmlUrl,
      this.followersUrl,
      this.followingUrl,
      this.gistsUrl,
      this.starredUrl,
      this.subscriptionsUrl,
      this.organizationsUrl,
      this.reposUrl,
      this.eventsUrl,
      this.receivedEventsUrl,
      this.type,
      this.siteAdmin});

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);

  @override
  OwnerModel fromJson(Map<String, dynamic> json) {
    return OwnerModel.fromJson(json);
  }
}
