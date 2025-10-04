import 'package:project_2/data/models/new_card_model.dart';
import 'package:project_2/data/models/payment_model.dart';
import 'package:project_2/feature/cart/managers/cart_event.dart';

sealed class CardEvent {}

final class CardListEvent extends CardEvent{}

final class AddCardEvent extends CardEvent {
  final NewCardModel data;

  AddCardEvent(this.data);
}


final class SelectedCardEvent extends CardEvent {
  final int id;

  SelectedCardEvent({required this.id});

}
