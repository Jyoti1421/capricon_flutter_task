import 'dart:convert';
import 'package:capricon_flutter_task/constant/api_constant.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:http/http.dart' as http;
import '../models/stock_detail_model.dart'; // Import your model

class StockDetailService {
  // Method to fetch stock details using the stock ID and auth token
  static Future<StockDetailModel> getStockDetails(
    int stockId,
    String authToken,
  ) async {
    try {
      // Create the URL for fetching stock details
      final url = Uri.parse(ApiConstants.getStockDetailUrl(stockId));

      // Send GET request with the auth token
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $authToken',
          'Content-Type': 'application/json',
        },
      );

      // Check for successful response
      if (response.statusCode == 200) {
        // Parse the response body and return the StockDetailModel
        final stock = StockDetailModel.fromJson(jsonDecode(response.body));
        return stock;
      } else {
        throw Exception(StringConstants.failedToLoadStockDetails);
      }
    } catch (error) {
      throw Exception('$error');
    }
  }
}
