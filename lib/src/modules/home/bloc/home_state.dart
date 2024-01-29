part of 'home_bloc.dart';

final class HomeState {
  final int cardIndex;
  HomeState({
    this.cardIndex = 0,
  });

  HomeState copyWith({int? cardIndex}) {
    return HomeState(cardIndex: cardIndex ?? this.cardIndex);
  }
}
