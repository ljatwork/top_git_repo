import 'package:floor/floor.dart';
import 'package:top_git/models/item_model.dart';

import '../entities/repository_entity.dart';

@dao
abstract class RepositoryDao {

  @Query('SELECT * FROM RepositoryEntity')
  Future<List<RepositoryEntity>> findAllRepository();


  @Query('SELECT * FROM RepositoryEntity WHERE id = :id')
  Future<RepositoryEntity?> findRepositoryById(int id);

  @Query('SELECT * FROM RepositoryEntity WHERE page = :page')
  Future<List<RepositoryEntity>?> findRepositoryByPage(int page);

  @Query('DELETE FROM RepositoryEntity WHERE page = :page')
  Future<List<RepositoryEntity>?> removeRepositoryByPage(int page);

  @Query('DELETE FROM RepositoryEntity')
  Future<List<RepositoryEntity>?> removeAllRepositories();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertRepository(RepositoryEntity passenger);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertRepositories(List<RepositoryEntity> passengers);

  @transaction
  Future<void> refreshRepositories(List<ItemModel> repositories, int page) async {
    await removeRepositoryByPage(page);
    final list = repositories.map((e) => mappingToEntity(e, page)).toList();
    await insertRepositories(list);
  }

  /// convert passenger model to entity
  RepositoryEntity mappingToEntity(ItemModel repository, int page) {
    return RepositoryEntity(id: repository.id.toString(), repository: repository, page: page);
  }
}