import 'package:get_it/get_it.dart';
import 'package:multi_app/features/cocktail/infrastructure/clients/api_client.dart';
import 'package:multi_app/features/cocktail/infrastructure/datasource_impl/cocktail_datasource_impl.dart';
import 'package:multi_app/features/cocktail/infrastructure/repository_impl/cocktail_repository_impl.dart';
import 'package:multi_app/features/cocktail/domain/datasource/cocktail_datasource.dart';
import 'package:multi_app/features/cocktail/domain/repository/cocktail_repository.dart';
import 'package:multi_app/features/cocktail/domain/usecases/get_categories_usecase.dart';
import 'package:multi_app/features/cocktail/presentation/blocs/blocs.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
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
  // Blocs
  getIt.registerFactory(() => CocktailBloc(getCategoriesUsecase: getIt()));
}
