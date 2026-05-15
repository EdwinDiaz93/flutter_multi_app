import 'package:dio/dio.dart';

class ApiClient {
  static final Dio cocktailApi = Dio(
    BaseOptions(
      baseUrl: 'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list',
    ),
  );
}
