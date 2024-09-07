part of '../kanban_view.dart';

class AddKanbanProjectDialog extends StatefulWidget {
  const AddKanbanProjectDialog({super.key});

  @override
  State<AddKanbanProjectDialog> createState() => _AddKanbanProjectDialogState();
}

class _AddKanbanProjectDialogState extends State<AddKanbanProjectDialog> {
  // Form Field Props
  final _formKey = GlobalKey<FormState>();
  late final projectNameController = TextEditingController();
  DateTime startDate = DateTime.now();
  late final startDateController = TextEditingController();

  late final endDateController = TextEditingController();
  DateTime endDate = DateTime.now().add(const Duration(days: 2));

  late final descriptionController = TextEditingController();

  Future<DateTime?> getDatePicker(TextEditingController controller) async {
    final _result = await showDatePicker(
      context: context,
      firstDate: AppDateConfig.appFirstDate,
      initialDate: DateTime.now(),
      lastDate: AppDateConfig.appLastDate,
    );

    if (_result != null) {
      controller.text = DateFormat(AppDateConfig.appMonthNameDateFormat).format(
        _result,
      );
      return _result;
    }

    return null;
  }

  List<TaskEmployee> selectedEmployees = [];

  @override
  Widget build(BuildContext context) {
    final _isMobile = responsiveValue<bool>(
      context,
      xs: true,
      sm: true,
      md: false,
      lg: false,
      xl: false,
    );

    final _dropdownStyle = AcnooDropdownStyle(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 610),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              const DialogHeader(headerTitle: 'Create Project'),

              // Form
              Flexible(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(_isMobile ? 10 : 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Project Name
                        TextFieldLabelWrapper(
                          labelText: 'Project Name',
                          inputField: TextFormField(
                            controller: projectNameController,
                            decoration: const InputDecoration(
                              hintText: 'Enter project name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter project name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Assign To
                        TextFieldLabelWrapper(
                          labelText: 'Assign To',
                          inputField: AcnooMultiSelectDropdown<TaskEmployee>(
                            iconStyleData: _dropdownStyle.iconStyle,
                            buttonStyleData: _dropdownStyle.buttonStyle,
                            dropdownStyleData: _dropdownStyle.dropdownStyle,
                            menuItemStyleData: _dropdownStyle.menuItemStyle,
                            values: selectedEmployees,
                            items: taskEmployee
                                .map(
                                  (e) =>
                                      MultiSelectDropdownMenuItem<TaskEmployee>(
                                    labelText: e.userName,
                                    value: e,
                                  ),
                                )
                                .toList(),
                            onChanged: (values) => setState(() {
                              selectedEmployees.clear();
                              selectedEmployees.addAll(values ?? []);
                            }),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Start & End Date
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TextFieldLabelWrapper(
                                labelText: 'Start Date',
                                inputField: TextFormField(
                                  readOnly: true,
                                  controller: startDateController,
                                  onTap: () async {
                                    final _result = await getDatePicker(
                                      startDateController,
                                    );

                                    if (_result != null) {
                                      setState(() => startDate = _result);
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Select start Date',
                                    suffixIcon: Icon(IconlyLight.calendar),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select start date';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextFieldLabelWrapper(
                                labelText: 'End Date',
                                inputField: TextFormField(
                                  readOnly: true,
                                  controller: endDateController,
                                  onTap: () async {
                                    final _result = await getDatePicker(
                                      endDateController,
                                    );

                                    if (_result != null) {
                                      setState(() => endDate = _result);
                                    }
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Select end Date',
                                    suffixIcon: Icon(IconlyLight.calendar),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select end date';
                                    }

                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Description
                        TextFieldLabelWrapper(
                          labelText: 'Description',
                          inputField: TextFormField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              hintText: 'Enter here...',
                            ),
                            maxLines: 3,
                          ),
                        ),
                        SizedBox(height: _isMobile ? 8 : 24),
                      ],
                    ),
                  ),
                ),
              ),

              // Action Buttons
              Padding(
                padding: _isMobile
                    ? const EdgeInsets.fromLTRB(10, 0, 10, 10)
                    : const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(color: Colors.red),
                          foregroundColor: Colors.red,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ),
                    SizedBox(width: _isMobile ? 16 : 24),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            final _result = KanbanTaskItem(
                              generateRandomString(),
                              title: projectNameController.text,
                              description: descriptionController.text,
                              startDate: startDate,
                              endDate: endDate,
                              users: selectedEmployees,
                            );

                            Navigator.pop<KanbanTaskItem>(context, _result);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddKanbanBoardDialog extends StatefulWidget {
  const AddKanbanBoardDialog({super.key});

  @override
  State<AddKanbanBoardDialog> createState() => _AddKanbanBoardDialogState();
}

class _AddKanbanBoardDialogState extends State<AddKanbanBoardDialog> {
  final _formKey = GlobalKey<FormState>();
  late final boardNameController = TextEditingController();
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _isMobile = responsiveValue<bool>(
      context,
      xs: true,
      sm: true,
      md: false,
      lg: false,
      xl: false,
    );

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 610),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              const DialogHeader(headerTitle: 'Create New Board'),

              // Form
              Flexible(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(_isMobile ? 10 : 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Board Name
                        TextFieldLabelWrapper(
                          labelText: 'Board Name',
                          inputField: TextFormField(
                            controller: boardNameController,
                            decoration: const InputDecoration(
                              hintText: 'Enter board name',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter board name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Select Color
                        TextFieldLabelWrapper(
                          labelText: 'Select Color',
                          inputField: InkWell(
                            onTap: () async {
                              final _result = await showColorPickerDialog(
                                context,
                                _theme.primaryColor,
                              );

                              setState(() => selectedColor = _result);
                            },
                            child: InputDecorator(
                              decoration: const InputDecoration(),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 8,
                                ),
                                height: 18,
                                decoration: BoxDecoration(
                                  color: selectedColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),

              // Action Buttons
              Padding(
                padding: _isMobile
                    ? const EdgeInsets.fromLTRB(10, 0, 10, 10)
                    : const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(color: Colors.red),
                          foregroundColor: Colors.red,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ),
                    SizedBox(width: _isMobile ? 16 : 24),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            final _result = AppFlowyGroupData<Color>(
                              id: generateRandomString(),
                              name: boardNameController.text,
                              customData: selectedColor,
                              items: [],
                            );

                            Navigator.pop(context, _result);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class KanbanTaskViewerDialog extends StatelessWidget {
  const KanbanTaskViewerDialog({
    super.key,
    required this.item,
  });
  final KanbanTaskItem item;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final _hoursDifference = item.endDate.difference(DateTime.now()).inHours;
    final _daysLeft =
        (_hoursDifference / 24).floor() + ((_hoursDifference % 24) > 1 ? 1 : 0);

    final _fontSize = responsiveValue<double>(
      context,
      xs: 12,
      sm: 12,
      md: 14,
      lg: 16,
    );

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 610),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              const DialogHeader(headerTitle: 'View Details'),

              // Task Details
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 4, 24, 16),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final _size = constraints.biggest;

                    return Column(
                      children: [
                        ...{
                          "Project Name": item.title,
                          "Start date":
                              DateFormat(AppDateConfig.appMonthNameDateFormat)
                                  .format(item.startDate),
                          "End date":
                              DateFormat(AppDateConfig.appMonthNameDateFormat)
                                  .format(item.endDate),
                          "Assigned to":
                              item.users.map((e) => e.userName).join(', '),
                          "Progress":
                              "${(calculateTimeElapsedPercentage(item.startDate, item.endDate) * 100).toStringAsFixed(2)}%",
                          "Duration ":
                              "$_daysLeft ${_daysLeft <= 1 ? 'day' : 'days'} left",
                          "Description": item.description,
                        }.entries.map(
                              (info) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: _size.width *
                                          responsiveValue<double>(
                                            context,
                                            xs: 0.375,
                                            sm: 0.375,
                                            md: 0.25,
                                            lg: 0.225,
                                          ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            info.key,
                                            style: _theme.textTheme.bodyLarge
                                                ?.copyWith(
                                              fontSize: _fontSize,
                                              color: _theme
                                                  .checkboxTheme.side?.color,
                                            ),
                                          ),
                                          Text(
                                            ':',
                                            style: _theme.textTheme.bodyLarge
                                                ?.copyWith(
                                              fontSize: _fontSize,
                                              color: _theme
                                                  .checkboxTheme.side?.color,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: Text(
                                        info.value,
                                        style: _theme.textTheme.bodyLarge
                                            ?.copyWith(
                                          fontSize: _fontSize,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateTimeElapsedPercentage(DateTime startDate, DateTime endDate) {
    DateTime now = DateTime.now();

    if (now.isBefore(startDate)) now = startDate;
    if (now.isAfter(endDate)) now = endDate;

    Duration totalDuration = endDate.difference(startDate);
    Duration elapsedTime = now.difference(startDate);

    double percentageElapsed =
        elapsedTime.inMilliseconds / totalDuration.inMilliseconds;

    return percentageElapsed.clamp(0.0, 1.0);
  }
}
