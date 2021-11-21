import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:time_sheet/blocs/HomeBloc.dart';
import 'package:time_sheet/models/RecordModel.dart';
import 'package:time_sheet/screens/Widgets/composer.dart';
import 'package:time_sheet/screens/Widgets/edit_record.dart';
import 'package:time_sheet/screens/Widgets/search_bar.dart';

class HomePage extends GetView<HomeBloc> {
  final FocusNode focusNode = FocusNode();
  final TextEditingController recordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar(),
        body: SafeArea(
            child: Stack(
          children: [
            _buildRecords(context),
            Composer(
                recordTextController: recordTextController,
                focusNode: focusNode),
          ],
        )),
        floatingActionButton: _buildAddbutton(
            context) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  /// records list
  Widget _buildRecords(BuildContext context) {
    return GetBuilder<HomeBloc>(
      builder: (c) => controller.records.isEmpty
          ? Center(
              child: Text(
                'No Tasks',
                style: TextStyle(fontSize: 26, color: Colors.grey),
              ),
            )
          : InkWell(
              onTap: () => {
                c.newRecord = false,
                dismissKeyboard(),
              },
              child: GetBuilder<HomeBloc>(
                  builder: (c) => ListView.builder(
                        itemCount: controller.records.length,
                        itemBuilder: (context, index) {
                          return _recordItem(context, index);
                        },
                      )),
            ),
    );
  }

  /// record card
  Widget _recordItem(BuildContext context, int index) {
    var record = controller.records[index];
    return Slidable(
      key: Key(record.hashCode.toString()),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          if (!record.isSubmitted)
            SlidableAction(
              label: 'Submit',
              backgroundColor: Colors.blue,
              icon: Icons.archive,
              onPressed: (_) => {controller.submitRecord(record)},
            ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (_) => controller.removeRecord(record),
          ),
        ],
      ),
      child: Card(
        child: Container(
          child: InkWell(
              child: ListTile(
            onTap: () => _showEditDialog(context, index),
            leading: record.isSubmitted
                ? Icon(Icons.star)
                : Icon(Icons.star_border_sharp),
            trailing: Text(
              record.total,
              style: TextStyle(fontSize: 19),
            ),
            title: Container(
                margin: EdgeInsets.all(10),
                child: Tooltip(
                  message: record.title,
                  child: Text(
                    record.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )),
            subtitle: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Text('Rate : ${record.rateFormatted}')),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Text('Created : ${record.formatted}')),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  /// build fab to show/hide record composer
  Widget _buildAddbutton(BuildContext context) {
    return GetBuilder<HomeBloc>(
        builder: (c) => Visibility(
            child: FloatingActionButton(
              onPressed: () => {
                c.newRecord = true,
                showKeyboard(),
              },
              tooltip: 'Add new record',
              child: Icon(Icons.add),
            ),
            visible: !c.composerActive));
  }

  /// show edit screen and update UI : records list and states related to it
  void _showEditDialog(BuildContext context, int index) async {
    controller.newRecord = false;
    dismissKeyboard();

    if (!controller.records[index].isSubmitted) {
      RecordModel? result = await showDialog(
        context: context,
        builder: (_) => EditRecord(record: controller.records[index]),
      );

      if (result != null) {
        controller.updateRecord(result, index);
      }
    }
  }

  ///This is a basic function to open keyboard.
  void showKeyboard() {
    focusNode.requestFocus();
  }

  /// close opened keyboard
  void dismissKeyboard() {
    recordTextController.clear();
    focusNode.unfocus();
  }
}
