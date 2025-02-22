import 'package:capricon_flutter_task/constant/app_colors.dart';
import 'package:capricon_flutter_task/constant/routes_constant.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/constant/text_styles.dart';
import 'package:capricon_flutter_task/models/stock_model.dart';
import 'package:capricon_flutter_task/widgets/custom_app_bar.dart';
import 'package:capricon_flutter_task/widgets/search_bar_widget.dart';
import 'package:capricon_flutter_task/widgets/stock_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';
import '../providers/stock_provider.dart';

class StockScreen extends ConsumerStatefulWidget {
  const StockScreen({super.key});

  @override
  ConsumerState<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends ConsumerState<StockScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(authProvider.notifier).autoLogin();
  }

  @override
  Widget build(BuildContext context) {
    final stockState = ref.watch(stockProvider);
    final user = ref.watch(authProvider);
    // Use the stocks from stockState as localStocks for real-time filtering
    final List<Stock> localStocks = stockState.stocks;
    final List<Stock> displayedStocks =
        stockState.stocks.isNotEmpty
            ? stockState
                .stocks // Show API results if available
            : localStocks; // Otherwise, show local data
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: false,
        title: StringConstants.stockSearch,
        actions: [
          IconButton(
            onPressed: () async {
              FocusScope.of(context).unfocus();
              await ref.read(authProvider.notifier).logout();
              Navigator.pushReplacementNamed(context, Routes.login);
            },
            icon: const Icon(Icons.logout, color: AppColors.white),
          ),
        ],
      ),

      body: Container(
        color: AppColors.primary, // Replace with desired color
        child: Column(
          children: [
            SearchBarWidget(
              searchController: _searchController,
              user: user,
              localStocks: localStocks,
            ),
            Expanded(
              child:
                  stockState.isLoading
                      ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      )
                      : stockState.errorMessage.isNotEmpty
                      ? Center(
                        child: Text(
                          stockState.errorMessage,
                          style: TextStyles.errorText,
                        ),
                      )
                      : displayedStocks.isEmpty
                      ? Center(
                        child: Text(
                          StringConstants.noStockFound,
                          style: TextStyles.noStockFoundText,
                        ),
                      )
                      : StockList(stocks: displayedStocks),
            ),
          ],
        ),
      ),
    );
  }
}
