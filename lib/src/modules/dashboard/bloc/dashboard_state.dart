part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {
  final int index;
  DashboardInitial({
    this.index = 0,
  });
}
