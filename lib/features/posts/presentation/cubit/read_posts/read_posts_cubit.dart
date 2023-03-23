import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'read_posts_states.dart';

class ReadPostsCubit extends Cubit<ReadPostsState> {
  ReadPostsCubit() : super(ReadPostsStateInitial());
}
