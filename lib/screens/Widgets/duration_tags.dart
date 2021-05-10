import 'package:flutter/material.dart';
import 'package:time_sheet/models/TagModel.dart';

class DurationTags extends StatefulWidget {
  final List<TagModel> _hours = [];
  TagModel selected = TagModel(hour: 0);

  /// When you select a new tag this callback will be invoked
  Function(int) onChange;

  /// selected value of tag
  int get value => selected.hour;

  DurationTags({Key? key, int? duration, required this.onChange})
      : super(key: key) {
    if (duration != null) selected = TagModel(hour: duration);
  }

  @override
  State<StatefulWidget> createState() => _DurationTagsState();
}

class _DurationTagsState extends State<DurationTags> {
  @override
  void initState() {
    for (var i = 1; i < 13; i++) widget._hours.add(TagModel(hour: i));
    super.initState();
  }

  void _onTap(TagModel tag) {
    setState(() {
      widget.selected = tag;
      widget.onChange(widget.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10.0,
      children: [
        ...widget._hours.map((tag) => Chip(
              backgroundColor: tag.value == widget.selected.value
                  ? Colors.blue
                  : Colors.grey[10],
              label: InkWell(
                  onTap: () => _onTap(tag), child: Text('${tag.value}h')),
            ))
      ],
    );
  }
}
