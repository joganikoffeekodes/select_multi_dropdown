import 'package:flutter/material.dart';

class MultiSelectDropdown<T> extends StatefulWidget {
  final List<T> items;
  final List<T> initialSelectedItems;
  final ValueChanged<List<T>> onSelectionChanged;
  final String hintText;

  MultiSelectDropdown({
    required this.items,
    required this.initialSelectedItems,
    required this.onSelectionChanged,
    this.hintText = 'Select Items',
  });

  @override
  _MultiSelectDropdownState<T> createState() => _MultiSelectDropdownState<T>();
}

class _MultiSelectDropdownState<T> extends State<MultiSelectDropdown<T>> {
  late List<T> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.initialSelectedItems;
  }

  void _onItemCheckedChange(T item, bool checked) {
    setState(() {
      if (checked) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
      widget.onSelectionChanged(_selectedItems);
    });
  }

  void _onDropDownItemTapped() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: widget.items.map((item) {
                return CheckboxListTile(
                  value: _selectedItems.contains(item),
                  title: Text(item.toString()),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (checked) {
                    _onItemCheckedChange(item, checked!);
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onDropDownItemTapped,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          _selectedItems.isEmpty ? widget.hintText : _selectedItems.join(', '),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
