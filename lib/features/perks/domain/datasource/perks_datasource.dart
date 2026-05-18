import 'package:multi_app/features/perks/domain/entities/entities.dart';

abstract class PerksDatasource {
  Future<Perks> getPerks(String salario);
}
