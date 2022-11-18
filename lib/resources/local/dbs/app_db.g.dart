// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RepositoryDao? _repositoryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `RepositoryEntity` (`id` TEXT NOT NULL, `page` INTEGER NOT NULL, `repository` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RepositoryDao get repositoryDao {
    return _repositoryDaoInstance ??= _$RepositoryDao(database, changeListener);
  }
}

class _$RepositoryDao extends RepositoryDao {
  _$RepositoryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _repositoryEntityInsertionAdapter = InsertionAdapter(
            database,
            'RepositoryEntity',
            (RepositoryEntity item) => <String, Object?>{
                  'id': item.id,
                  'page': item.page,
                  'repository': _repositoryConverter.encode(item.repository)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RepositoryEntity> _repositoryEntityInsertionAdapter;

  @override
  Future<List<RepositoryEntity>> findAllRepository() async {
    return _queryAdapter.queryList('SELECT * FROM RepositoryEntity',
        mapper: (Map<String, Object?> row) => RepositoryEntity(
            id: row['id'] as String,
            page: row['page'] as int,
            repository:
                _repositoryConverter.decode(row['repository'] as String)));
  }

  @override
  Future<RepositoryEntity?> findRepositoryById(int id) async {
    return _queryAdapter.query('SELECT * FROM RepositoryEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RepositoryEntity(
            id: row['id'] as String,
            page: row['page'] as int,
            repository:
                _repositoryConverter.decode(row['repository'] as String)),
        arguments: [id]);
  }

  @override
  Future<List<RepositoryEntity>?> findRepositoryByPage(int page) async {
    return _queryAdapter.queryList(
        'SELECT * FROM RepositoryEntity WHERE page = ?1',
        mapper: (Map<String, Object?> row) => RepositoryEntity(
            id: row['id'] as String,
            page: row['page'] as int,
            repository:
                _repositoryConverter.decode(row['repository'] as String)),
        arguments: [page]);
  }

  @override
  Future<List<RepositoryEntity>?> removeRepositoryByPage(int page) async {
    return _queryAdapter.queryList(
        'DELETE FROM RepositoryEntity WHERE page = ?1',
        mapper: (Map<String, Object?> row) => RepositoryEntity(
            id: row['id'] as String,
            page: row['page'] as int,
            repository:
                _repositoryConverter.decode(row['repository'] as String)),
        arguments: [page]);
  }

  @override
  Future<List<RepositoryEntity>?> removeAllRepositories() async {
    return _queryAdapter.queryList('DELETE FROM RepositoryEntity',
        mapper: (Map<String, Object?> row) => RepositoryEntity(
            id: row['id'] as String,
            page: row['page'] as int,
            repository:
                _repositoryConverter.decode(row['repository'] as String)));
  }

  @override
  Future<void> insertRepository(RepositoryEntity passenger) async {
    await _repositoryEntityInsertionAdapter.insert(
        passenger, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertRepositories(List<RepositoryEntity> passengers) async {
    await _repositoryEntityInsertionAdapter.insertList(
        passengers, OnConflictStrategy.replace);
  }

  @override
  Future<void> refreshRepositories(
    List<ItemModel> repositories,
    int page,
  ) async {
    if (database is sqflite.Transaction) {
      await super.refreshRepositories(repositories, page);
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.repositoryDao
            .refreshRepositories(repositories, page);
      });
    }
  }
}

// ignore_for_file: unused_element
final _repositoryConverter = RepositoryConverter();
