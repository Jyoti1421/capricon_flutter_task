import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/models/stock_detail_model.dart';
import 'package:capricon_flutter_task/providers/auth_provider.dart';
import 'package:capricon_flutter_task/providers/stock_detail_provider.dart'
    show stockDetailProvider;
import 'package:capricon_flutter_task/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockDetailScreen extends ConsumerStatefulWidget {
  final int stockId;

  const StockDetailScreen({super.key, required this.stockId});

  @override
  // ignore: library_private_types_in_public_api
  _StockDetailScreenState createState() => _StockDetailScreenState();
}

class _StockDetailScreenState extends ConsumerState<StockDetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final user = ref.watch(authProvider);
      ref
          .read(stockDetailProvider.notifier)
          .fetchStockDetails(widget.stockId, user!.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    final stockState = ref.watch(stockDetailProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        centerTitle: false,
        title: StringConstants.stockDetailScreen,
      ),
      body: _buildBody(stockState),
    );
  }

  Widget _buildBody(StockDetailState stockState) {
    if (stockState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (stockState.errorMessage.isNotEmpty) {
      return Center(
        child: Text('${StringConstants.error} ${stockState.errorMessage}'),
      );
    } else if (stockState.stock == null) {
      return const Center(child: Text(StringConstants.noStockDetailsFound));
    } else {
      final stock = stockState.stock!;
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${stock.name} (${stock.symbol})',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '${StringConstants.price} \$${stock.price.toStringAsFixed(2)}',
            ),
            Text(
              '${StringConstants.change} ${stock.changePercent.toStringAsFixed(2)}%',
            ),
            const SizedBox(height: 16),
            Text('${StringConstants.marketCap} \$${stock.marketCap}'),
            Text('${StringConstants.exchange} ${stock.exchange}'),
            const SizedBox(height: 16),
            Text('${StringConstants.industry} ${stock.industry}'),
            Text('${StringConstants.sector} ${stock.sector}'),
            const SizedBox(height: 16),
            Text('${StringConstants.description} ${stock.description}'),
            const SizedBox(height: 16),
            Text('${StringConstants.website} ${stock.website}'),
            Text('${StringConstants.address} ${stock.address}'),
            const SizedBox(height: 16),
            const Text(StringConstants.sustainability),
            Text('${StringConstants.netZeroProgress} ${stock.netZeroProgress}'),
            Text('${StringConstants.scope1Emissions} ${stock.scope1Emissions}'),
            Text('${StringConstants.scope2Emissions} ${stock.scope2Emissions}'),
            Text('${StringConstants.scope3Emissions} ${stock.scope3Emissions}'),
            Text('${StringConstants.totalEmissions} ${stock.totalEmissions}'),
          ],
        ),
      );
    }
  }
}
