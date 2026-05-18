import 'package:multi_app/features/perks/domain/datasource/perks_datasource.dart';
import 'package:multi_app/features/perks/domain/entities/perks.dart';

class PerksDatasourceImpl extends PerksDatasource {
  @override
  Future<Perks> getPerks(String salario) async {
    return Perks(
      afp: '',
      afpPatronal: '',
      isss: '',
      isssPatronal: '',
      renta: '',
      descuentosTotales: '',
      vacaciones: '',
      aguinaldo: '',
      salarioLiquido: '',
    );
  }
}
