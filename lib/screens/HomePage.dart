import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_sheet/blocs/HomeBloc.dart';
import 'package:time_sheet/generated/l10n.dart';
import 'package:time_sheet/screens/Widgets/composer.dart';
import 'package:time_sheet/screens/Widgets/records_list.dart';
import 'package:time_sheet/screens/Widgets/search_bar.dart';

class HomePage extends GetView<HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(),
        body: SafeArea(
            child: Stack(
          children: [
            RecordList(),
            Composer(),
          ],
        )),
        floatingActionButton: _buildAddbutton(
            context) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  /// build fab to show/hide record composer
  Widget _buildAddbutton(BuildContext context) {
    return GetBuilder<HomeBloc>(
        builder: (c) => Visibility(
              visible: !c.composerActive,
              child: FloatingActionButton(
                onPressed: () => {
                  c.newRecord = true,
                },
                tooltip: S.of(context).addRecord,
                child: Icon(Icons.add),
              ),
            ));
  }
}
