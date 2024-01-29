import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<CardDots>((event, emit) {
      emit(state.copyWith(cardIndex: event.cardIndex));
    });
  }
}
