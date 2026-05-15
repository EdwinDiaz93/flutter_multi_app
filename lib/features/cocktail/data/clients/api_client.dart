import 'package:dio/dio.dart';
import 'package:multi_app/config/constants/environments.dart';

class ApiClient {
  static final Dio cocktailApi = Dio(BaseOptions(baseUrl: cocktailApiUrl));
}
