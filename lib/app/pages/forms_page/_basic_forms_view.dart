import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/helpers/field_styles/field_styles.dart';
import '../../core/static/static.dart';
import '../../widgets/widgets.dart';

class BasicFormsView extends StatefulWidget {
  const BasicFormsView({super.key});

  @override
  State<BasicFormsView> createState() => _BasicFormsViewState();
}

class _BasicFormsViewState extends State<BasicFormsView> {
  // Field State Props
  bool _obscureText = true;
  late final _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
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
          // Input Example
          ShadowContainer(
            headerText: 'Input Example',
            child: ResponsiveGridRow(
              children: [
                ...{
                  "Basic Input": null,
                  "Input with Placeholder": "Placeholder",
                  "Input with Value": "Input Value",
                }.entries.map(
                      (prop) => ResponsiveGridCol(
                        lg: _lg,
                        md: _md,
                        child: Padding(
                          padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                          child: TextFieldLabelWrapper(
                            labelText: prop.key,
                            inputField: TextFormField(
                              decoration: InputDecoration(hintText: prop.value),
                            ),
                          ),
                        ),
                      ),
                    ),

                // Dropdown Widget
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input With Select',
                      inputField: DropdownButtonFormField2(
                        menuItemStyleData: _dropdownStyle.menuItemStyle,
                        buttonStyleData: _dropdownStyle.buttonStyle,
                        iconStyleData: _dropdownStyle.iconStyle,
                        dropdownStyleData: _dropdownStyle.dropdownStyle,
                        hint: const Text('Select'),
                        items: List.generate(
                          5,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text('Dropdown ${index + 1}'),
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),

                // Disabled Input
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Disabled Input',
                      inputField: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Disabled Input',
                          filled: true,
                          fillColor: _theme.colorScheme.tertiaryContainer,
                        ),
                      ),
                    ),
                  ),
                ),

                // Input With Icon
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input with Icon',
                      inputField: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Input with Icon',
                          prefixIcon: const Icon(
                            IconlyLight.message,
                            size: 20,
                          ),
                          prefixIconConstraints:
                              _inputFieldStyle.iconConstraints,
                        ),
                      ),
                    ),
                  ),
                ),

                // Input with Icon Right
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input with Icon Right',
                      inputField: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Input with Icon Right',
                          suffixIcon: const Icon(
                            IconlyLight.profile,
                            size: 20,
                          ),
                          suffixIconConstraints:
                              _inputFieldStyle.iconConstraints,
                        ),
                      ),
                    ),
                  ),
                ),

                //  Password Field
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return TextFieldLabelWrapper(
                          labelText: 'Input Password',
                          inputField: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscureText,
                            obscuringCharacter: '*',
                            decoration: InputDecoration(
                              hintText: 'Input Password',
                              suffixIcon: IconButton(
                                onPressed: () => setState(
                                  () => _obscureText = !_obscureText,
                                ),
                                padding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                icon: Icon(
                                  _obscureText
                                      ? FeatherIcons.eye
                                      : FeatherIcons.eyeOff,
                                  size: 20,
                                ),
                              ),
                              suffixIconConstraints:
                                  _inputFieldStyle.iconConstraints,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                //  Date Input Field
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input Date',
                      inputField: TextFormField(
                        controller: _dateController,
                        keyboardType: TextInputType.visiblePassword,
                        readOnly: true,
                        selectionControls: EmptyTextSelectionControls(),
                        decoration: InputDecoration(
                          hintText: 'mm/dd/yyyy',
                          suffixIcon:
                              const Icon(IconlyLight.calendar, size: 20),
                          suffixIconConstraints:
                              _inputFieldStyle.iconConstraints,
                        ),
                        onTap: () async {
                          final _result = await showDatePicker(
                            context: context,
                            firstDate: AppDateConfig.appFirstDate,
                            lastDate: AppDateConfig.appLastDate,
                            initialDate: DateTime.now(),
                            builder: (context, child) => Theme(
                              data: _theme.copyWith(
                                datePickerTheme: DatePickerThemeData(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              child: child!,
                            ),
                          );

                          if (_result != null) {
                            // setState(() => )
                            _dateController.text = DateFormat(
                                    AppDateConfig.appNumberOnlyDateFormat)
                                .format(_result);
                          }
                        },
                      ),
                    ),
                  ),
                ),

                // Rounded Input
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Rounded Input',
                      inputField: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          hintText: 'Rounded Input',
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
                      ),
                    ),
                  ),
                ),

                // Input Border Style
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Input Border Style',
                      inputField: TextFormField(
                        decoration: const InputDecoration(
                          // TODO: Fix Dashed Border Later
                          hintText: 'Input Border Style',
                        ),
                      ),
                    ),
                  ),
                ),

                // Example Textarea
                ResponsiveGridCol(
                  lg: _lg,
                  md: _md,
                  child: Padding(
                    padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                    child: TextFieldLabelWrapper(
                      labelText: 'Example Textarea',
                      inputField: TextFormField(
                        maxLines: 2,
                        decoration: const InputDecoration(
                          hintText: 'Example Textarea',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _sizeInfo.innerSpacing),

          // Input Sizing
          ShadowContainer(
            headerText: 'Input Sizing',
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
                          inputField: TextFormField(
                            decoration: InputDecoration(
                              hintText: prop.key,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: _xPadding,
                                vertical: _yPadding,
                              ),
                            ),
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
                          inputField: TextFormField(
                            decoration: InputDecoration(
                              hintText: prop.key,
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

          // File Input
          ShadowContainer(
            headerText: 'File Input',
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
                          inputField: AcnooFileInputField(
                            onTap: () {},
                            decoration: InputDecoration(
                              hintText: prop.key,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: _xPadding,
                                vertical: _yPadding,
                              ),
                            ),
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
                          inputField: AcnooFileInputField(
                            onTap: () {},
                            decoration: InputDecoration(
                              hintText: prop.key,
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
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
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
