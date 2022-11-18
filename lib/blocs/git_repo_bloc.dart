import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_git/models/item_model.dart';

import '../resources/remote/api_repository.dart';

part 'git_repo_event.dart';
part 'git_repo_state.dart';

class GitRepoBloc extends Bloc<GitRepoEvent, GitRepoState> {
  final ApiRepository _apiRepository = ApiRepository();

  GitRepoBloc() : super(GitRepoInitial()) {
    on<OnFetch>((event, emit) async {
      emit(GitRepoLoading());
      try {
        final result = await _apiRepository.getCurrentTop(1);
        emit(GitRepoLoaded(result.data.items ?? []));
      } on DioError catch (e) {
        emit(GitRepoError(e.message));
      } catch (error, stacktrace) {
        if (kDebugMode) {
          print("Exception occurred: $error stackTrace: $stacktrace");
        }
        emit(GitRepoError(error.toString()));
      }
    });
  }
}
