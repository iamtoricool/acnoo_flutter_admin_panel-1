part of '../_dropdown_button.dart';

class FilterDropdownButton<T> extends StatefulWidget {
  const FilterDropdownButton({
    super.key,
    this.value,
    this.items,
    this.onChanged,
  });
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T? value)? onChanged;

  @override
  State<FilterDropdownButton<T>> createState() =>
      _FilterDropdownButtonState<T>();
}

class _FilterDropdownButtonState<T> extends State<FilterDropdownButton<T>> {
  List<DropdownMenuItem<T>> items = [];
  T? selectedItem;

  void getItems() {
    if (widget.items == null) {
      items = ["This Month", "This Year"]
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .cast<DropdownMenuItem<T>>()
          .toList();

      return;
    }
    items = widget.items ?? [];
  }

  @override
  void initState() {
    getItems();
    selectedItem = (widget.value ?? items.firstOrNull?.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _dropdownStyle = AcnooDropdownStyle(context);

    final _selectedChild = items
        .firstWhereOrNull(
          (element) => element.value == selectedItem,
        )
        ?.child;

    return DropdownButton2<T>(
      underline: const SizedBox.shrink(),
      isDense: true,
      isExpanded: true,
      customButton: OutlinedDropdownButton(child: _selectedChild),
      style: _theme.textTheme.bodyMedium,
      iconStyleData: _dropdownStyle.iconStyle,
      dropdownStyleData: _dropdownStyle.dropdownStyle,
      menuItemStyleData: _dropdownStyle.menuItemStyle,
      value: selectedItem,
      items: items,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() => selectedItem = value);
      },
    );
  }
}
