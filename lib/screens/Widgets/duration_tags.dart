import 'package:flutter/material.dart';
import 'package:time_sheet/models/TagModel.dart';

class DurationTags extends StatefulWidget {
  final List<TagModel> _hours = [];
  final int? duration;

  /// When you select a new tag this callback will be invoked
  final Function(int) onChange;

  DurationTags({Key? key, this.duration, required this.onChange})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _DurationTagsState();
}

class _DurationTagsState extends State<DurationTags> {
  TagModel selected = TagModel(hour: 0);

  /// selected value of tag
  int get value => selected.hour;

  @override
  void initState() {
    super.initState();

    for (var i = 1; i < 13; i++) {
      widget._hours.add(TagModel(hour: i));
    }

    selected = TagModel(hour: widget.duration ?? 0);
  }

  void _onTap(TagModel tag) {
    setState(() {
      selected = tag;
      widget.onChange(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10.0,
      children: [
        ...widget._hours.map((tag) => Chip(
              backgroundColor:
                  tag.value == selected.value ? Colors.blue : Colors.grey[10],
              label: InkWell(
                  onTap: () => _onTap(tag), child: Text('${tag.value}h')),
            ))
      ],
    );
  }
}
