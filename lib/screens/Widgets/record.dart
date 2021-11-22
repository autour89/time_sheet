import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:time_sheet/blocs/HomeBloc.dart';
import 'package:time_sheet/models/RecordModel.dart';
import 'package:time_sheet/screens/Widgets/edit_record.dart';

class Record extends StatelessWidget {
  final RecordModel record;
  final int index;

  Record({required this.record, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBloc>(
        builder: (controller) => Slidable(
              key: Key(record.hashCode.toString()),
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
                    onTap: () => _showEditDialog(context, controller, index),
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
            ));
  }

  /// show edit screen and update UI : records list and states related to it
  void _showEditDialog(BuildContext context, HomeBloc bloc, int index) async {
    bloc.newRecord = false;

    if (!record.isSubmitted) {
      var result = await showDialog(
        context: context,
        builder: (_) => EditRecord(record: record),
      );

      if (result != null) {
        bloc.updateRecord(result, index);
      }
    }
  }
}
