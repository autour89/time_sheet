import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:time_sheet/blocs/HomeBloc.dart';
import 'package:time_sheet/screens/Widgets/record.dart';

class RecordList extends StatelessWidget {
  final String _emptyRecordsMessage = 'No Tasks';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBloc>(
      builder: (c) => c.records.isEmpty
          ? Center(
              child: Text(
                _emptyRecordsMessage,
                style: TextStyle(fontSize: 26, color: Colors.grey),
              ),
            )
          : InkWell(
              onTap: () => c.newRecord = false,
              child: ListView.builder(
                itemCount: c.records.length,
                itemBuilder: (context, index) =>
                    Record(record: c.records[index], index: index),
              ),
            ),
    );
  }
}
