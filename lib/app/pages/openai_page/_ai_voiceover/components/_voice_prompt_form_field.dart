import 'package:flutter/material.dart';

import 'package:country_flags/country_flags.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../../core/helpers/field_styles/field_styles.dart';
import '../../../../widgets/widgets.dart';

class AIVoicePromptForm extends StatefulWidget {
  const AIVoicePromptForm({
    super.key,
    this.onFormSubmit,
  });
  final void Function()? onFormSubmit;

  @override
  State<AIVoicePromptForm> createState() => _AIVoicePromptFormState();
}

class _AIVoicePromptFormState extends State<AIVoicePromptForm> {
  final supportedLanguages = {
    "English": "US",
    "Bangla": "BD",
  };

  final voices = {
    "US-Male": "English (United States) Male",
    "US-Female": "English (United States) Female",
    "GB-Male": "English (United Kingdom) Male",
    "GB-Female": "English (United Kingdom) Female",
    "FR-Male": "French (France) Male",
    "FR-Female": "French (France) Female",
    "ES-Male": "Spanish (Spain) Male",
    "ES-Female": "Spanish (Spain) Female",
    "DE-Male": "German (Germany) Male",
    "DE-Female": "German (Germany) Female",
    "IT-Male": "Italian (Italy) Male",
    "IT-Female": "Italian (Italy) Female",
    "JP-Male": "Japanese (Japan) Male",
    "JP-Female": "Japanese (Japan) Female",
    "KR-Male": "Korean (South Korea) Male",
    "KR-Female": "Korean (South Korea) Female",
    "BR-Male": "Portuguese (Brazil) Male",
    "BR-Female": "Portuguese (Brazil) Female",
    "RU-Male": "Russian (Russia) Male",
    "RU-Female": "Russian (Russia) Female",
    "CN-Male": "Chinese (China) Male",
    "CN-Female": "Chinese (China) Female",
  };

  final speakingStyle = [
    "Narration",
    "Conversational",
    "Formal",
    "Casual",
    "Excited",
    "Calm",
    "Serious",
    "Friendly",
    "Inspirational",
    "Persuasive",
    "Sad",
    "Joyful",
    "Neutral",
    "Authoritative",
    "Warm",
    "Playful",
    "Dramatic",
    "Clear",
    "Empathetic",
    "Instructional"
  ];

  final downloadableFiles = [
    'mp3',
    'wav',
    'aac',
    'ogg',
    'flac',
    'm4a',
    'wma',
    'opus',
    'alac',
    'aiff',
  ];

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _dropdownStyle = AcnooDropdownStyle(context);
    final _mqSize = MediaQuery.sizeOf(context);
    final _addHorizontalPadding = _mqSize.width >= 576;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Generative Form
        Form(
          child: ResponsiveGridRow(
            children: [
              // File Name
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: TextFieldLabelWrapper(
                    labelText: 'File Name',
                    inputField: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter File Name',
                      ),
                    ),
                  ),
                ),
              ),

              // Language
              ResponsiveGridCol(
                md: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    12,
                    _addHorizontalPadding ? 12 : 0,
                    12,
                  ),
                  child: TextFieldLabelWrapper(
                    label: Text.rich(
                      TextSpan(
                        text: 'Language',
                        children: [
                          TextSpan(
                            text: '*',
                            style: TextStyle(
                              color: _theme.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                      style: _theme.inputDecorationTheme.floatingLabelStyle,
                    ),
                    inputField: DropdownButtonFormField2(
                      style: _dropdownStyle.textStyle,
                      iconStyleData: _dropdownStyle.iconStyle,
                      buttonStyleData: _dropdownStyle.buttonStyle,
                      dropdownStyleData: _dropdownStyle.dropdownStyle,
                      menuItemStyleData: _dropdownStyle.menuItemStyle,
                      isExpanded: true,
                      value: supportedLanguages.entries.firstOrNull?.key,
                      items: supportedLanguages.entries
                          .map((item) => DropdownMenuItem(
                                value: item.key,
                                child: Row(
                                  children: [
                                    CountryFlag.fromCountryCode(
                                      item.value,
                                      height: 24,
                                      width: 30,
                                      shape: const RoundedRectangle(2),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(item.key),
                                  ],
                                ),
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),

              // Voices
              ResponsiveGridCol(
                md: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    _addHorizontalPadding ? 12 : 0,
                    12,
                    0,
                    12,
                  ),
                  child: TextFieldLabelWrapper(
                    labelText: 'Voices',
                    inputField: DropdownButtonFormField2(
                      style: _dropdownStyle.textStyle,
                      iconStyleData: _dropdownStyle.iconStyle,
                      buttonStyleData: _dropdownStyle.buttonStyle,
                      dropdownStyleData: _dropdownStyle.dropdownStyle,
                      menuItemStyleData: _dropdownStyle.menuItemStyle,
                      isExpanded: true,
                      value: voices.entries.firstOrNull?.key,
                      items: voices.entries.map((item) {
                        final _flagCode = item.key.split('-').take(1).join();
                        return DropdownMenuItem(
                          value: item.key,
                          child: Row(
                            children: [
                              CountryFlag.fromCountryCode(
                                _flagCode,
                                height: 24,
                                width: 30,
                                shape: const RoundedRectangle(2),
                              ),
                              const SizedBox(width: 8),
                              Flexible(child: Text(item.value)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),

              // Speaking Style
              ResponsiveGridCol(
                md: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    12,
                    _addHorizontalPadding ? 12 : 0,
                    12,
                  ),
                  child: TextFieldLabelWrapper(
                    labelText: 'Speaking Style',
                    inputField: DropdownButtonFormField2(
                      style: _dropdownStyle.textStyle,
                      iconStyleData: _dropdownStyle.iconStyle,
                      buttonStyleData: _dropdownStyle.buttonStyle,
                      dropdownStyleData: _dropdownStyle.dropdownStyle,
                      menuItemStyleData: _dropdownStyle.menuItemStyle,
                      isExpanded: true,
                      value: speakingStyle.firstOrNull,
                      items: speakingStyle
                          .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ))
                          .toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),

              // Pause
              ResponsiveGridCol(
                md: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    _addHorizontalPadding ? 12 : 0,
                    12,
                    0,
                    12,
                  ),
                  child: TextFieldLabelWrapper(
                    labelText: 'Pause',
                    inputField: DropdownButtonFormField2(
                      style: _dropdownStyle.textStyle,
                      iconStyleData: _dropdownStyle.iconStyle,
                      buttonStyleData: _dropdownStyle.buttonStyle,
                      dropdownStyleData: _dropdownStyle.dropdownStyle,
                      menuItemStyleData: _dropdownStyle.menuItemStyle,
                      isExpanded: true,
                      hint: const Text('Select One'),
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                          value: index,
                          child: Text('${index + 1} Second'),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),

              // Download Fiels
              ResponsiveGridCol(
                md: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    12,
                    _addHorizontalPadding ? 12 : 0,
                    12,
                  ),
                  child: TextFieldLabelWrapper(
                    labelText: 'Download Fiels',
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
                          items: downloadableFiles,
                        );
                      },
                      value: downloadableFiles.first,
                      items: downloadableFiles.map((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),

              // Speed
              ResponsiveGridCol(
                md: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    _addHorizontalPadding ? 12 : 0,
                    12,
                    0,
                    12,
                  ),
                  child: TextFieldLabelWrapper(
                    labelText: 'Speed',
                    inputField: DropdownButtonFormField2(
                      style: _dropdownStyle.textStyle,
                      iconStyleData: _dropdownStyle.iconStyle,
                      buttonStyleData: _dropdownStyle.buttonStyle,
                      dropdownStyleData: _dropdownStyle.dropdownStyle,
                      menuItemStyleData: _dropdownStyle.menuItemStyle,
                      isExpanded: true,
                      hint: const Text('Select One'),
                      items: List.generate(
                        10,
                        (index) => DropdownMenuItem(
                          value: index,
                          child: Text('${index + 1} Second'),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),

              // Submit Button
              ResponsiveGridCol(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 12),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      textStyle: _theme.elevatedButtonTheme.style?.textStyle
                          ?.resolve({})?.copyWith(),
                    ),
                    child: const Text('Generate'),
                  ),
                ),
              ),
            ],
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
