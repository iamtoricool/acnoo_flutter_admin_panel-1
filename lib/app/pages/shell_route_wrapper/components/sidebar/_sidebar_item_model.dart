part of '_sidebar.dart';

class SidebarItemModel {
  final String name;
  final String iconPath;
  final SidebarItemType sidebarItemType;
  final List<SidebarSubmenuModel>? submenus;
  final String? navigationPath;
  final bool isPage;

  SidebarItemModel({
    required this.name,
    required this.iconPath,
    this.sidebarItemType = SidebarItemType.tile,
    this.submenus,
    this.navigationPath,
    this.isPage = false,
  }) : assert(
          sidebarItemType != SidebarItemType.submenu ||
              (submenus != null && submenus.isNotEmpty),
          'Sub menus cannot be null or empty if the item type is submenu',
        );
}

class SidebarSubmenuModel {
  final String name;
  final String? navigationPath;
  final bool isPage;

  SidebarSubmenuModel({
    required this.name,
    this.navigationPath,
    this.isPage = false,
  });
}

class GroupedMenuModel {
  final String name;
  final List<SidebarItemModel> menus;

  GroupedMenuModel({
    required this.name,
    required this.menus,
  });
}

enum SidebarItemType { tile, submenu }

final _topMenus = <SidebarItemModel>[
  SidebarItemModel(
    name: 'Dashboard',
    iconPath: 'assets/images/sidebar_icons/home-dash-star.svg',
    navigationPath: '/dashboard',
  ),
  SidebarItemModel(
    name: 'Widgets',
    iconPath: 'assets/images/sidebar_icons/note-list.svg',
    sidebarItemType: SidebarItemType.submenu,
    navigationPath: '/widgets',
    submenus: [
      SidebarSubmenuModel(
        name: 'General',
        navigationPath: '/general-widgets',
      ),
      SidebarSubmenuModel(
        name: 'Chart',
        navigationPath: '/chart-widgets',
      ),
    ],
  ),
];

final _groupedMenus = <GroupedMenuModel>[
  // Application Group
  GroupedMenuModel(
    name: 'Application',
    menus: [
      SidebarItemModel(
        name: 'Calendar ',
        iconPath: 'assets/images/sidebar_icons/calendar.svg',
        navigationPath: '/calendar',
      ),
      SidebarItemModel(
        name: 'Chat',
        iconPath: 'assets/images/sidebar_icons/chat-text.svg',
        navigationPath: '/chat',
      ),
      SidebarItemModel(
        name: 'Email',
        iconPath: 'assets/images/sidebar_icons/envelope.svg',
        navigationPath: '/email',
      ),
      SidebarItemModel(
        name: 'Projects',
        iconPath: 'assets/images/sidebar_icons/copy-check.svg',
        navigationPath: '/projects',
      ),
      SidebarItemModel(
        name: 'Kanban',
        iconPath: 'assets/images/sidebar_icons/kanban.svg',
        navigationPath: '/kanban',
      ),
      SidebarItemModel(
        name: 'Open AI',
        iconPath: 'assets/images/sidebar_icons/ai.svg',
        sidebarItemType: SidebarItemType.submenu,
        navigationPath: '/openai',
        submenus: [
          SidebarSubmenuModel(
            name: "AI Writer",
            navigationPath: "/ai-writter",
          ),
          SidebarSubmenuModel(
            name: "AI Image",
            navigationPath: "/ai-image",
          ),
          SidebarSubmenuModel(
            name: "AI Chat",
            navigationPath: "/ai-chat",
          ),
          SidebarSubmenuModel(
            name: "AI Code",
            navigationPath: "/ai-code",
          ),
          SidebarSubmenuModel(
            name: "AI Voiceover",
            navigationPath: "/ai-voiceover",
          ),
        ],
      ),
      SidebarItemModel(
        name: 'Users',
        iconPath: 'assets/images/sidebar_icons/users-group.svg',
        sidebarItemType: SidebarItemType.submenu,
        navigationPath: '/users',
        submenus: [
          SidebarSubmenuModel(
            name: "Users List",
            navigationPath: "/users-list",
          ),
          SidebarSubmenuModel(
            name: "Users Grid",
            navigationPath: "/users-grid",
          ),
          SidebarSubmenuModel(
            name: "User Profile",
            navigationPath: "/user-profile",
          ),
        ],
      ),
    ],
  ),

  // Tables & Forms Group
  GroupedMenuModel(
    name: ' Tables & Forms',
    menus: [
      SidebarItemModel(
        name: 'Tables',
        iconPath: 'assets/images/sidebar_icons/clipboard-text.svg',
        sidebarItemType: SidebarItemType.submenu,
        navigationPath: '/tables',
        submenus: [
          SidebarSubmenuModel(
            name: "Basic Table",
            navigationPath: "/basic-table",
          ),
          SidebarSubmenuModel(
            name: "Data Table",
            navigationPath: "/data-table",
          ),
        ],
      ),
      SidebarItemModel(
        name: 'Forms',
        iconPath: 'assets/images/sidebar_icons/note-list.svg',
        sidebarItemType: SidebarItemType.submenu,
        navigationPath: '/forms',
        submenus: [
          SidebarSubmenuModel(
            name: "Basic Forms",
            navigationPath: '/basic-forms',
          ),
          SidebarSubmenuModel(
            name: "Form Select",
            navigationPath: '/form-select',
          ),
          SidebarSubmenuModel(
            name: "Validation",
            navigationPath: '/form-validation',
          ),
        ],
      ),
    ],
  ),

  // Components Group
  GroupedMenuModel(
    name: 'Components',
    menus: [
      SidebarItemModel(
        name: 'Buttons',
        iconPath: 'assets/images/sidebar_icons/checkbox-square-fill.svg',
        navigationPath: '/components/buttons',
      ),
      SidebarItemModel(
        name: 'Colors',
        iconPath: 'assets/images/sidebar_icons/palette.svg',
        navigationPath: '/components/colors',
      ),
      SidebarItemModel(
        name: 'Alert',
        iconPath: 'assets/images/sidebar_icons/alert-octagon.svg',
        navigationPath: '/components/alerts',
      ),
      SidebarItemModel(
        name: 'Typography',
        iconPath: 'assets/images/sidebar_icons/Language.svg',
        navigationPath: '/components/typography',
      ),
      SidebarItemModel(
        name: 'Cards',
        iconPath: 'assets/images/sidebar_icons/laptop.svg',
        navigationPath: '/components/cards',
      ),
      SidebarItemModel(
        name: 'Avatars',
        iconPath: 'assets/images/sidebar_icons/user.svg',
        navigationPath: '/components/avatars',
      ),
      SidebarItemModel(
        name: 'Drag & Drop',
        iconPath: 'assets/images/sidebar_icons/arrows-move.svg',
        navigationPath: '/components/dragndrop',
      ),
    ],
  ),

  // Pages
  GroupedMenuModel(
    name: 'Pages',
    menus: [
      SidebarItemModel(
        name: 'Authentication',
        iconPath: 'assets/images/sidebar_icons/note-list.svg',
        sidebarItemType: SidebarItemType.submenu,
        navigationPath: '/authentication',
        submenus: [
          SidebarSubmenuModel(
            name: "Sign Up",
            navigationPath: '/signup',
            isPage: true,
          ),
          SidebarSubmenuModel(
            name: "Sign In",
            navigationPath: '/signin',
            isPage: true,
          ),
        ],
      ),
      SidebarItemModel(
        name: 'Gallery',
        iconPath: 'assets/images/sidebar_icons/image-gallery.svg',
        navigationPath: '/pages/gallery',
      ),
      SidebarItemModel(
        name: 'Maps ',
        iconPath: 'assets/images/sidebar_icons/map-location.svg',
        navigationPath: '/pages/maps',
      ),
      SidebarItemModel(
        name: 'Pricing',
        iconPath: 'assets/images/sidebar_icons/money-bills.svg',
        navigationPath: '/pages/pricing',
      ),
      SidebarItemModel(
        name: 'FAQs',
        iconPath: 'assets/images/sidebar_icons/question-square.svg',
        navigationPath: '/pages/faqs',
      ),
      SidebarItemModel(
        name: '404',
        iconPath: 'assets/images/sidebar_icons/diamond-exclamation.svg',
        navigationPath: '/pages/404',
        isPage: true,
      ),
      SidebarItemModel(
        name: 'Tabs & Pills',
        iconPath: 'assets/images/sidebar_icons/cursor-click.svg',
        navigationPath: '/pages/tabs-and-pills',
      ),
      SidebarItemModel(
        name: 'Privacy Policy',
        iconPath: 'assets/images/sidebar_icons/exclamation-circle.svg',
        navigationPath: '/pages/privacy-policy',
      ),
      SidebarItemModel(
        name: 'Terms & Conditions',
        iconPath: 'assets/images/sidebar_icons/triangle-exclamation.svg',
        navigationPath: '/pages/terms-conditions',
      ),
    ],
  ),
];
