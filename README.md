
# select_multi_dropdown

Multi-Select Dropdown package lets you add a customizable multi-select dropdown widget to your Flutter app.


## Installation

1. Add the latest version of the package to your `pubspec.yaml` (and run `dart pub get`):
```yaml
dependencies:
  select_multi_dropdown: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:select_multiple_dropdown/select_multi_dropdown.dart';
```

## Example
There are a number of properties that you can modify:

- items (List of items to select from)
- initialSelectedItems (List of initially selected items)
- onSelectionChanged (Callback when selection changes)
- hintText (Hint text for the dropdown)

<hr>

<table>
<tr>
<td>

```dart
import 'package:flutter/material.dart';
import 'package:flutter_multi_select/flutter_multi_select.dart';

class MultiSelectExample extends StatefulWidget {
  @override
  _MultiSelectExampleState createState() => _MultiSelectExampleState();
}

class _MultiSelectExampleState extends State<MultiSelectExample> {
  final List<String> _items = ['Apple', 'Banana', 'Cherry', 'Date', 'Fig'];
  List<String> _selectedItems = [];

  void _onSelectionChanged(List<String> selectedItems) {
    setState(() {
      _selectedItems = selectedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi Select Dropdown Example')),
      body: Center(
        child: MultiSelectDropdown<String>(
          items: _items,
          initialSelectedItems: _selectedItems,
          onSelectionChanged: _onSelectionChanged,
          hintText: 'Select Fruits',
        ),
      ),
    );
  }
}
```

</td>
</tr>
</table>

## Next Goals

- [x] Add customization for dropdown styling.
  Now, you can specify the styling properties for the dropdown.

- [x] Add support for different item types.
  The dropdown supports various data types like strings, numbers, etc.

- [ ] Add more features and customization options.

This template provides a clear and concise README.md that explains the installation, usage, and features of your `select_multi_dropdown` package. It also includes an example with code and an image placeholder to illustrate the widget's usage in a Flutter app.



