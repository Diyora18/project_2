import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/data/repositories/user_repository.dart';
import 'package:project_2/feature/my_detail/managers/user_event.dart';
import 'package:project_2/feature/my_detail/managers/user_state.dart';

import '../../../core/result.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc({required UserRepository userRepository})
    : _userRepository = userRepository,
      super(UserState.initial()) {
    on<LoadUser>(_onLoadUser);
    on<UpdateUser>(_onUpdatedUser);
    add(LoadUser());
  }

  Future<void> _onLoadUser(
    LoadUser event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _userRepository.getMe();

    result.fold(
      (error) {
        Result.error(error);
        emit(state.copyWith(loading: false, errorMessage: error.toString()));
      },
      (data) {
        Result.ok(
          emit(state.copyWith(loading: false, errorMessage: null, user: data)),
        );
      },
    );
  }

  Future<void> _onUpdatedUser(UpdateUser event, Emitter<UserState> emit) async {
    emit(state.copyWith(loading: true, errorMessage: null));
    final result = await _userRepository.getUser(event.user);
    result.fold(
      (error) {
        Result.error(error);
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
      (data) {
        Result.ok(
          emit(state.copyWith(loading: false, errorMessage: null, user: data)),
        );
      },
    );
  }
}
