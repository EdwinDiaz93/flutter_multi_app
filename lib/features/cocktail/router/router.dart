import 'package:go_router/go_router.dart';
import 'package:multi_app/features/cocktail/presentation/screens/screens.dart';

final List<GoRoute> cocktailRoutes = [
  GoRoute(
    path: '/cocktail-categories',
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/cocktail-categories/:category',
    builder: (context, state) =>
        DrinklistScreen(category: state.pathParameters['category']!),
  ),
];
