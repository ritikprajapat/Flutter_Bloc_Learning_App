part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

class IndexEvent extends DashboardEvent {
  final int index;
  IndexEvent(this.index) : super();
}
