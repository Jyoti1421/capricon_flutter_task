import 'package:capricon_flutter_task/constant/routes_constant.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/screens/login_screen.dart';
import 'package:capricon_flutter_task/screens/stock_detail_screen.dart';
import 'package:capricon_flutter_task/screens/stock_screen.dart';
import 'package:capricon_flutter_task/utils/shared_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await SharedPrefsHelper.isLoggedIn;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstants.appTitle,
        initialRoute: _getInitialRoute(),
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  // Method to determine the initial route based on login status
  String _getInitialRoute() {
    return isLoggedIn ? Routes.stock : Routes.login;
  }

  // Method to handle route generation based on route name and arguments
  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return _buildRoute(const LoginScreen());
      case Routes.stock:
        return _buildRoute(const StockScreen());
      case Routes.stockDetail:
        final int stockId =
            settings.arguments as int; // Get stockId from arguments
        return _buildRoute(StockDetailScreen(stockId: stockId));
      default:
        return null; // Handle unknown routes
    }
  }

  // Helper method to create MaterialPageRoute for a given screen
  MaterialPageRoute _buildRoute(Widget screen) {
    return MaterialPageRoute(builder: (context) => screen);
  }
}
