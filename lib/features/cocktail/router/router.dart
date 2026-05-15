import 'package:go_router/go_router.dart';
import 'package:multi_app/features/cocktail/presentation/screens/home_screen.dart';

final List<GoRoute> cocktailRoutes = [
  GoRoute(
    path: '/cocktail-categories',
    builder: (context, state) => HomeScreen(),
  ),
];
