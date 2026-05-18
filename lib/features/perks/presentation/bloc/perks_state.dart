part of 'perks_bloc.dart';

sealed class PerksState extends Equatable {
  const PerksState();

  @override
  List<Object> get props => [];
}

final class PerksInitial extends PerksState {}

final class LoadingPerks extends PerksState {}

final class LoadedPerks extends PerksState {
  final Perks perk;

  const LoadedPerks({required this.perk});
}

final class PerkErros extends PerksState {
  final String message;

  const PerkErros({required this.message});
}
