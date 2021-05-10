import 'package:flutter/material.dart';

extension Shared on Widget {
  /// Use it for debugging your UI
  Widget withBox(
      {BoxDecoration? boxDecoration, double padding = 3, double margin = 3}) {
    return Container(
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      decoration:
          boxDecoration ?? BoxDecoration(border: Border.all(color: Colors.red)),
      child: this,
    );
  }
}
