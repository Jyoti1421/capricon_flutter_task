import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/stock_model.dart';
import '../services/stock_service.dart';

// StockState to hold the state of the stocks
class StockState {
  final bool isLoading;
  final List<Stock> stocks;
  final String errorMessage;

  StockState({
    required this.isLoading,
    required this.stocks,
    required this.errorMessage,
  });

  // Initial state with no data and not loading
  factory StockState.initial() =>
      StockState(isLoading: false, stocks: [], errorMessage: '');

  // Factory method to show loading state
  factory StockState.loading() =>
      StockState(isLoading: true, stocks: [], errorMessage: '');

  // Factory method to show error state
  factory StockState.error(String message) =>
      StockState(isLoading: false, stocks: [], errorMessage: message);

  // Factory method to show results after search
  factory StockState.success(List<Stock> stocks) =>
      StockState(isLoading: false, stocks: stocks, errorMessage: '');
}

// StockNotifier handles the state logic
class StockNotifier extends StateNotifier<StockState> {
  StockNotifier() : super(StockState.initial());

  Future<void> searchStocks(String query, String token) async {
    if (query.isEmpty) {
      clearSearch();
      return;
    }
    try {
      // Set the state to loading before API call
      state = StockState.loading();

      // Simulate API call to fetch stocks
      final stocks = await StockService.searchStocks(query, token);

      // Set state to success if data is returned
      state =
          stocks.isNotEmpty
              ? StockState.success(stocks)
              : StockState.error('${StringConstants.noResultsFound} "$query".');
      // state = StockState.success(stocks);
    } catch (e) {
      // Set error state if something goes wrong
      state = StockState.error(e.toString());
    }
  }

  void clearSearch() {
    state = StockState.initial(); // Reset to initial state
  }
}

// Provider for StockNotifier
final stockProvider = StateNotifierProvider<StockNotifier, StockState>((ref) {
  return StockNotifier();
});
