import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_app/features/perks/domain/entities/entities.dart';
import 'package:multi_app/features/perks/domain/usecases/usecases.dart';

part 'perks_event.dart';
part 'perks_state.dart';

class PerksBloc extends Bloc<PerksEvent, PerksState> {
  final GetPerksUsecase getPerksUsecase;

  PerksBloc({required this.getPerksUsecase}) : super(PerksInitial()) {
    on<LoadPerksEvent>(_loadPerks);
  }

  Future<void> _loadPerks(
    LoadPerksEvent event,
    Emitter<PerksState> emit,
  ) async {
    emit(LoadingPerks());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final perk = await getPerksUsecase(event.salary);
      emit(LoadedPerks(perk: perk));
    } catch (e) {
      emit(PerkErros(message: "Error loading perks"));
    }
  }
}
