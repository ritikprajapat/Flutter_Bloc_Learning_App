part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class CardDots extends HomeEvent {
  final int cardIndex;
  CardDots({this.cardIndex = 0});
}
