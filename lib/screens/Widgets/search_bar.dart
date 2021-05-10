import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_sheet/blocs/HomeBloc.dart';

///Searching functionality for list of tasks
class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController _searchQueryController = TextEditingController();
  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _buildLeadingBar(),
      title: _buildTitleBar(),
      actions: _buildActionsBar(context),
    );
  }

  Widget _buildLeadingBar() {
    return GetBuilder<HomeBloc>(
      builder: (c) => c.isSearching
          ? BackButton(
              onPressed: () =>
                  {_searchQueryController.clear(), c.search = false},
            )
          : Container(),
    );
  }

  Widget _buildTitleBar() {
    return GetBuilder<HomeBloc>(
      builder: (c) => c.isSearching
          ? TextField(
              controller: _searchQueryController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Search your records...",
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                ),
                hintStyle: TextStyle(color: Colors.white30),
              ),
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              onChanged: (query) => c.updateSearchQuery(query),
            )
          : Text(
              'Search',
              style: TextStyle(fontSize: 14, color: Colors.grey[50]),
            ),
    );
  }

  List<Widget> _buildActionsBar(BuildContext context) {
    return [
      GetBuilder<HomeBloc>(
        builder: (c) => c.isSearching
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => {
                  _searchQueryController.clear(),
                  c.search = false,
                },
              )
            : IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => c.search = true,
              ),
      ),
    ];
  }
}
