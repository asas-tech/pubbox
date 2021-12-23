import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dropdown_button.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({Key? key}) : super(key: key);

  Object? value = 1;

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text('$i'),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownBelow(
      value: 2,
      icon: Icon(CupertinoIcons.chevron_down),
      items: buildDropdownTestItems([1, 2, 3, 4]),
      onChanged: (Object? value) {},
    );
  }
}
