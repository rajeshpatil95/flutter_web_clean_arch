import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'create_update_delete_post_state.dart';

class CreateUpdateDeletePostCubit extends Cubit<CreateUpdateDeletePostState> {
  CreateUpdateDeletePostCubit() : super(CreateUpdateDeletePostInitial());
}
