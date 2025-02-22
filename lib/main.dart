import 'package:capricon_flutter_task/constant/routes_constant.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/providers/login_state_provider.dart';
import 'package:capricon_flutter_task/screens/login_screen.dart';
import 'package:capricon_flutter_task/screens/stock_detail_screen.dart';
import 'package:capricon_flutter_task/screens/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen to the login state
    final isLoggedIn = ref.watch(loginStateProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appTitle,
      // Show a loading screen while the login status is being fetched
      home:
          // ignore: unnecessary_null_comparison
          isLoggedIn == null
              ? const Scaffold(body: Center(child: CircularProgressIndicator()))
              : isLoggedIn
              ? const StockScreen()
              : const LoginScreen(),
      onGenerateRoute: _onGenerateRoute,
    );
  }

  // Route generation based on the route name
  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return _buildRoute(const LoginScreen());
      case Routes.stock:
        return _buildRoute(const StockScreen());
      case Routes.stockDetail:
        final int stockId = settings.arguments as int;
        return _buildRoute(StockDetailScreen(stockId: stockId));
      default:
        return null;
    }
  }

  // Helper method to create MaterialPageRoute for a given screen
  MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }
}
