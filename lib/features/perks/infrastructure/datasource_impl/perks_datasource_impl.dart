import 'package:multi_app/features/perks/domain/datasource/perks_datasource.dart';
import 'package:multi_app/features/perks/domain/entities/perks.dart';

class PerksDatasourceImpl extends PerksDatasource {
  @override
  Future<Perks> getPerks(String salary, String workedTime) async {
    return Perks(
      afp: '1500',
      afpPatronal: '1500',
      isss: '1500',
      isssPatronal: '1500',
      renta: '1500',
      descuentosTotales: '1500',
      vacaciones: '1500',
      aguinaldo: '1500',
      salarioLiquido: '1500',
    );
  }
}
