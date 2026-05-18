part of 'perks_bloc.dart';

sealed class PerksEvent extends Equatable {
  const PerksEvent();

  @override
  List<Object> get props => [];
}

class LoadPerksEvent extends PerksEvent {
  final Salary salary;

  const LoadPerksEvent({required this.salary});
}
