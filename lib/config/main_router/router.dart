import 'package:go_router/go_router.dart';
import 'package:multi_app/features/cocktail/router/router.dart';
import 'package:multi_app/features/home/presentation/screens/home_screen.dart';
import 'package:multi_app/features/perks/router/router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    // Cocktail routes
    ...cocktailRoutes,

    // Perks Routes
    ...perksRoutes,
  ],
);
