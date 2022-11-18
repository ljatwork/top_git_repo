import 'package:floor/floor.dart';

import '../../../models/item_model.dart';


@entity
class RepositoryEntity {
  @PrimaryKey(autoGenerate: false)
  final String id;
  final int page;
  final ItemModel repository;

  const RepositoryEntity({required this.id, required this.page, required this.repository});

}