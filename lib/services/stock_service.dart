import 'package:capricon_flutter_task/constant/api_constant.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/stock_model.dart';

class StockService {
  static Future<List<Stock>> searchStocks(String query, String token) async {
    final url = Uri.parse(ApiConstants.getStockSearchUrl(query));

    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      // Check for successful response
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        // Map the response data to a list of Stock objects
        final stocks =
            data.map((item) {
              // Handle missing or null fields gracefully
              final symbol = item['symbol'] ?? 'N/A';
              final name = item['name'] ?? 'Unknown';
              final id = item['id'] ?? 0;

              // Attempt to parse the market_cap field as a price
              final price =
                  item['market_cap'] != null
                      ? double.tryParse(item['market_cap'].toString()) ?? 0.0
                      : 0.0;

              // Debug print for each stock found

              return Stock(symbol: symbol, name: name, price: price, id: id);
            }).toList();

        // Return the list of stocks
        return stocks;
      } else { 
        throw Exception(StringConstants.failedToLoadStock);
      }
    } catch (error) {
      // Catch any errors (e.g., network issues) and rethrow as a custom exception

      throw Exception('${error.runtimeType}');
    }
  }
}
