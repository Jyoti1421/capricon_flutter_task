import 'package:capricon_flutter_task/constant/app_colors.dart';
import 'package:capricon_flutter_task/constant/string_constant.dart';
import 'package:capricon_flutter_task/models/stock_model.dart';
import 'package:capricon_flutter_task/models/user_model.dart';
import 'package:capricon_flutter_task/providers/stock_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarWidget extends ConsumerStatefulWidget {
  final TextEditingController searchController;
  final User? user;
  final List<Stock> localStocks;

  const SearchBarWidget({
    Key? key,
    required this.searchController,
    required this.user,
    required this.localStocks,
  }) : super(key: key);

  @override
  ConsumerState<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends ConsumerState<SearchBarWidget> {
  void _performApiSearch() {
    FocusScope.of(context).unfocus();
    final query = widget.searchController.text.trim();

    if (query.isEmpty) {
      ref.read(stockProvider.notifier).clearSearch();
      return;
    }

    if (widget.user != null) {
      ref.read(stockProvider.notifier).searchStocks(query, widget.user!.token);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar( SnackBar(content: Text(StringConstants.pleaseLoginFirst)));
    }
  }

  void _clearSearch() {
    FocusScope.of(context).unfocus();
    widget.searchController.clear();
    ref.read(stockProvider.notifier).clearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: widget.searchController,
        onSubmitted: (_) => _performApiSearch(),
        decoration: InputDecoration(
          hintText: StringConstants.search,
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: _performApiSearch,
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: _clearSearch,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: AppColors.white,
        ),
      ),
    );
  }
}
