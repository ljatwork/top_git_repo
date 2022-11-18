import 'dart:convert';
import 'package:floor/floor.dart';

import '../../../models/item_model.dart';

class RepositoryConverter extends TypeConverter<ItemModel, String> {
  @override
  ItemModel decode(String databaseValue) {
    final map = json.decode(databaseValue);
    return ItemModel.fromJson(map);
  }

  @override
  String encode(ItemModel value) {
    return json.encode(value);
  }
}