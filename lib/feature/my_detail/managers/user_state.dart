
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_2/data/models/user_model.dart';

part 'user_state.freezed.dart';

@freezed

abstract class UserState with _$UserState{
   factory UserState({
    String? errorMessage,
    bool? loading,
    UserModel? user
})=_UserState;

  factory UserState.initial()=>UserState(
    errorMessage: null,
    loading: true,
    user:null,
  );
}