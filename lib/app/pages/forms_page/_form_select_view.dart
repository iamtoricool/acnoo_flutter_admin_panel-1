import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/helpers/field_styles/field_styles.dart';
import '../../widgets/widgets.dart';

class FormSelectView extends StatefulWidget {
  const FormSelectView({super.key});

  @override
  State<FormSelectView> createState() => _FormSelectViewState();
}

class _FormSelectViewState extends State<FormSelectView> {
  late final scrollController = ScrollController();

  List<int?> selectedDropdownItems = [];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _dropdownStyle = AcnooDropdownStyle(context);
    final _inputFieldStyle = AcnooInputFieldStyles(context);
    const _lg = 4;
    const _md = 6;

    final _sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 992,
          value: _SizeInfo(
            fonstSize: 12,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;

    return Scaffold(
      body: ListView(
        padding: _sizeInfo.padding,
        children: [
          // Default Select
          ShadowContainer(
            headerText: 'Default Select',
            child: ResponsiveGridRow(
              children: [
                // Basic Dropdown
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input with Placeholder',
                      inputField: DropdownButtonFormField2(
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        hint: const Text('Select you status'),
                        items: List.generate(
                          5,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text('Status ${index + 1}'),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Rounded Border Dropdown
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input with Placeholder',
                      inputField: DropdownButtonFormField2(
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        hint: const Text('Select you status'),
                        decoration: InputDecoration(
                          border: _inputFieldStyle.getRoundedBorder(),
                          enabledBorder: _inputFieldStyle.getRoundedBorder(
                            getRoundedBorderType:
                                RoundedBorderType.enabledBorder,
                          ),
                          focusedBorder: _inputFieldStyle.getRoundedBorder(
                            getRoundedBorderType:
                                RoundedBorderType.focusedBorder,
                          ),
                          errorBorder: _inputFieldStyle.getRoundedBorder(
                            getRoundedBorderType: RoundedBorderType.errorBorder,
                          ),
                          focusedErrorBorder: _inputFieldStyle.getRoundedBorder(
                            getRoundedBorderType:
                                RoundedBorderType.focusedErrorBorder,
                          ),
                          disabledBorder: _inputFieldStyle.getRoundedBorder(
                            getRoundedBorderType:
                                RoundedBorderType.disabledBorder,
                          ),
                        ),
                        items: List.generate(
                          5,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text('Status ${index + 1}'),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Basic Dropdown Disabled
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input with Placeholder',
                      inputField: DropdownButtonFormField2(
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        hint: const Text('Select you status'),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: _inputFieldStyle.disabledFieldColor,
                        ),
                        items: const [],
                      ),
                    ),
                  ),
                ),

                // Dashed Border Dropdown
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input with Placeholder',
                      inputField: DropdownButtonFormField2(
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        hint: const Text('Select you status'),
                        decoration: const InputDecoration(
                            // TODO: Fix Dashed Border Design later
                            ),
                        items: const [],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _sizeInfo.innerSpacing),

          // Menu Size
          ShadowContainer(
            headerText: 'Menu Size',
            child: ResponsiveGridRow(
              children: [
                // Scrollable Menu
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: 100,
                        minHeight: 40,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _theme.colorScheme.outline,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: RawScrollbar(
                        controller: scrollController,
                        thumbVisibility: true,
                        trackVisibility: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        interactive: true,
                        thickness: 14,
                        crossAxisMargin: 2,
                        thumbColor: _theme.colorScheme.outline,
                        trackBorderColor: Colors.transparent,
                        child: _buildMenuList(
                          theme: _theme,
                          controller: scrollController,
                        ),
                      ),
                    ),
                  ),
                ),

                // Unscrollable Menu
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxHeight: 100,
                        minHeight: 40,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _theme.colorScheme.outline,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: _buildMenuList(theme: _theme, isScrollable: false),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _sizeInfo.innerSpacing),

          // Select Size
          ShadowContainer(
            headerText: 'Select Size',
            child: ResponsiveGridRow(
              children: [
                ...{
                  "Input SM": "SM",
                  "Input MD": "MD",
                  "Input LG": "LG",
                }.entries.map(
                  (prop) {
                    final double _xPadding = switch (prop.value) {
                      // "SM" => 16,
                      // "MD" => 16,
                      // "LG" => 16,
                      _ => 16,
                    };
                    final double _yPadding = switch (prop.value) {
                      "SM" => 4,
                      "MD" => 8,
                      "LG" => 12,
                      _ => 16,
                    };
                    return ResponsiveGridCol(
                      lg: _lg,
                      md: _md,
                      child: Padding(
                        padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                        child: TextFieldLabelWrapper(
                          labelText: prop.key,
                          inputField: DropdownButtonFormField2(
                            menuItemStyleData: _dropdownStyle.menuItemStyle,
                            buttonStyleData: _dropdownStyle.buttonStyle,
                            iconStyleData: _dropdownStyle.iconStyle,
                            dropdownStyleData: _dropdownStyle.dropdownStyle,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: _xPadding,
                                vertical: _yPadding,
                              ),
                            ),
                            hint: Text(prop.key),
                            items: List.generate(
                              5,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text('Status ${index + 1}'),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    );
                  },
                ),

                //  Rounded Fields
                ...{
                  "Rounded SM": "SM",
                  "Rounded MD": "MD",
                  "Rounded LG": "LG",
                }.entries.map(
                  (prop) {
                    final double _xPadding = switch (prop.value) {
                      // "SM" => 16,
                      // "MD" => 16,
                      // "LG" => 16,
                      _ => 16,
                    };
                    final double _yPadding = switch (prop.value) {
                      "SM" => 4,
                      "MD" => 8,
                      "LG" => 12,
                      _ => 16,
                    };
                    return ResponsiveGridCol(
                      lg: _lg,
                      md: _md,
                      child: Padding(
                        padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                        child: TextFieldLabelWrapper(
                          labelText: prop.key,
                          inputField: DropdownButtonFormField2(
                            menuItemStyleData: _dropdownStyle.menuItemStyle,
                            buttonStyleData: _dropdownStyle.buttonStyle,
                            iconStyleData: _dropdownStyle.iconStyle,
                            dropdownStyleData: _dropdownStyle.dropdownStyle,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: _xPadding,
                                vertical: _yPadding,
                              ),
                              border: _inputFieldStyle.getRoundedBorder(),
                              enabledBorder: _inputFieldStyle.getRoundedBorder(
                                getRoundedBorderType:
                                    RoundedBorderType.enabledBorder,
                              ),
                              focusedBorder: _inputFieldStyle.getRoundedBorder(
                                getRoundedBorderType:
                                    RoundedBorderType.focusedBorder,
                              ),
                              errorBorder: _inputFieldStyle.getRoundedBorder(
                                getRoundedBorderType:
                                    RoundedBorderType.errorBorder,
                              ),
                              focusedErrorBorder:
                                  _inputFieldStyle.getRoundedBorder(
                                getRoundedBorderType:
                                    RoundedBorderType.focusedErrorBorder,
                              ),
                              disabledBorder: _inputFieldStyle.getRoundedBorder(
                                getRoundedBorderType:
                                    RoundedBorderType.disabledBorder,
                              ),
                            ),
                            hint: Text(prop.key),
                            items: List.generate(
                              5,
                              (index) => DropdownMenuItem(
                                value: index + 1,
                                child: Text('Status ${index + 1}'),
                              ),
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: _sizeInfo.innerSpacing),

          // Multiple select input
          ShadowContainer(
            headerText: 'Multiple select input',
            child: ResponsiveGridRow(
              children: [
                // Multi Select Dropdown Widget
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Default',
                      inputField: AcnooMultiSelectDropdown(
                        menuItemStyleData:
                            _dropdownStyle.multiSelectMenuItemStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Select Items',
                        ),
                        values: selectedDropdownItems,
                        items: List.generate(
                          50,
                          (index) => MultiSelectDropdownMenuItem(
                            value: index + 1,
                            labelText: 'Item ${index + 1}',
                          ),
                        ),
                        onChanged: (_) => setState(
                          () => selectedDropdownItems = _ ?? [],
                        ),
                      ),
                    ),
                  ),
                ),

                // Multi Select Text Field
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: const TextFieldLabelWrapper(
                      labelText: 'Input with Placeholder',
                      inputField: AcnooMultiSelectTextField(
                        decoration: InputDecoration(
                          hintText: 'Chose a city',
                        ),
                      ),
                    ),
                  ),
                ),

                // Multi Select Dropdown Widget
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Text inputs',
                      inputField: AcnooMultiSelectDropdown(
                        menuItemStyleData:
                            _dropdownStyle.multiSelectMenuItemStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        iconStyleData: _dropdownStyle.iconStyle.copyWith(
                          icon: const SizedBox.shrink(),
                        ),
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Select Items',
                        ),
                        values: selectedDropdownItems,
                        items: List.generate(
                          50,
                          (index) => MultiSelectDropdownMenuItem(
                            value: index + 1,
                            labelText: 'Item ${index + 1}',
                          ),
                        ),
                        onChanged: (_) => setState(
                          () => selectedDropdownItems = _ ?? [],
                        ),
                      ),
                    ),
                  ),
                ),

                // Multi Select Text Field
                ResponsiveGridCol(
                  lg: _lg + 2,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: const TextFieldLabelWrapper(
                      labelText: 'Text inputs',
                      inputField: AcnooMultiSelectTextField(
                        decoration: InputDecoration(
                          hintText: 'Select you status',
                        ),
                        showButtonAction: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _sizeInfo.innerSpacing),
        ],
      ),
    );
  }

  Widget _buildMenuList({
    required ThemeData theme,
    bool isScrollable = true,
    ScrollController? controller,
  }) {
    return ListView(
      padding: EdgeInsets.only(left: 8, top: 8, right: isScrollable ? 24 : 0),
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      controller: controller,
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      children: [
        "Open this select menu",
        "One",
        "Two",
        "Three",
        "eligendi dolore voluptate",
        "natus quia aut",
        "aliquam sint libero",
        "reiciendis rem voluptas",
        "repellendus eum eveniet",
        "doloribus et eos",
        "illo excepturi cupiditate",
        "sit sit aut",
        "autem optio velit",
        "quia explicabo possimus",
        "ipsum aspernatur id",
        "et ea quis",
        "rerum sint aliquid",
        "qui iste ratione",
        "debitis unde corrupti",
        "quia eos eum",
        "nihil porro est",
        "dolorem sunt corrupti",
        "quia necessitatibus molestiae",
        "qui molestiae quis",
      ].asMap().entries.map(
        (e) {
          final index = e.key;
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: index != 0 ? null : theme.colorScheme.surface,
            ),
            child: Text(
              e.value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onTertiary,
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}

class _SizeInfo {
  final double? fonstSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.fonstSize,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}
