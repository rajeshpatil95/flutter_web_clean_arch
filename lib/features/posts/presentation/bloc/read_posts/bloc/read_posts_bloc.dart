import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../core/error/failures.dart';
import '../../../../../../core/strings/failures.dart';
import '../../../../domain/entities/post.dart';
import '../../../../domain/usecases/get_all_posts.dart';

part 'read_posts_event.dart';
part 'read_posts_state.dart';

class ReadPostsBloc extends Bloc<ReadPostsEvent, ReadPostsState> {
  final GetAllPostsUsecase getAllPosts;

  ReadPostsBloc({required this.getAllPosts}) : super(ReadPostsInitial()) {
    on<ReadPostsEvent>((event, emit) async {
      if (event is GetAllPostsEvent) {
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPosts();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      } else if (event is RefreshPostsEvent) {
        emit(LoadingPostsState());

        final failureOrPosts = await getAllPosts();
        emit(_mapFailureOrPostsToState(failureOrPosts));
      }
    });
  }
}

ReadPostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
  return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
      (posts) {
    return LoadedPostsState(
      posts: posts,
    );
  });
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    default:
      return "Unexpected Error , Please try again later .";
  }
}
