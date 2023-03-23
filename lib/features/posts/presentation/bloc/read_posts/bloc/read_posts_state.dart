part of 'read_posts_bloc.dart';

abstract class ReadPostsState extends Equatable {
  const ReadPostsState();

  @override
  List<Object> get props => [];
}

class ReadPostsInitial extends ReadPostsState {}

class LoadingPostsState extends ReadPostsState {}

class LoadedPostsState extends ReadPostsState {
  final List<Post> posts;

  const LoadedPostsState({required this.posts});

  @override
  List<Object> get props => [posts];
}

class ErrorPostsState extends ReadPostsState {
  final String message;

  const ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}
