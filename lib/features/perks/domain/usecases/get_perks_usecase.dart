import 'package:multi_app/features/perks/domain/entities/entities.dart';
import 'package:multi_app/features/perks/domain/repositories/perks_repository.dart';

class GetPerksUsecase {
  final PerksRepository perksRepository;

  GetPerksUsecase({required this.perksRepository});

  Future<Perks> call(Salary salary) async {
    final perk = await perksRepository.getPerks(
      salary.salary,
      salary.workedTime,
    );
    return perk;
  }
}
