import 'dart:async';

import 'package:animated_infinite_scroll_pagination/animated_infinite_scroll_pagination.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:top_git/models/item_model.dart';

import '../../../config/env.dart';
import '../../remote/api_provider.dart';
import '../daos/repository_dao.dart';
import '../dbs/app_db.dart';

class Repository {
  final _controller = StreamController<PaginationState<List<ItemModel>>>();
  final _appDatabase = GetIt.I.get<AppDatabase>();
  final ApiProvider _provider = ApiProvider(Dio(), baseUrl: Env.paginationApi);
  RepositoryDao get repositoryDao => _appDatabase.repositoryDao;

  Stream<PaginationState<List<ItemModel>>> get result async* {
    yield* _controller.stream;
  }

  Future<int> getRepositoryList(int page) async {
    String formattedDate = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1)));
    /// emit loading
    _controller.add(const PaginationLoading());

    /// get cached data
    final cachedData = await repositoryDao.findRepositoryByPage(page);
    if (cachedData?.isNotEmpty == true) {
      final paragraphs = cachedData!.map((e) => e.repository).toList();
      _controller.add(PaginationSuccess(paragraphs, cached: true));
    }
    try {
      final result = await _provider.getCurrentTop(
          "created:>$formattedDate", "stars", "desc", page);

      /// emit fetched data
      _controller.add(PaginationSuccess(result.data.items));
      repositoryDao.refreshRepositories(result.data.items ?? [], page);
      return result.data.totalCount ?? 0;
    } on DioError catch (e) {
      if (kDebugMode) {
        print("DioError occurred: $e");
      }
      _controller.add(const PaginationError());
      return 0;
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occurred: $error stackTrace: $stacktrace");
      }
      _controller.add(const PaginationError());
      return 0;
    }
  }
}
