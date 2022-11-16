import 'package:json_annotation/json_annotation.dart';

import 'base_api_reponse_model.dart';
import 'owner_model.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends BaseApiResponseModel<ItemModel> {
  int? id;
  @JsonKey(name: "node_id")
  String? nodeId;
  String? name;
  @JsonKey(name: "full_name")
  String? fullName;
  bool? private;
  OwnerModel? owner;
  @JsonKey(name: "html_url")
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "pushed_at")
  String? pushedAt;
  @JsonKey(name: "git_url")
  String? gitUrl;
  @JsonKey(name: "ssh_url")
  String? sshUrl;
  @JsonKey(name: "clone_url")
  String? cloneUrl;
  @JsonKey(name: "home_page")
  String? homepage;
  double? score;
  @JsonKey(name: "stargazers_count")
  int? stargazersCount;

  ItemModel(
      {this.id,
      this.nodeId,
      this.name,
      this.fullName,
      this.private,
      this.owner,
      this.htmlUrl,
      this.description,
      this.fork,
      this.url,
      this.createdAt,
      this.updatedAt,
      this.pushedAt,
      this.gitUrl,
      this.sshUrl,
      this.cloneUrl,
      this.homepage,
      this.score,
      this.stargazersCount});

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  ItemModel fromJson(Map<String, dynamic> json) {
    return ItemModel.fromJson(json);
  }
}
