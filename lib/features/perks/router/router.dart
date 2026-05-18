import 'package:go_router/go_router.dart';
import 'package:multi_app/features/perks/presentation/screens/perks_screen.dart';

final List<GoRoute> perksRoutes = [
  GoRoute(path: '/perks', builder: (context, state) => PerksScreen()),
];
