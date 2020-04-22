import 'package:flutter/material.dart';


///迭代器生成
class InputSelect extends StatelessWidget {
  final int index;
  final widget;
  final parent;
  final String choice;

  const InputSelect(
      {@required this.index,
        @required this.widget,
        @required this.parent,
        @required this.choice})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ChoiceChip(
          label: Text(
            choice,
            style: TextStyle(color: Colors.black),
          ),
          //选定的时候背景
          selectedColor: Colors.blue,
          //被禁用得时候背景
          disabledColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),

          ),
          labelStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 15.0),
          labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onSelected: (bool value) {
            parent.onSelectedChanged(index);
            Navigator.of(context).pop(index);
          },
          selected: parent.selectedParent == index),
    );
  }
}