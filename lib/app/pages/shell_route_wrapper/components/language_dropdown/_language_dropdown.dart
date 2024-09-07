import 'package:flutter/material.dart';

import 'package:collection/collection.dart';
import 'package:country_flags/country_flags.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../../core/helpers/field_styles/field_styles.dart';
import '../../../../widgets/widgets.dart';

class LanguageDropdownWidget extends StatefulWidget {
  const LanguageDropdownWidget({super.key});

  @override
  State<LanguageDropdownWidget> createState() => _LanguageDropdownWidgetState();
}

class _LanguageDropdownWidgetState extends State<LanguageDropdownWidget> {
  final supportedLanguages = {
    "English": "US",
    "Bangla": "BD",
  };

  String? selectedLanguage;

  @override
  void initState() {
    selectedLanguage = supportedLanguages.entries.first.key;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _dropdownStyle = AcnooDropdownStyle(context);

    final _item = supportedLanguages.entries
        .map((item) => DropdownMenuItem<String?>(
              value: item.key,
              child: _buildDropdownTile(context, item: item),
            ))
        .toList();

    final _selectedChild =
        _item.firstWhereOrNull((e) => e.value == selectedLanguage)?.child;

    return DropdownButton2(
      underline: const SizedBox.shrink(),
      isDense: true,
      isExpanded: true,
      customButton: OutlinedDropdownButton(child: _selectedChild),
      style: _theme.textTheme.bodyMedium,
      iconStyleData: _dropdownStyle.iconStyle,
      dropdownStyleData: _dropdownStyle.dropdownStyle,
      menuItemStyleData: _dropdownStyle.menuItemStyle,
      value: selectedLanguage,
      items: _item,
      onChanged: (_) => setState(() => selectedLanguage = _),
    );
  }

  Widget _buildDropdownTile(
    BuildContext context, {
    required MapEntry<String, String> item,
  }) {
    final _size = MediaQuery.sizeOf(context);
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CountryFlag.fromCountryCode(
            item.value,
            height: 20,
            width: 26,
          ),
        ),
        if (_size.width >= 480) Text(item.key),
      ],
    );
  }
}
