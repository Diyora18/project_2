import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_2/data/models/new_card_model.dart';

import '../../../data/repositories/card_repository.dart';
import 'new_card_event.dart';
import 'new_card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final CardRepository _cardRepository;

  CardBloc({required CardRepository cardRepository})
      : _cardRepository = cardRepository,
        super(CardState.initial()) {
    on<CardListEvent>(_onLoadCards);
    on<AddCardEvent>(_onAddCard);
    on<SelectedCardEvent>(_onSelectCard);
    add(CardListEvent());
  }


  Future<void> _onLoadCards(
      CardListEvent event,
      Emitter<CardState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _cardRepository.getCards();

    result.fold(
          (error) {
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
          (cards) {
        emit(state.copyWith(
          card: cards,
          loading: false,
          selectedId: cards.isNotEmpty ? cards.first.id : null,
        ));
      },
    );
  }

  Future<void> _onAddCard(
      AddCardEvent event,
      Emitter<CardState> emit,
      ) async {
    emit(state.copyWith(loading: true, errorMessage: null));

    final result = await _cardRepository.addCard(event.data);

    result.fold(
          (error) {
        emit(state.copyWith(errorMessage: error.toString(), loading: false));
      },
          (_) {
        add(CardListEvent());
      },
    );
  }

  void _onSelectCard(
      SelectedCardEvent event,
      Emitter<CardState> emit,
      ) {
    emit(state.copyWith(selectedId: event.id));
  }
}
