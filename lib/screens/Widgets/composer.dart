import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_sheet/blocs/HomeBloc.dart';

class Composer extends StatelessWidget {
  final String _hintText = 'Describe your task here...';
  final FocusNode focusNode = FocusNode();
  final TextEditingController recordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildComposer();
  }

  bool _updateState(HomeBloc bloc) {
    if (bloc.composerActive) {
      showKeyboard();
    } else {
      dismissKeyboard();
    }

    return bloc.composerActive;
  }

  Widget _buildComposer() {
    return GetBuilder<HomeBloc>(
        builder: (c) => Visibility(
              visible: _updateState(c),
              child: Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: TextField(
                            focusNode: focusNode,
                            controller: recordTextController,
                            textCapitalization: TextCapitalization.sentences,
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: _hintText),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: TextButton(
                            onPressed: () => {
                              c.addRecord(recordTextController.text),
                            },
                            child: FittedBox(
                              child: Text('Create'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
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
