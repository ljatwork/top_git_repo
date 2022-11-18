import 'package:json_annotation/json_annotation.dart';

import 'base_api_reponse_model.dart';
import 'owner_model.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends BaseApiResponseModel<ItemModel> {
  int id;
  String name;
  @JsonKey(name: "full_name")
  String fullName;
  bool? private;
  OwnerModel owner;
  @JsonKey(name: "html_url")
  String htmlUrl;
  String? description;
  String url;
  @JsonKey(name: "git_url")
  String gitUrl;
  @JsonKey(name: "stargazers_count")
  int stargazersCount;

  ItemModel(
      {required this.id,
      required this.name,
      required this.fullName,
      this.private,
      required this.owner,
      required this.htmlUrl,
      this.description,
      required this.url,
      required this.gitUrl,
      required this.stargazersCount});

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  ItemModel fromJson(Map<String, dynamic> json) {
    return ItemModel.fromJson(json);
  }
}
