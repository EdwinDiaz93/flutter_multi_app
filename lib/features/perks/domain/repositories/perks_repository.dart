import 'package:multi_app/features/perks/domain/entities/entities.dart';

abstract class PerksRepository {
  Future<Perks> getPerks(String salario);
}
