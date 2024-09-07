import 'package:acnoo_flutter_admin_panel/app/pages/projects_page/popup%20widgets/add_project_popup.dart';
import 'package:acnoo_flutter_admin_panel/app/pages/projects_page/popup%20widgets/details_popup.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/theme/_app_colors.dart';
import '../../widgets/avatars/_avatar_widget.dart';
import '../../widgets/file_export_button/file_export_button.dart';
import '../../widgets/shadow_container/_shadow_container.dart';
import 'demo data/project_model.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> with SingleTickerProviderStateMixin {
  ///_____________________________________________________________________Variables_______________________________
  late List<ProjectDataModel> _filteredData;
  final ScrollController _scrollController = ScrollController();
  final List<ProjectDataModel> users = AllUsers.allData;
  int _currentPage = 0;
  int _rowsPerPage = 10;
  String _searchQuery = '';
  bool _selectAll = false;

  @override
  void initState() {
    super.initState();
    _filteredData = List.from(users);
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  late TabController _tabController;

  ///_____________________________________________________________________data__________________________________
  List<ProjectDataModel> get _currentPageData {
    if (_searchQuery.isNotEmpty) {
      _filteredData = users
          .where(
            (data) =>
                data.projectName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                data.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                data.startDate.contains(
                  _searchQuery,
                ),
          )
          .toList();
    } else {
      _filteredData = List.from(users);
    }

    int start = _currentPage * _rowsPerPage;
    int end = start + _rowsPerPage;
    return _filteredData.sublist(start, end > _filteredData.length ? _filteredData.length : end);
  }

  ///_____________________________________________________________________Search_query_________________________
  void _setSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 0; // Reset to the first page when searching
    });
  }

  ///_____________________________________________________________________Add_User_____________________________
  void _showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddProjectDialog();
      },
    );
  }

  ///_____________________________________________________________________View_Details_____________________________

  String _selectedTitle = 'All';
  final _title = [
    "All",
    "Pending",
    "InProgress",
    "Complete",
  ];

  String selectedPriority = 'All Priority';
  final priorityList = [
    "All Priority",
    "Low",
    "Medium",
    "High",
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);
    final double _padding = responsiveValue<double>(
      context,
      xs: 16,
      sm: 16,
      md: 16,
      lg: 16,
    );
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final isMobile = constraints.maxWidth < 576;
          final isTablet = constraints.maxWidth < 992 && constraints.maxWidth >= 576;
          return Padding(
            padding: EdgeInsets.all(_padding),
            child: ShadowContainer(
              customHeader: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //tab_bar
                      isMobile
                          ? Expanded(
                              child: TabBar(
                                indicatorPadding: EdgeInsets.zero,
                                splashBorderRadius: BorderRadius.circular(12),
                                isScrollable: false,
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                indicatorSize: TabBarIndicatorSize.tab,
                                controller: _tabController,
                                indicatorColor: AcnooAppColors.kPrimary600,
                                indicatorWeight: 2.0,
                                dividerColor: Colors.transparent,
                                unselectedLabelColor: theme.colorScheme.onTertiary,
                                onTap: (_) => setState(
                                  () => _selectedTitle = _title[_],
                                ),
                                tabs: _title
                                    .map(
                                      (e) => Tab(
                                        child: Text(
                                          e,
                                          maxLines: 1,
                                          style: textTheme.bodySmall,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            )
                          : Expanded(
                              child: TabBar(
                                indicatorPadding: EdgeInsets.zero,
                                splashBorderRadius: BorderRadius.circular(12),
                                isScrollable: true,
                                tabAlignment: TabAlignment.start,
                                physics: const AlwaysScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                indicatorSize: TabBarIndicatorSize.tab,
                                controller: _tabController,
                                indicatorColor: AcnooAppColors.kPrimary600,
                                indicatorWeight: 2.0,
                                dividerColor: Colors.transparent,
                                unselectedLabelColor: theme.colorScheme.onTertiary,
                                onTap: (_) => setState(
                                  () => _selectedTitle = _title[_],
                                ),
                                tabs: _title
                                    .map(
                                      (e) => Tab(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: _padding / 2,
                                          ),
                                          child: Text(e),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                      //add_button_for_web
                      Visibility(
                        visible: constraints.maxWidth > 576,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: _padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 36, child: addUserButton(textTheme)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 0.3,
                    height: 0,
                    color: theme.colorScheme.outline,
                  )
                ],
              ),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //______________________________________________________________________Header__________________
                    isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: showingValueDropDown(isTablet: isTablet, isMobile: isMobile, textTheme: textTheme),
                                  ),
                                  SizedBox(width: _padding),
                                  Flexible(
                                    flex: 1,
                                    child: addUserButton(textTheme),
                                  ),
                                ],
                              ),
                              SizedBox(height: _padding / 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: priorityDropDown(textTheme: textTheme, isMobile: isMobile, isTablet: isTablet),
                                  ),
                                  SizedBox(width: _padding),
                                  Expanded(
                                    flex: 2,
                                    child: searchFormField(textTheme: textTheme),
                                  ),
                                ],
                              ),
                              SizedBox(height: _padding / 2),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: FileExportButton.excel(
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: FileExportButton.csv(
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: FileExportButton.print(
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Flexible(
                                    child: FileExportButton.pdf(
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                flex: 3,
                                child: Row(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: showingValueDropDown(isTablet: isTablet, isMobile: isMobile, textTheme: textTheme),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Flexible(
                                      flex: isTablet ? 1 : 2,
                                      child: searchFormField(textTheme: textTheme),
                                    ),
                                    const SizedBox(width: 16.0),
                                    Flexible(
                                      flex: 1,
                                      child: priorityDropDown(textTheme: textTheme, isMobile: isMobile, isTablet: isTablet),
                                    ),
                                  ],
                                ),
                              ),
                              isTablet ? Container() : const Spacer(), // Ensures proper alignment by pushing the next element to the end
                              buttonsWidget(),
                            ],
                          ),

                    //______________________________________________________________________Data_table__________________
                    isMobile || isTablet
                        ? RawScrollbar(
                            padding: const EdgeInsets.only(left: 18),
                            trackBorderColor: theme.colorScheme.surface,
                            trackVisibility: true,
                            scrollbarOrientation: ScrollbarOrientation.bottom,
                            controller: _scrollController,
                            thumbVisibility: true,
                            thickness: 8.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: constraints.maxWidth,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(top: _padding),
                                      child: userListDataTable(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(_padding),
                                  child: Text(
                                    'Showing ${_currentPage * _rowsPerPage + 1} to ${_currentPage * _rowsPerPage + _currentPageData.length} of ${_filteredData.length} entries',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: constraints.maxWidth,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: _padding),
                                child: userListDataTable(context),
                              ),
                            ),
                          ),

                    //______________________________________________________________________footer__________________
                    isTablet || isMobile
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.all(_padding),
                            child: paginatedSection(theme, textTheme),
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Flexible buttonsWidget() {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox.square(dimension: 24), // Placeholder space for better alignment
          Flexible(
            child: FileExportButton.excel(
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: FileExportButton.csv(
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: FileExportButton.print(
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: FileExportButton.pdf(
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  ///_____________________________________________________________________add_user_button___________________________
  ElevatedButton addUserButton(TextTheme textTheme) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
      ),
      onPressed: () {
        setState(() {
          _showFormDialog(context);
        });
      },
      label: Text(
        'Add New User',
        maxLines: 1,
        style: textTheme.bodySmall?.copyWith(
          color: AcnooAppColors.kWhiteColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconAlignment: IconAlignment.start,
      icon: const Icon(
        Icons.add_circle_outline_outlined,
        color: AcnooAppColors.kWhiteColor,
        size: 20.0,
      ),
    );
  }

  ///_____________________________________________________________________pagination_functions_______________________
  int get _totalPages => (_filteredData.length / _rowsPerPage).ceil();

  ///_____________________________________select_dropdown_val_________
  void _setRowsPerPage(int value) {
    setState(() {
      _rowsPerPage = value;
      _currentPage = 0;
    });
  }

  ///_____________________________________go_next_page________________
  void _goToNextPage() {
    if (_currentPage < _totalPages - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  ///_____________________________________go_previous_page____________
  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  ///_______________________________________________________________pagination_footer_______________________________
  Row paginatedSection(ThemeData theme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'Showing ${_currentPage * _rowsPerPage + 1} to ${_currentPage * _rowsPerPage + _currentPageData.length} of ${_filteredData.length} entries',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
              onPressed: _goToPreviousPage,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: theme.colorScheme.outline),
                minimumSize: const Size(88, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    bottomLeft: Radius.circular(4),
                  ),
                ),
              ),
              child: Text(
                'Previous',
                style: textTheme.bodySmall,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              height: 32,
              decoration: const BoxDecoration(
                color: AcnooAppColors.kPrimary700,
              ),
              child: Center(
                child: Text(
                  '${_currentPage + 1}',
                  style: textTheme.bodySmall?.copyWith(
                    color: AcnooAppColors.kWhiteColor,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              height: 32,
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                border: Border.all(color: theme.colorScheme.outline),
              ),
              child: Center(
                child: Text(
                  '$_totalPages',
                  style: textTheme.bodySmall,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: _goToNextPage,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(88, 32),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                side: BorderSide(color: theme.colorScheme.outline),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ),
              child: Text(
                'Next',
                style: textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }

  ///_______________________________________________________________Search_Field___________________________________
  Container searchFormField({required TextTheme textTheme}) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 440, minWidth: 230),
      child: TextFormField(
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Search...',
          hintStyle: textTheme.bodySmall,
          suffixIcon: Container(
            margin: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: AcnooAppColors.kPrimary700,
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: const Icon(IconlyLight.search, color: AcnooAppColors.kWhiteColor),
          ),
        ),
        onChanged: (value) {
          _setSearchQuery(value);
        },
      ),
    );
  }

  ///_______________________________________________________________DropDownList___________________________________
  Container showingValueDropDown({required bool isTablet, required bool isMobile, required TextTheme textTheme}) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 100, minWidth: 100),
      child: DropdownButtonFormField<int>(
        dropdownColor: theme.colorScheme.primaryContainer,
        isExpanded: true,
        value: _rowsPerPage,
        items: [10, 20, 30, 40, 50].map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              isTablet || isMobile ? '$value' : 'Show $value',
              style: textTheme.bodySmall,
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            _setRowsPerPage(value);
          }
        },
      ),
    );
  }

  ///_______________________________________________________________DropDownList___________________________________
  Container priorityDropDown({required bool isTablet, required bool isMobile, required TextTheme textTheme}) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 110, minWidth: 100),
      child: DropdownButtonFormField<String>(
        dropdownColor: theme.colorScheme.primaryContainer,
        isExpanded: true,
        value: selectedPriority,
        items: priorityList.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: textTheme.bodySmall,
              maxLines: 1,
            ),
          );
        }).toList(),
        onChanged: (value) {
          selectedPriority = value!;
        },
      ),
    );
  }

  ///_______________________________________________________________User_List_Data_Table___________________________
  Theme userListDataTable(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Theme(
      data: ThemeData(
          dividerColor: theme.colorScheme.outline,
          dividerTheme: DividerThemeData(
            color: theme.colorScheme.outline,
          )),
      child: DataTable(
        checkboxHorizontalMargin: 16,
        headingTextStyle: textTheme.titleMedium,
        dataTextStyle: textTheme.bodySmall,
        headingRowColor: WidgetStateProperty.all(theme.colorScheme.surface),
        showBottomBorder: true,
        columns: [
          DataColumn(
            label: Row(
              children: [
                Checkbox(
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  value: _selectAll,
                  onChanged: (value) {
                    _selectAllRows(value ?? false);
                  },
                ),
                const SizedBox(width: 12.0),
                const Text('Sl.'),
              ],
            ),
          ),
          const DataColumn(label: Text('Project')),
          const DataColumn(label: Text('Title')),
          const DataColumn(label: Text('Start Date')),
          const DataColumn(label: Text('End Date')),
          const DataColumn(label: Text('Assigned To')),
          const DataColumn(label: Text('Status')),
          const DataColumn(label: Text('Priority')),
          const DataColumn(label: Text('Actions')),
        ],
        rows: _currentPageData.map(
          (data) {
            return DataRow(
              color: WidgetStateColor.transparent,
              selected: data.isSelected,
              cells: [
                DataCell(
                  Row(
                    children: [
                      Checkbox(
                        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                        value: data.isSelected,
                        onChanged: (selected) {
                          setState(() {
                            data.isSelected = selected ?? false;
                            _selectAll = _currentPageData.every((d) => d.isSelected);
                          });
                        },
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        data.id.toString(),
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
                DataCell(
                  Text(
                    data.projectName,
                    maxLines: 1,
                  ),
                ),
                DataCell(Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AvatarWidget(fit: BoxFit.cover, avatarShape: AvatarShape.circle, size: const Size(40, 40), imagePath: data.imagePath),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      data.title,
                      maxLines: 1,
                    ),
                  ],
                )),
                DataCell(Text(
                  data.startDate,
                  maxLines: 1,
                )),
                DataCell(Text(
                  data.endDate,
                  maxLines: 1,
                )),
                DataCell(OverlappingImages()),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: data.status == 'Pending'
                          ? AcnooAppColors.kWarning.withOpacity(0.2)
                          : data.status == 'InProgress'
                              ? AcnooAppColors.kInfo20Op
                              : data.status == 'New'
                                  ? AcnooAppColors.kPrimary500.withOpacity(0.2)
                                  : AcnooAppColors.kSuccess.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      data.status,
                      maxLines: 1,
                      style: textTheme.bodySmall?.copyWith(
                        color: data.status == 'Pending'
                            ? AcnooAppColors.kWarning
                            : data.status == 'InProgress'
                                ? AcnooAppColors.kInfo
                                : data.status == 'New'
                                    ? AcnooAppColors.kPrimary500
                                    : AcnooAppColors.kSuccess,
                      ),
                    ),
                  ),
                ),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: data.priority == 'High'
                          ? AcnooAppColors.kSuccess
                          : data.priority == 'Medium'
                              ? AcnooAppColors.kPrimary500
                              : data.priority == 'Low'
                                  ? AcnooAppColors.kWarning
                                  : AcnooAppColors.kPrimary500,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      data.priority,
                      maxLines: 1,
                      style: textTheme.bodySmall?.copyWith(color: AcnooAppColors.kWhiteColor),
                    ),
                  ),
                ),
                DataCell(
                  PopupMenuButton(
                    iconColor: theme.colorScheme.onTertiary,
                    itemBuilder: (context) => {
                      "View": FeatherIcons.eye,
                      "Edit": FeatherIcons.edit,
                      "Delete": FeatherIcons.trash2,
                    }
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                            value: e.key,
                            child: Row(
                              children: [
                                Icon(
                                  e.value,
                                  color: theme.colorScheme.onTertiary,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  e.key,
                                  style: theme.textTheme.bodyLarge?.copyWith(),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onSelected: (value) {
                      return switch (value) {
                        'View' => _showDetailsDialog(context, data),
                        'Delete' => setState(() {
                            users.remove(data);
                            _filteredData.remove(data);
                          }),
                        'Edit' => ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Edit ${data.projectName}')),
                          ),
                        _ => null,
                      };
                    },
                    color: theme.colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }

  Future<dynamic> _showDetailsDialog(BuildContext context, ProjectDataModel data) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return DetailsDialog(
          appointment: data,
        );
      },
    );
  }

  ///_____________________________________________________________________Selected_datatable_________________________
  void _selectAllRows(bool select) {
    setState(() {
      for (var data in _currentPageData) {
        data.isSelected = select;
      }
      _selectAll = select;
    });
  }
}

class OverlappingImages extends StatelessWidget {
  final List<String?> images = [
    'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/placeholder_avatar/placeholder_avatar_01.png',
    'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/placeholder_avatar/placeholder_avatar_02.jpeg',
    'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/placeholder_avatar/placeholder_avatar_03.png',
  ];

  OverlappingImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Stack(
        children: List.generate(images.length, (index) {
          return Positioned(
            left: index * 22.0,
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(images[index]!),
            ),
          );
        }),
      ),
    );
  }
}
