import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/helpers/field_styles/field_styles.dart';
import '../../widgets/widgets.dart';

class FormValidationView extends StatefulWidget {
  const FormValidationView({super.key});

  @override
  State<FormValidationView> createState() => _FormValidationViewState();
}

class _FormValidationViewState extends State<FormValidationView> {
  final browserDefaultFormKey = GlobalKey<FormState>();
  bool isBrowserDefaultChecked = false;

  final customFormKey = GlobalKey<FormState>();
  bool isCustomFormChecked = false;

  @override
  Widget build(BuildContext context) {
    // final _theme = Theme.of(context);
    final _dropdownStyle = AcnooDropdownStyle(context);
    // final _inputFieldStyle = AcnooInputFieldStyles(context);
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
          // Browser Default Form
          Form(
            key: browserDefaultFormKey,
            child: ShadowContainer(
              headerText: 'Browser Defaults',
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: _lg + 2,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'First Name',
                        inputField: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your first name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Last Name
                  ResponsiveGridCol(
                    lg: _lg + 2,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'Last Name',
                        inputField: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your last name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Country Dropdown
                  ResponsiveGridCol(
                    lg: _lg,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'Country',
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: _dropdownStyle.menuItemStyle,
                          buttonStyleData: _dropdownStyle.buttonStyle,
                          iconStyleData: _dropdownStyle.iconStyle,
                          dropdownStyleData: _dropdownStyle.dropdownStyle,
                          hint: const Text('Select Country'),
                          items: [
                            "Canada",
                            "Brazil",
                            "Germany",
                            "Australia",
                            "Japan",
                            "India",
                            "South Africa",
                            "Mexico",
                            "France",
                            "South Korea"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your country';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // City Dropdown
                  ResponsiveGridCol(
                    lg: _lg,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'City',
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: _dropdownStyle.menuItemStyle,
                          buttonStyleData: _dropdownStyle.buttonStyle,
                          iconStyleData: _dropdownStyle.iconStyle,
                          dropdownStyleData: _dropdownStyle.dropdownStyle,
                          hint: const Text('Select City'),
                          items: [
                            "Toronto",
                            "São Paulo",
                            "Berlin",
                            "Sydney",
                            "Tokyo",
                            "Mumbai",
                            "Cape Town",
                            "Mexico City",
                            "Paris",
                            "Seoul"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your city';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // State Dropdown
                  ResponsiveGridCol(
                    lg: _lg,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'State',
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: _dropdownStyle.menuItemStyle,
                          buttonStyleData: _dropdownStyle.buttonStyle,
                          iconStyleData: _dropdownStyle.iconStyle,
                          dropdownStyleData: _dropdownStyle.dropdownStyle,
                          hint: const Text('Select State'),
                          items: [
                            "Ontario",
                            "São Paulo",
                            "Berlin",
                            "New South Wales",
                            "Tokyo Metropolis",
                            "Maharashtra",
                            "Western Cape",
                            "Mexico City",
                            "Île-de-France",
                            "Seoul Capital Area"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your state';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Check Box
                  ResponsiveGridCol(
                    lg: 12,
                    md: 12,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AcnooCheckBoxFormField(
                        title: const Text('Agree to terms and conditions'),
                        validator: (value) {
                          if (value == null || !value) {
                            return 'Please check this box to continue';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),

                  // Save Form Button
                  ResponsiveGridCol(
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: ElevatedButton(
                        onPressed: () {
                          if (browserDefaultFormKey.currentState?.validate() ==
                              true) {
                            browserDefaultFormKey.currentState?.save();
                          }
                        },
                        child: const Text('Save From'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: _sizeInfo.innerSpacing),

          // Custom Form
          Form(
            key: customFormKey,
            child: ShadowContainer(
              headerText: 'Custom Styles',
              child: ResponsiveGridRow(
                children: [
                  // First Name
                  ResponsiveGridCol(
                    lg: _lg + 2,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'First Name',
                        inputField: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your first name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Last Name
                  ResponsiveGridCol(
                    lg: _lg + 2,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'Last Name',
                        inputField: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter your last name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Country Dropdown
                  ResponsiveGridCol(
                    lg: _lg,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'Country',
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: _dropdownStyle.menuItemStyle,
                          buttonStyleData: _dropdownStyle.buttonStyle,
                          iconStyleData: _dropdownStyle.iconStyle,
                          dropdownStyleData: _dropdownStyle.dropdownStyle,
                          hint: const Text('Select Country'),
                          items: [
                            "Canada",
                            "Brazil",
                            "Germany",
                            "Australia",
                            "Japan",
                            "India",
                            "South Africa",
                            "Mexico",
                            "France",
                            "South Korea"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your country';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // City Dropdown
                  ResponsiveGridCol(
                    lg: _lg,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'City',
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: _dropdownStyle.menuItemStyle,
                          buttonStyleData: _dropdownStyle.buttonStyle,
                          iconStyleData: _dropdownStyle.iconStyle,
                          dropdownStyleData: _dropdownStyle.dropdownStyle,
                          hint: const Text('Select City'),
                          items: [
                            "Toronto",
                            "São Paulo",
                            "Berlin",
                            "Sydney",
                            "Tokyo",
                            "Mumbai",
                            "Cape Town",
                            "Mexico City",
                            "Paris",
                            "Seoul"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your city';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // State Dropdown
                  ResponsiveGridCol(
                    lg: _lg,
                    md: _md,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: TextFieldLabelWrapper(
                        labelText: 'State',
                        inputField: DropdownButtonFormField2(
                          menuItemStyleData: _dropdownStyle.menuItemStyle,
                          buttonStyleData: _dropdownStyle.buttonStyle,
                          iconStyleData: _dropdownStyle.iconStyle,
                          dropdownStyleData: _dropdownStyle.dropdownStyle,
                          hint: const Text('Select State'),
                          items: [
                            "Ontario",
                            "São Paulo",
                            "Berlin",
                            "New South Wales",
                            "Tokyo Metropolis",
                            "Maharashtra",
                            "Western Cape",
                            "Mexico City",
                            "Île-de-France",
                            "Seoul Capital Area"
                          ]
                              .map(
                                (country) => DropdownMenuItem(
                                  value: country,
                                  child: Text(country),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {},
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your state';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                    ),
                  ),

                  // Check Box
                  ResponsiveGridCol(
                    lg: 12,
                    md: 12,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AcnooCheckBoxFormField(
                        title: const Text('Agree to terms and conditions'),
                        validator: (value) {
                          if (value == null || !value) {
                            return 'Please check this box to continue';
                          }
                          return null;
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                  ),

                  // Save Form Button
                  ResponsiveGridCol(
                    lg: 2,
                    md: 3,
                    xl: 2,
                    child: Padding(
                      padding: EdgeInsets.all(_sizeInfo.innerSpacing / 2),
                      child: ElevatedButton(
                        onPressed: () {
                          if (customFormKey.currentState?.validate() == true) {
                            customFormKey.currentState?.save();
                          }
                        },
                        child: const Text('Save From'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
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
