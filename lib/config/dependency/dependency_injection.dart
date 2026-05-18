import 'package:get_it/get_it.dart';
import 'package:multi_app/features/cocktail/domain/usecases/usescases.dart';

import 'package:multi_app/features/cocktail/infrastructure/clients/api_client.dart';
import 'package:multi_app/features/cocktail/infrastructure/datasource_impl/cocktail_datasource_impl.dart';
import 'package:multi_app/features/cocktail/infrastructure/repository_impl/cocktail_repository_impl.dart';
import 'package:multi_app/features/cocktail/domain/datasource/cocktail_datasource.dart';
import 'package:multi_app/features/cocktail/domain/repository/cocktail_repository.dart';
import 'package:multi_app/features/cocktail/presentation/blocs/blocs.dart';
import 'package:multi_app/features/perks/domain/datasource/perks_datasource.dart';
import 'package:multi_app/features/perks/domain/repositories/perks_repository.dart';
import 'package:multi_app/features/perks/domain/usecases/get_perks_usecase.dart';
import 'package:multi_app/features/perks/infrastructure/datasource_impl/perks_datasource_impl.dart';
import 'package:multi_app/features/perks/infrastructure/repository_impl/perks_repository_impl.dart';
import 'package:multi_app/features/perks/presentation/bloc/perks_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // Cocktail
  // Dio
  getIt.registerLazySingleton(() => ApiClient.cocktailApi);

  // Datasource
  getIt.registerLazySingleton<CocktailDatasource>(
    () => CocktailDatasourceImpl(),
  );

  // repository
  getIt.registerLazySingleton<CocktailRepository>(
    () => CocktailRepositoryImpl(cocktailDatasource: getIt()),
  );

  //Usecases
  getIt.registerLazySingleton<GetCategoriesUsecase>(
    () => GetCategoriesUsecase(cocktailRepository: getIt()),
  );
  getIt.registerLazySingleton<GetDrinksUsecase>(
    () => GetDrinksUsecase(cocktailRepository: getIt()),
  );
  getIt.registerLazySingleton<GetDrinkUsecase>(
    () => GetDrinkUsecase(cocktailRepository: getIt()),
  );
  // Blocs
  getIt.registerFactory(
    () => CocktailBloc(
      getCategoriesUsecase: getIt(),
      getDrinksUsecase: getIt(),
      getDrinkUsecase: getIt(),
    ),
  );

  // Perks
  getIt.registerLazySingleton<PerksDatasource>(() => PerksDatasourceImpl());
  // Repository
  getIt.registerLazySingleton<PerksRepository>(
    () => PerksRepositoryImpl(perksDatasource: getIt()),
  );

  // usecase
  getIt.registerLazySingleton<GetPerksUsecase>(
    () => GetPerksUsecase(perksRepository: getIt()),
  );
  getIt.registerFactory(() => PerksBloc(getPerksUsecase: getIt()));
}
