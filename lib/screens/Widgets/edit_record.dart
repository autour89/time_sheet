import 'package:flutter/material.dart';
import 'package:time_sheet/generated/l10n.dart';
import 'package:time_sheet/models/RecordModel.dart';
import 'package:time_sheet/screens/Widgets/duration_tags.dart';

class EditRecord extends StatefulWidget {
  final RecordModel record;

  EditRecord({Key? key, required this.record}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditRecordState();
}

class _EditRecordState extends State<EditRecord> {
  final TextEditingController _recordTextController = TextEditingController();

  @override
  void initState() {
    _recordTextController.text = widget.record.title;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(S.of(context).editTitle),
        content: _buildEditScreen(),
        actions: [
          TextButton(
            child: Text(S.of(context).cancelTitle),
            onPressed: Navigator.of(context).pop,
          ),
          TextButton(
            child: Text(S.of(context).saveTitle),
            onPressed: () => {
              widget.record.title = _recordTextController.text,
              Navigator.pop(context, widget.record)
            },
          ),
        ]);
  }

  Widget _buildEditScreen() {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).durationTitle),
              DurationTags(
                duration: widget.record.duration.inHours,
                onChange: (tag) =>
                    widget.record.duration = Duration(hours: tag),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).submittedTitle),
              Switch(
                value: widget.record.isSubmitted,
                onChanged: (_) {
                  widget.record.state =
                      _ ? RecordState.submitted : RecordState.active;
                },
              )
            ],
          ),
          TextField(
            controller: _recordTextController,
            keyboardType: TextInputType.multiline,
            minLines: 2,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: S.of(context).descibeTask,
              border: OutlineInputBorder(),
            ),
          )
        ],
      )),
    );
  }
}
