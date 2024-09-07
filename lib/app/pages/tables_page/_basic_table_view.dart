import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../core/theme/_app_colors.dart';
import '../../widgets/avatars/_avatar_widget.dart';
import '../../widgets/shadow_container/_shadow_container.dart';
import '../dragndrop_page/dragndrop_view.dart';

class BasicTableView extends StatefulWidget {
  const BasicTableView({super.key});

  @override
  State<BasicTableView> createState() => _BasicTableViewState();
}

class _BasicTableViewState extends State<BasicTableView> {
  bool _selectAll = false;
  final List<User> _users = [
    User(isSelected: false, id: 1, name: 'Alice Smith', phone: '123-456-7890', position: 'Manager'),
    User(isSelected: false, id: 2, name: 'Bob Johnson', phone: '234-567-8901', position: 'Developer'),
    User(isSelected: false, id: 3, name: 'Charlie Brown', phone: '345-678-9012', position: 'Designer'),
    User(isSelected: false, id: 4, name: 'David Wilson', phone: '456-789-0123', position: 'Analyst'),
    User(isSelected: false, id: 5, name: 'Eve Davis', phone: '567-890-1234', position: 'Tester'),
  ];

  void _selectAllRows(bool select) {
    setState(() {
      _selectAll = select;
      for (var user in _users) {
        user.isSelected = select;
      }
    });
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textTheme = theme.textTheme;
    final _padding = responsiveValue<double>(
      context,
      xs: 16 / 2,
      sm: 16 / 2,
      md: 16 / 2,
      lg: 24 / 2,
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(_padding),
        child: ResponsiveGridRow(
          children: [
            ///-----------------------------Table_Head
            tableHead(_padding, context, theme, textTheme),

            ///-----------------------------Bordered_Table
            tableBorder(_padding, context, theme, textTheme),

            ///-----------------------------Borderless_Table
            ResponsiveGridCol(
              lg: 6,
              child: Padding(
                padding: EdgeInsets.all(_padding),
                child: ShadowContainer(
                  padding: EdgeInsets.all(_padding),
                  headerText: 'Bordered Table',
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: Theme(
                            data: ThemeData(
                              dividerColor: Colors.transparent,
                              dividerTheme: const DividerThemeData(color: Colors.transparent),
                              checkboxTheme: CheckboxThemeData(
                                side: BorderSide(
                                  color: theme.colorScheme.outline,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: DataTable(
                              border: const TableBorder.symmetric(outside: BorderSide.none, inside: BorderSide.none),
                              horizontalMargin: 16,
                              dividerThickness: 0.0, // Remove horizontal dividers
                              headingTextStyle: textTheme.titleMedium,
                              dataTextStyle: textTheme.bodySmall,
                              headingRowColor: WidgetStateProperty.all(Colors.transparent),
                              columns: [
                                DataColumn(
                                  label: Row(
                                    children: [
                                      Checkbox(
                                        value: _selectAll,
                                        onChanged: (value) {
                                          _selectAllRows(value ?? false);
                                        },
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Text('SL.'),
                                    ],
                                  ),
                                ),
                                const DataColumn(label: Text('Name')),
                                const DataColumn(label: Text('Phone')),
                                const DataColumn(label: Text('Position')),
                              ],
                              rows: _users.map(
                                (user) {
                                  return DataRow(
                                    selected: user.isSelected,
                                    cells: [
                                      DataCell(
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: user.isSelected,
                                              onChanged: (selected) {
                                                setState(() {
                                                  user.isSelected = selected ?? false;
                                                  _selectAll = _users.every((u) => u.isSelected);
                                                });
                                              },
                                            ),
                                            const SizedBox(width: 12.0),
                                            Text(
                                              user.id.toString(),
                                              style: textTheme.bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(Text(
                                        user.name,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.phone,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.position,
                                        style: textTheme.bodyMedium,
                                      )),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            ///-----------------------------Striped_Table
            ResponsiveGridCol(
              lg: 6,
              child: Padding(
                padding: EdgeInsets.all(_padding),
                child: ShadowContainer(
                  padding: EdgeInsets.only(bottom: _padding + _padding),
                  headerText: 'Striped Rows',
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: Theme(
                            data: ThemeData(
                              dividerColor: Colors.transparent,
                              dividerTheme: const DividerThemeData(
                                color: Colors.transparent,
                              ),
                              checkboxTheme: CheckboxThemeData(
                                side: BorderSide(
                                  color: theme.colorScheme.outline,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: DataTable(
                              dividerThickness: 1,
                              headingTextStyle: textTheme.titleMedium,
                              dataTextStyle: textTheme.bodySmall,
                              horizontalMargin: 16.0,
                              headingRowColor: WidgetStateProperty.all(theme.colorScheme.surface),
                              columns: [
                                DataColumn(
                                  label: Row(
                                    children: [
                                      Checkbox(
                                        value: _selectAll,
                                        onChanged: (value) {
                                          _selectAllRows(value ?? false);
                                        },
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Text('SL.'),
                                    ],
                                  ),
                                ),
                                const DataColumn(label: Text('Name')),
                                const DataColumn(label: Text('Phone')),
                                const DataColumn(label: Text('Position')),
                              ],
                              rows: _users.asMap().entries.map(
                                (entry) {
                                  final index = entry.key;
                                  final user = entry.value;

                                  return DataRow(
                                    color: WidgetStateProperty.resolveWith<Color?>(
                                      (Set<WidgetState> states) {
                                        // Apply grey color for even rows and white color for odd rows
                                        return index.isEven
                                            ? theme.colorScheme.primaryContainer // Grey for even rows
                                            : theme.colorScheme.surface; // White for odd rows
                                      },
                                    ),
                                    selected: user.isSelected,
                                    cells: [
                                      DataCell(
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: user.isSelected,
                                              onChanged: (selected) {
                                                setState(() {
                                                  user.isSelected = selected ?? false;
                                                  _selectAll = _users.every((u) => u.isSelected);
                                                });
                                              },
                                            ),
                                            const SizedBox(width: 12.0),
                                            Text(
                                              user.id.toString(),
                                              style: textTheme.bodyMedium,
                                            )
                                          ],
                                        ),
                                      ),
                                      DataCell(Text(
                                        user.name,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.phone,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.position,
                                        style: textTheme.bodyMedium,
                                      )),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            ///-----------------------------Hover_Table
            ResponsiveGridCol(
              lg: 6,
              child: Padding(
                padding: EdgeInsets.all(_padding),
                child: ShadowContainer(
                  padding: EdgeInsets.all(_padding),
                  headerText: 'Hover Table',
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: Theme(
                            data: ThemeData(
                              dividerColor: Colors.transparent,
                              dividerTheme: const DividerThemeData(
                                color: Colors.transparent,
                              ),
                              checkboxTheme: const CheckboxThemeData(
                                side: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: DataTable(
                              headingRowColor: WidgetStateProperty.all(theme.colorScheme.surface),
                              showCheckboxColumn: false,
                              headingTextStyle: textTheme.titleMedium,
                              dataTextStyle: textTheme.bodySmall,
                              columns: [
                                DataColumn(
                                  label: Row(
                                    children: [
                                      Checkbox(
                                        value: _selectAll,
                                        onChanged: (value) {
                                          _selectAllRows(value ?? false);
                                        },
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Text('SL.'),
                                    ],
                                  ),
                                ),
                                const DataColumn(label: Text('Name')),
                                const DataColumn(label: Text('Phone')),
                                const DataColumn(label: Text('Position')),
                              ],
                              rows: _users.map(
                                (user) {
                                  return DataRow(
                                    onSelectChanged: (selected) {},
                                    color: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                                      if (states.contains(WidgetState.hovered)) {
                                        return isDark ? const Color(0xFF334155) : const Color(0xFFF8F8F8);
                                      }
                                      return null;
                                    }),
                                    selected: user.isSelected,
                                    cells: [
                                      DataCell(
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: user.isSelected,
                                              onChanged: (selected) {
                                                setState(() {
                                                  user.isSelected = selected ?? false;
                                                  _selectAll = _users.every((u) => u.isSelected);
                                                });
                                              },
                                            ),
                                            const SizedBox(width: 12.0),
                                            Text(
                                              user.id.toString(),
                                              style: textTheme.bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(Text(
                                        user.name,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.phone,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.position,
                                        style: textTheme.bodyMedium,
                                      )),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            ///-----------------------------Bordered_Table
            ResponsiveGridCol(
              lg: 6,
              child: Padding(
                padding: EdgeInsets.all(_padding),
                child: ShadowContainer(
                  padding: EdgeInsets.all(_padding),
                  headerText: 'Tables Border Colors',
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: constraints.maxWidth,
                          ),
                          child: Theme(
                            data: ThemeData(
                              dividerColor: theme.colorScheme.outline,
                              checkboxTheme: const CheckboxThemeData(
                                side: BorderSide(
                                  color: AcnooAppColors.kNeutral500,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            child: DataTable(
                              border: TableBorder.all(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              dividerThickness: 0.0, // Horizontal divider thickness
                              headingTextStyle: textTheme.titleMedium,
                              dataTextStyle: textTheme.bodySmall,
                              horizontalMargin: 16.0,
                              headingRowColor: WidgetStateColor.transparent,
                              columns: [
                                DataColumn(
                                  label: Row(
                                    children: [
                                      Checkbox(
                                        value: _selectAll,
                                        onChanged: (value) {
                                          _selectAllRows(value ?? false);
                                        },
                                      ),
                                      const SizedBox(width: 12.0),
                                      const Text('SL.'),
                                    ],
                                  ),
                                ),
                                const DataColumn(label: Text('Name')),
                                const DataColumn(label: Text('Phone')),
                                const DataColumn(label: Text('Position')),
                              ],
                              rows: _users.map(
                                (user) {
                                  return DataRow(
                                    selected: user.isSelected,
                                    cells: [
                                      DataCell(
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: user.isSelected,
                                              onChanged: (selected) {
                                                setState(() {
                                                  user.isSelected = selected ?? false;
                                                  _selectAll = _users.every((u) => u.isSelected);
                                                });
                                              },
                                            ),
                                            const SizedBox(width: 12.0),
                                            Text(
                                              user.id.toString(),
                                              style: textTheme.bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      DataCell(Text(
                                        user.name,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.phone,
                                        style: textTheme.bodyMedium,
                                      )),
                                      DataCell(Text(
                                        user.position,
                                        style: textTheme.bodyMedium,
                                      )),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            ///-----------------------------Dragged_Table
            ResponsiveGridCol(
              lg: 12,
              child: Padding(
                padding: EdgeInsets.all(_padding),
                child: ShadowContainer(
                  padding: EdgeInsets.all(_padding),
                  headerText: 'Table Drag & Drop',
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final _size = constraints.biggest;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        child: ConstrainedBox(
                          constraints: BoxConstraints.loose(
                            Size.fromWidth(
                              MediaQuery.sizeOf(context).width <= 1239 ? 1366 : _size.width,
                            ),
                          ),
                          child: ReorderableListView(
                            dragStartBehavior: DragStartBehavior.start,
                            buildDefaultDragHandles: false,
                            shrinkWrap: true,
                            header: _buildTableHeader(),
                            scrollDirection: Axis.vertical,
                            onReorder: (oldIndex, newIndex) {
                              setState(() {
                                if (oldIndex < 0 || oldIndex >= employees.length) return;
                                if (newIndex < 0 || newIndex >= employees.length) return;

                                // Adjust newIndex if it's greater than oldIndex
                                if (newIndex > oldIndex) {
                                  newIndex -= 1;
                                }

                                final Employee item = employees.removeAt(oldIndex);
                                employees.insert(newIndex, item);
                              });
                            },
                            children: [
                              for (int index = 0; index < 5; index++) _buildDataRow(employees[index], index),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //table_border
  ResponsiveGridCol tableBorder(double _padding, BuildContext context, ThemeData theme, TextTheme textTheme) {
    return ResponsiveGridCol(
      lg: 6,
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: ShadowContainer(
          padding: EdgeInsets.all(_padding),
          headerText: 'Bordered Table',
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                  ),
                  child: Theme(
                    data: ThemeData(
                        dividerColor: theme.colorScheme.outline,
                        checkboxTheme: const CheckboxThemeData(
                          side: BorderSide(
                            color: AcnooAppColors.kNeutral500,
                            width: 1.0,
                          ),
                        ),
                        dividerTheme: DividerThemeData(
                          color: theme.colorScheme.outline,
                        )),
                    child: Container(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer, // Background color of the table
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: theme.colorScheme.outline,
                          width: 1.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: DataTable(
                          border: TableBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              horizontalInside: BorderSide(
                                color: theme.colorScheme.outline,
                              )),
                          dividerThickness: 1.0, // Horizontal divider thickness
                          headingTextStyle: textTheme.titleMedium,
                          dataTextStyle: textTheme.bodySmall,
                          horizontalMargin: 16.0,
                          headingRowColor: WidgetStateColor.transparent,
                          columns: [
                            DataColumn(
                              label: Row(
                                children: [
                                  Checkbox(
                                    value: _selectAll,
                                    onChanged: (value) {
                                      _selectAllRows(value ?? false);
                                    },
                                  ),
                                  const SizedBox(width: 12.0),
                                  const Text('SL.'),
                                ],
                              ),
                            ),
                            const DataColumn(label: Text('Name')),
                            const DataColumn(label: Text('Phone')),
                            const DataColumn(label: Text('Position')),
                          ],
                          rows: _users.map(
                            (user) {
                              return DataRow(
                                selected: user.isSelected,
                                cells: [
                                  DataCell(
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: user.isSelected,
                                          onChanged: (selected) {
                                            setState(() {
                                              user.isSelected = selected ?? false;
                                              _selectAll = _users.every((u) => u.isSelected);
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 12.0),
                                        Text(
                                          user.id.toString(),
                                          style: textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataCell(Text(
                                    user.name,
                                    style: textTheme.bodyMedium,
                                  )),
                                  DataCell(Text(
                                    user.phone,
                                    style: textTheme.bodyMedium,
                                  )),
                                  DataCell(Text(
                                    user.position,
                                    style: textTheme.bodyMedium,
                                  )),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  //table_head
  ResponsiveGridCol tableHead(double _padding, BuildContext context, ThemeData theme, TextTheme textTheme) {
    return ResponsiveGridCol(
      lg: 6,
      child: Padding(
        padding: EdgeInsets.all(_padding),
        child: ShadowContainer(
          padding: EdgeInsets.only(bottom: _padding + _padding),
          headerText: 'Table Head',
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth,
                  ),
                  child: Theme(
                    data: ThemeData(
                        dividerColor: theme.colorScheme.outline,
                        checkboxTheme: CheckboxThemeData(
                          side: BorderSide(
                            color: theme.colorScheme.outline,
                            width: 1.0,
                          ),
                        ),
                        dividerTheme: DividerThemeData(
                          color: theme.colorScheme.outline,
                        )),
                    child: DataTable(
                      dividerThickness: 1,
                      headingTextStyle: textTheme.titleMedium,
                      dataTextStyle: textTheme.bodySmall,
                      horizontalMargin: 16.0,
                      headingRowColor: WidgetStateProperty.all(theme.colorScheme.surface),
                      columns: [
                        DataColumn(
                          label: Row(
                            children: [
                              Checkbox(
                                value: _selectAll,
                                onChanged: (value) {
                                  _selectAllRows(value ?? false);
                                },
                              ),
                              const SizedBox(width: 12.0),
                              const Text('SL.'),
                            ],
                          ),
                        ),
                        const DataColumn(label: Text('Name')),
                        const DataColumn(label: Text('Phone')),
                        const DataColumn(label: Text('Position')),
                      ],
                      rows: _users.map(
                        (user) {
                          return DataRow(
                            selected: user.isSelected,
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    Checkbox(
                                      value: user.isSelected,
                                      onChanged: (selected) {
                                        setState(() {
                                          user.isSelected = selected ?? false;
                                          _selectAll = _users.every((u) => u.isSelected);
                                        });
                                      },
                                    ),
                                    const SizedBox(width: 12.0),
                                    Text(
                                      user.id.toString(),
                                      style: textTheme.bodyMedium,
                                    )
                                  ],
                                ),
                              ),
                              DataCell(Text(
                                user.name,
                                style: textTheme.bodyMedium,
                              )),
                              DataCell(Text(
                                user.phone,
                                style: textTheme.bodyMedium,
                              )),
                              DataCell(Text(
                                user.position,
                                style: textTheme.bodyMedium,
                              )),
                            ],
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

//table_frag_drop
  Widget _buildTableHeader() {
    final theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(12.0),
          topLeft: Radius.circular(12.0),
        ),
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outline), // Add border for better separation
      ),
      key: const ValueKey('header'),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Text('#', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text('Registered On', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text('User Name', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text('Email', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text('Phone', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text('Position', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Text('Status', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
          Expanded(child: Align(alignment: Alignment.center, child: Text('Action', style: textTheme.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis))), // Empty space for alignment
        ],
      ),
    );
  }

  Widget _buildDataRow(Employee e, int index) {
    final theme = Theme.of(context);
    TextTheme textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.outline),
      ),
      key: ValueKey('$index-${e.userName}'),
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: ReorderableDragStartListener(
                index: index,
                child: SvgPicture.asset(
                  'assets/images/sidebar_icons/arrows-move.svg',
                  color: theme.colorScheme.onTertiary,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              DateFormat('MMM dd, yyyy').format(e.registeredOn),
              style: textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                AvatarWidget(
                  imagePath: e.imagePath,
                  size: const Size.square(40),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    e.userName,
                    style: textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(e.email, style: textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            child: Text(e.phoneNumber, style: textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            child: Text(e.position, style: textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: e.isActive ? AcnooAppColors.kSuccess.withOpacity(0.2) : AcnooAppColors.kError.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  e.isActive ? 'Active' : 'Inactive',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium?.copyWith(
                    color: e.isActive ? AcnooAppColors.kSuccess : AcnooAppColors.kError,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
                alignment: Alignment.center,
                child: Icon(
                  Icons.more_vert_rounded,
                  color: theme.colorScheme.onTertiary,
                )),
          ),
        ],
      ),
    );
  }
}

class User {
  bool isSelected;
  final int id;
  final String name;
  final String phone;
  final String position;

  User({
    required this.isSelected,
    required this.id,
    required this.name,
    required this.phone,
    required this.position,
  });
}
