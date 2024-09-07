part of '../chat_view.dart';

class UserList extends StatelessWidget {
  final List<UserModel> filteredUsers;
  final String? selectedUser;
  final TextEditingController searchController;
  final void Function(UserModel value) onUserTap;
  final TabController tabController;

  const UserList({
    super.key,
    required this.filteredUsers,
    required this.selectedUser,
    required this.searchController,
    required this.onUserTap,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final isDark = _theme.colorScheme.brightness == Brightness.dark;
    final isMobileOrTablet = _isMobileOrTablet(context);
    final _borderType = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide.none,
    );

    return ShadowContainer(
      showHeader: false,
      child: Column(
        children: [
          isMobileOrTablet
              ? Column(
                  children: [
                    tabbar(_theme),
                    const SizedBox(height: 10),
                    searchField(_borderType),
                  ],
                )
              : Column(
                  children: [
                    searchField(_borderType),
                    tabbar(_theme),
                  ],
                ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 4),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) =>
                  _buildUserTile(context, index, isDark),
            ),
          ),
        ],
      ),
    );
  }

  bool _isMobileOrTablet(BuildContext context) {
    return rf.ResponsiveValue<bool>(
      context,
      conditionalValues: const [
        rf.Condition.between(start: 0, end: 1023, value: true)
      ],
      defaultValue: false,
    ).value;
  }

  TextField searchField(OutlineInputBorder _borderType) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        suffixIcon: _buildSearchIcon(),
        hintText: 'Search...',
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        border: _borderType,
        enabledBorder: _borderType,
        focusedBorder: _borderType,
        errorBorder: _borderType,
        focusedErrorBorder: _borderType,
      ),
    );
  }

  TabBar tabbar(ThemeData _theme) {
    return TabBar(
      padding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          color: AcnooAppColors.kPrimary600,
          width: 2,
        ),
      ),
      controller: tabController,
      dividerColor: _theme.colorScheme.outline,
      tabs: const [
        Tab(text: 'Private'),
        Tab(text: 'Group'),
        Tab(text: 'All'),
      ],
    );
  }

  Widget _buildSearchIcon() {
    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: AcnooAppColors.kPrimary700,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: const Icon(
        IconlyLight.search,
        color: AcnooAppColors.kWhiteColor,
      ),
    );
  }

  Widget _buildUserTile(BuildContext context, int index, bool isDark) {
    final user = filteredUsers[index];
    final isSelected = selectedUser == user.influencerName;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.surface
              : theme.colorScheme.primaryContainer,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => onUserTap(user),
          leading: AvatarWidget(
            fit: BoxFit.cover,
            isActive: true,
            imagePath: user.influencerImage,
            size: const Size.square(40),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  user.influencerName,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 4.0),
              Flexible(
                child: Text(
                  '12:30',
                  maxLines: 1,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark
                        ? AcnooAppColors.kNeutral400
                        : AcnooAppColors.kNeutral500,
                  ),
                ),
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Hey there I’m ${user.influencerName}...',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade800,
                  ),
                ),
              ),
              const SizedBox(width: 4.0),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AcnooAppColors.kSuccess,
                ),
                child: Text(
                  '8',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    color: AcnooAppColors.kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
