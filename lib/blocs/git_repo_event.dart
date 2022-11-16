part of 'git_repo_bloc.dart';

abstract class GitRepoEvent extends Equatable {
  const GitRepoEvent();

  @override
  List<Object> get props => [];
}

class OnFetch extends GitRepoEvent {
  const OnFetch();
}
