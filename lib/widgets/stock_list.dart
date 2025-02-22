import 'package:capricon_flutter_task/constant/routes_constant.dart';
import 'package:capricon_flutter_task/models/stock_model.dart';
import 'package:flutter/material.dart';

class StockList extends StatelessWidget {
  final List<Stock> stocks;

  const StockList({Key? key, required this.stocks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        final stock = stocks[index];
        return Card(
          child: ListTile(
            title: Text(stock.name),
            subtitle: Text(stock.symbol),
            trailing: Text('\$${stock.price.toStringAsFixed(2)}'),
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.stockDetail,
                arguments: stock.id, // Pass the stock.id as the argument
              );
            },
          ),
        );
      },
    );
  }
}
