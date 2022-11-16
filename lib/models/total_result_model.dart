import 'package:json_annotation/json_annotation.dart';

import 'base_api_reponse_model.dart';
import 'item_model.dart';

part 'total_result_model.g.dart';

@JsonSerializable()
class TotalResult extends BaseApiResponseModel<TotalResult> {
  int? totalCount;
  bool? incompleteResults;
  List<ItemModel>? items;
  TotalResult({this.totalCount, this.incompleteResults, this.items});

  factory TotalResult.fromJson(Map<String, dynamic> json) =>
      _$TotalResultFromJson(json);
  Map<String, dynamic> toJson() => _$TotalResultToJson(this);

  @override
  TotalResult fromJson(Map<String, dynamic> json) {
    return TotalResult.fromJson(json);
  }
}
