import 'package:capricon_flutter_task/models/stock_detail_model.dart';
import 'package:capricon_flutter_task/services/stock_detail_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stockDetailProvider =
    StateNotifierProvider<StockDetailNotifier, StockDetailState>((ref) {
      return StockDetailNotifier();
    });

class StockDetailNotifier extends StateNotifier<StockDetailState> {
  StockDetailNotifier() : super(StockDetailState.initial());

  Future<void> fetchStockDetails(int stockId, authToken) async {
    try {
      // Set the state to loading before API call
      state = StockDetailState.loading();
      final stock = await StockDetailService.getStockDetails(
        stockId,
        authToken,
      );
      // On successful response, update the state with the fetched stock details
      state = StockDetailState.success(stock);
    } catch (e) {
      // Set error state if something goes wrong
      state = StockDetailState.error(e.toString());
    }
  }
}
