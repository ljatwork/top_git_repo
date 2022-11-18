
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../models/item_model.dart';
import '../converters/repository_converter.dart';
import '../daos/repository_dao.dart';
import '../entities/repository_entity.dart';

part 'app_db.g.dart';

@TypeConverters([RepositoryConverter])
@Database(version: 1, entities: [RepositoryEntity])
abstract class AppDatabase extends FloorDatabase {
  RepositoryDao get repositoryDao;
}