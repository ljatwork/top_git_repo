import 'package:json_annotation/json_annotation.dart';

import 'base_api_reponse_model.dart';

part 'owner_model.g.dart';

@JsonSerializable()
class OwnerModel extends BaseApiResponseModel<OwnerModel> {
  String login;
  int? id;
  @JsonKey(name: "node_id")
  String? nodeId;
  @JsonKey(name: "avatar_url")
  String avatarUrl;
  String url;
  @JsonKey(name: "html_url")
  String? htmlUrl;
  OwnerModel(
      {required this.login,
      this.id,
      this.nodeId,
      required this.avatarUrl,
      required this.url,
      this.htmlUrl,});

  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);

  @override
  OwnerModel fromJson(Map<String, dynamic> json) {
    return OwnerModel.fromJson(json);
  }
}
