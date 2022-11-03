import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:france_termes/widgets/themes/theme_constants.dart';

import '../tool/mutable_pointer.dart';

class FieldDropButtun extends StatefulWidget {
  final MutablePointer<String> selectedValue;
  final List<String> fields;
  final String unSelected;
  const FieldDropButtun({
    super.key,
    required this.fields,
    required this.selectedValue,
    required this.unSelected,
  });

  get getSelectedValue => selectedValue;

  @override
  State<FieldDropButtun> createState() => _FieldDropButtunState();
}

class _FieldDropButtunState extends State<FieldDropButtun> {
  late final List<String> _fields;
  late final MutablePointer<String> _selectedValue;
  late final String _unSelected;
  String? _selected;
  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
    _unSelected = _selectedValue.pointer;
    _fields = widget.fields;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: [
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                _unSelected,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: _fields
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      //color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: _selected,
        onChanged: (value) {
          setState(() {
            _selected = value as String;
            _selectedValue.pointer = value;
          });
        },
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 30,
        //iconEnabledColor: Colors.grey,
        //iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: 80,
        buttonPadding: const EdgeInsets.only(left: 0, right: 14),
        buttonElevation: 0,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 5),
        dropdownMaxHeight: 200,
        dropdownWidth: 200,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          color: ThemeConstants.articleInternalCardColor(context),
        ),
        dropdownElevation: 2,
        //scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
      ),
    );
  }
}
