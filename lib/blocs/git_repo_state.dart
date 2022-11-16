part of 'git_repo_bloc.dart';

abstract class GitRepoState extends Equatable {
  const GitRepoState();

  @override
  List<Object?> get props => [];
}

class GitRepoInitial extends GitRepoState {}

class GitRepoLoading extends GitRepoState {}

class GitRepoLoaded extends GitRepoState {
  final List<ItemModel> items;
  const GitRepoLoaded(this.items);
}

class GitRepoError extends GitRepoState {
  final String? message;
  const GitRepoError(this.message);
}
