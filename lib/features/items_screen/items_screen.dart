import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helper/app_strings.dart';
import '../home/data/model/home_model.dart';
import 'widget/akelni_item.dart';

class ItemsScreen extends StatefulWidget {
  final List<Items>? items;

  const ItemsScreen({super.key, this.items});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  late List<Items>? searchedForItems;
  bool _isSearching = false;

  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: ColorsManager.white,
      decoration: InputDecoration(
        hintText: AppStrings.findAItem.tr(context),
        border: InputBorder.none,
        hintStyle: TextStyles.font16WhiteSemiBold,
      ),
      style: TextStyles.font16WhiteSemiBold,
      onChanged: (searchedItems) {
        addSearchedForItemsToSearchedList(searchedItems);
      },
    );
  }

  void addSearchedForItemsToSearchedList(String searchedItems) {
    searchedForItems = widget.items!
        .where((item) => item.title!.toLowerCase().startsWith(searchedItems))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _searchTextController.clear();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: ColorsManager.white,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startSearch,
          icon: Icon(
            Icons.search,
            color: ColorsManager.white,
            size: 30,
          ),
        ),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      _searchTextController.clear();
      setState(() {
        _isSearching = false;
      });
    }));
    setState(() {
      _isSearching = true;
    });
  }

  Widget _buildAppBarTitle() {
    return Center(
      child: Text(
        AppStrings.listFood,
        style: TextStyle(color: ColorsManager.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primary,
        leading: _isSearching
            ? BackButton(
                color: ColorsManager.white,
              )
            : Container(),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20).w,
          child: widget.items!.isEmpty
              ? Center(
                  child: Text(
                  AppStrings.notFound.tr(context),
                  style: TextStyles.font32primaryBold,
                ))
              : AkelniItems(
                  items: _searchTextController.text.isEmpty
                      ? widget.items
                      : searchedForItems,
                )),
    );
  }

  @override
  void dispose() {
    _searchTextController.clear();
    super.dispose();
  }
}
