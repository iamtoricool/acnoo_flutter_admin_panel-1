import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../../core/helpers/field_styles/field_styles.dart';
import '../../../../widgets/widgets.dart';

class AICodePromptForm extends StatefulWidget {
  const AICodePromptForm({
    super.key,
    this.onFormSubmit,
  });
  final void Function()? onFormSubmit;

  @override
  State<AICodePromptForm> createState() => _AICodePromptFormState();
}

class _AICodePromptFormState extends State<AICodePromptForm> {
  List<String> programmingLanguages = [
    'Dart',
    'Python',
    'Java',
    'JavaScript',
    'C++',
    'C#',
    'Ruby',
    'Swift',
    'Kotlin',
    'Go',
    'Rust',
    'PHP',
    'TypeScript',
    'R',
    'MATLAB',
    'Objective-C',
    'Scala',
    'Perl',
    'Lua',
    'Haskell',
    'Elixir',
    'Erlang',
    'Clojure',
    'F#',
    'Shell',
    'SQL',
    'HTML',
    'CSS',
    'Visual Basic',
    'Assembly',
  ];
  List<String> codingLevels = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Expert',
    'Novice',
    'Junior',
    'Mid-Level',
    'Senior',
    'Proficient',
    'Master',
    'Lead',
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _dropdownStyle = AcnooDropdownStyle(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Field
        TextFieldLabelWrapper(
          label: Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Title',
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: _theme.colorScheme.errorContainer,
                        ),
                      ),
                    ],
                  ),
                  style: _theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '0/8',
                style: _theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          inputField: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter title',
            ),
          ),
        ),
        const SizedBox.square(dimension: 24),

        // Programing Language Dropdown
        TextFieldLabelWrapper(
          label: Text.rich(
            TextSpan(
              text: 'Programing Language',
              children: [
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: _theme.colorScheme.errorContainer,
                  ),
                ),
              ],
            ),
            style: _theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          inputField: DropdownButtonFormField2(
            style: _dropdownStyle.textStyle,
            iconStyleData: _dropdownStyle.iconStyle,
            buttonStyleData: _dropdownStyle.buttonStyle,
            dropdownStyleData: _dropdownStyle.dropdownStyle,
            menuItemStyleData: _dropdownStyle.menuItemStyle,
            isExpanded: true,
            selectedItemBuilder: (ctx) {
              return _buildDropdownSelectedItem(
                ctx,
                items: programmingLanguages,
              );
            },
            value: programmingLanguages.firstOrNull,
            items: programmingLanguages.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ),
        const SizedBox.square(dimension: 24),

        // Coding Level Dropdown
        TextFieldLabelWrapper(
          labelText: 'Coding Level',
          inputField: DropdownButtonFormField2(
            style: _dropdownStyle.textStyle,
            iconStyleData: _dropdownStyle.iconStyle,
            buttonStyleData: _dropdownStyle.buttonStyle,
            dropdownStyleData: _dropdownStyle.dropdownStyle,
            menuItemStyleData: _dropdownStyle.menuItemStyle,
            isExpanded: true,
            selectedItemBuilder: (ctx) {
              return _buildDropdownSelectedItem(
                ctx,
                items: codingLevels,
              );
            },
            value: codingLevels.firstOrNull,
            items: codingLevels.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {},
          ),
        ),
        const SizedBox.square(dimension: 24),

        // Title Field
        TextFieldLabelWrapper(
          label: Row(
            children: [
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Description',
                    children: [
                      TextSpan(
                        text: '*',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: _theme.colorScheme.errorContainer,
                        ),
                      ),
                    ],
                  ),
                  style: _theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '0/250',
                style: _theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          inputField: const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Describe what kind of code you need...',
            ),
          ),
        ),

        const SizedBox.square(dimension: 24),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              textStyle:
                  _theme.elevatedButtonTheme.style?.textStyle?.resolve({}),
            ),
            child: const Text('Apply'),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDropdownSelectedItem(
    BuildContext context, {
    List<String> items = const [],
    TextStyle? style,
  }) {
    final ThemeData(:textTheme) = Theme.of(context);

    return items.map((item) {
      return Text(
        item,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: style ?? textTheme.bodyLarge,
      );
    }).toList();
  }
}
