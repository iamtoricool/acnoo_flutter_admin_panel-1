import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import '../../core/helpers/fuctions/helper_functions.dart';
import '../../widgets/widgets.dart';

import 'data/_gallery_mock_data.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView>
    with SingleTickerProviderStateMixin {
  String _selectedCategory = 'All';
  final _categories = [
    "All",
    "Business",
    "Personal",
    "UI/UX Design",
    "Development",
  ];

  List<GalleryItemModel> _items = [];

  late final tabController = TabController(
    length: _categories.length,
    vsync: this,
  );

  void handleFiltering(String value) {
    _items.clear();
    final _value = value.trim().toLowerCase();
    if (_value == 'all') {
      _items.addAll(galleryItems);
    }

    final _filteredItems = galleryItems.where((item) {
      return item.tags.any(
        (element) => element.trim().toLowerCase().contains(_value),
      );
    }).toList();

    _items.addAll(_filteredItems);

    setState(() => _items);
  }

  @override
  void initState() {
    if (mounted) {
      _items.clear();
      _items.addAll(galleryItems);
    }
    tabController.addListener(
      () => handleFiltering(_selectedCategory),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _innerSpacing = responsiveValue<double>(
      context,
      xs: 16,
      sm: 16,
      md: 16,
      lg: 24,
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(_innerSpacing),
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: ShadowContainer(
            customHeader: TabBar(
              controller: tabController,
              isScrollable: true,
              dividerColor: Colors.transparent,
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              onTap: (_) => setState(
                () => _selectedCategory = _categories[_],
              ),
              tabs: _categories
                  .map(
                    (e) => Tab(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: _innerSpacing / 2,
                        ),
                        child: Text(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
            child: _items.isEmpty
                ? const Center(child: Text('No data found!'))
                : GridView.count(
                    crossAxisCount: responsiveValue<int>(
                      context,
                      xs: 2,
                      sm: 2,
                      md: 3,
                      lg: 4,
                    ),
                    childAspectRatio: 360 / 320,
                    mainAxisSpacing: _innerSpacing,
                    crossAxisSpacing: _innerSpacing,
                    children: List.generate(
                      _items.length,
                      (index) {
                        final _item = _items[index];

                        return GalleryImageCard(item: _item);
                      },
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class GalleryImageCard extends StatefulWidget {
  const GalleryImageCard({
    super.key,
    required this.item,
  });
  final GalleryItemModel item;

  @override
  State<GalleryImageCard> createState() => GalleryImageCardState();
}

class GalleryImageCardState extends State<GalleryImageCard> {
  bool isHovering = false;
  void changeHoverState(bool value) {
    return setState(() => isHovering = value);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return MouseRegion(
      onEnter: (event) => changeHoverState(true),
      onExit: (event) => changeHoverState(false),
      cursor: SystemMouseCursors.click,
      child: Material(
        color: _theme.colorScheme.primaryContainer,
        elevation: isHovering ? 4.75 : 0,
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: getImageType(
                    widget.item.imageUrl,
                    fit: BoxFit.cover,
                  ) ??
                  const SizedBox.square(),
            ),
            if (isHovering)
              Positioned(
                bottom: 20,
                left: 20,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.225),
                    BlendMode.overlay,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: _theme.textTheme.bodyLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: _theme.colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        widget.item.subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: _theme.textTheme.labelLarge?.copyWith(
                          color: _theme.colorScheme.onPrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}