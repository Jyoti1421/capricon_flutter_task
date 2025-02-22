class ApiConstants {
  // Base URL for the API
  static const String baseUrl =
      'https://illuminate-production.up.railway.app/api/';

  // Method to get the search URL dynamically with query
  static String getStockSearchUrl(String query) {
    return '${baseUrl}stocks/search?query=$query';
  }

  // Method to get the login URL dynamically
  static String getLoginUrl() {
    return '${baseUrl}auth/local'; // Dynamic URL for login
  }

  // Method to get the stock details URL dynamically
  static String getStockDetailUrl(int stockId) {
    return '${baseUrl}stocks/$stockId'; // Dynamic URL for stock details
  }
}
