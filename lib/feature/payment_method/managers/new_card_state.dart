import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_2/data/models/new_card_model.dart';
import 'package:project_2/feature/notification/managers/notification_state.dart';

import '../../../data/models/payment_model.dart';


part 'new_card_state.freezed.dart';

@freezed
abstract class CardState with _$CardState {
  const factory CardState({
    String? errorMessage,
    bool? loading,
    List<CardModel>? card,
    int? selectedId,
  })=_CardState;

  factory CardState.initial()=>
      CardState(errorMessage: null, loading: true, card:[]);

}