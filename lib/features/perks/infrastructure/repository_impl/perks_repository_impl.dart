import 'package:multi_app/features/perks/domain/datasource/perks_datasource.dart';
import 'package:multi_app/features/perks/domain/entities/perks.dart';
import 'package:multi_app/features/perks/domain/repositories/perks_repository.dart';

class PerksRepositoryImpl extends PerksRepository {
  final PerksDatasource perksDatasource;

  PerksRepositoryImpl({required this.perksDatasource});

  @override
  Future<Perks> getPerks(String salario, String workedTime) {
    return perksDatasource.getPerks(salario, workedTime);
  }
}
