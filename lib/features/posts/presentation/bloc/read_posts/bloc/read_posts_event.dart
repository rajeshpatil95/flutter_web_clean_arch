part of 'read_posts_bloc.dart';

abstract class ReadPostsEvent extends Equatable {
  const ReadPostsEvent();

  @override
  List<Object> get props => [];
}

class GetAllPostsEvent extends ReadPostsEvent {}

class RefreshPostsEvent extends ReadPostsEvent {}
