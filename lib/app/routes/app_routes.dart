import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

abstract class AcnooAppRoutes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final routerConfig = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/dashboard',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          final _currentParam = _routerParam[state.matchedLocation] ??
              const RouteBreadcrumbModel(
                title: 'N/A',
                parentRoute: 'N/A',
                childRoute: 'N/A',
              );
          return ShellRouteWrapper(
            breadcrumbModel: _currentParam,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/dashboard',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: DashboardView(),
            ),
          ),
          GoRoute(
            path: '/widgets/general-widgets',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: GeneralWidgetsView(),
            ),
          ),
          GoRoute(
            path: '/widgets/chart-widgets',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: ChartWidgetsView(),
            ),
          ),
          GoRoute(
            path: '/calendar',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: CalendarView(),
            ),
          ),
          GoRoute(
            path: '/chat',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: ChatView(),
            ),
          ),
          StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, page) {
              EmailPageListener.initialize(page);
              return NoTransitionPage(
                child: EmailView(page: page),
              );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/email',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage<void>(
                      child: EmailListView(
                        listType: EmailListType.inbox,
                        detailsRoute: '/email/details',
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'details',
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: EmailDetailsView(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/email/starred',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage<void>(
                      child: EmailListView(
                        listType: EmailListType.starred,
                        detailsRoute: '/email/starred/details',
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'details',
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: EmailDetailsView(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/email/sent',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage<void>(
                      child: EmailListView(
                        listType: EmailListType.sent,
                        detailsRoute: '/email/sent/details',
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'details',
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: EmailDetailsView(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/email/drafts',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage<void>(
                      child: EmailListView(
                        listType: EmailListType.drafts,
                        detailsRoute: '/email/drafts/details',
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'details',
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: EmailDetailsView(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/email/spam',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage<void>(
                      child: EmailListView(
                        listType: EmailListType.spam,
                        detailsRoute: '/email/spam/details',
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'details',
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: EmailDetailsView(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/email/trash',
                    pageBuilder: (context, state) =>
                        const NoTransitionPage<void>(
                      child: EmailListView(
                        listType: EmailListType.trash,
                        detailsRoute: '/email/trash/details',
                      ),
                    ),
                    routes: [
                      GoRoute(
                        path: 'details',
                        pageBuilder: (context, state) => const NoTransitionPage(
                          child: EmailDetailsView(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/projects',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: ProjectsView(),
            ),
          ),
          GoRoute(
            path: '/kanban',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: KanbanView(),
            ),
          ),
          GoRoute(
            path: '/openai/ai-writter',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: AiWriterView(),
            ),
          ),
          GoRoute(
            path: '/openai/ai-image',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: AiImageView(),
            ),
          ),
          StatefulShellRoute.indexedStack(
            pageBuilder: (context, state, page) {
              AIChatPageListener.initialize(page);
              return NoTransitionPage(
                child: AiChatView(page: page),
              );
            },
            branches: [
              StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: '/openai/ai-chat',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: AIChatDetailsView(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/openai/ai-code',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: AiCodeView(),
            ),
          ),
          GoRoute(
            path: '/openai/ai-voiceover',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: AiVoiceoverView(),
            ),
          ),
          GoRoute(
            path: '/users/users-list',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: UsersListView(),
            ),
          ),
          GoRoute(
            path: '/users/users-grid',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: UsersGridView(),
            ),
          ),
          GoRoute(
            path: '/users/user-profile',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: UserProfileView(),
            ),
          ),
          GoRoute(
            path: '/tables/basic-table',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: BasicTableView(),
            ),
          ),
          GoRoute(
            path: '/tables/data-table',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: DataTableView(),
            ),
          ),
          GoRoute(
            path: '/forms/basic-forms',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: BasicFormsView(),
            ),
          ),
          GoRoute(
            path: '/forms/form-select',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: FormSelectView(),
            ),
          ),
          GoRoute(
            path: '/forms/form-validation',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: FormValidationView(),
            ),
          ),
          GoRoute(
            path: '/components/buttons',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: ButtonsView(),
            ),
          ),
          GoRoute(
            path: '/components/colors',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: ColorsView(),
            ),
          ),
          GoRoute(
            path: '/components/alerts',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: AlertsView(),
            ),
          ),
          GoRoute(
            path: '/components/typography',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: TypographyView(),
            ),
          ),
          GoRoute(
            path: '/components/cards',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: CardsView(),
            ),
          ),
          GoRoute(
            path: '/components/avatars',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: AvatarsView(),
            ),
          ),
          GoRoute(
            path: '/components/dragndrop',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: DragAndDropView(),
            ),
          ),
          GoRoute(
            path: '/pages/gallery',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: GalleryView(),
            ),
          ),
          GoRoute(
            path: '/pages/maps',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: MapsView(),
            ),
          ),
          GoRoute(
            path: '/pages/pricing',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: PricingView(),
            ),
          ),
          GoRoute(
            path: '/pages/tabs-and-pills',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: TabsNPillsView(),
            ),
          ),
          GoRoute(
            path: '/pages/404',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: NotFoundView(),
            ),
          ),
          GoRoute(
            path: '/pages/faqs',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: FaqView(),
            ),
          ),
          GoRoute(
            path: '/pages/privacy-policy',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: PrivacyPolicyView(),
            ),
          ),
          GoRoute(
            path: '/pages/terms-conditions',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: TermsConditionView(),
            ),
          ),
          GoRoute(
            path: '/widget-testing',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: WidgetTestingPage(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/authentication/signup',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignupView(),
        ),
      ),
      GoRoute(
        path: '/authentication/signin',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SigninView(),
        ),
      )
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundView(),
    ),
  );

  static final _routerParam = <String, RouteBreadcrumbModel>{
    '/dashboard': const RouteBreadcrumbModel(
      title: 'Dashboard',
      parentRoute: 'Dashboard',
      childRoute: 'Default',
    ),
    '/widgets/general-widgets': const RouteBreadcrumbModel(
      title: 'General',
      parentRoute: 'Widgets',
      childRoute: 'General',
    ),
    '/widgets/chart-widgets': const RouteBreadcrumbModel(
      title: 'Chart',
      parentRoute: 'Widgets',
      childRoute: 'Chart',
    ),
    '/calendar': const RouteBreadcrumbModel(
      title: 'Calendar',
      parentRoute: 'Application',
      childRoute: 'Calendar',
    ),
    '/chat': const RouteBreadcrumbModel(
      title: 'Chat',
      parentRoute: 'Application',
      childRoute: 'Chat',
    ),
    '/email': const RouteBreadcrumbModel(
      title: 'Inbox',
      parentRoute: 'Application / Email',
      childRoute: 'Inbox',
    ),
    '/email/starred': const RouteBreadcrumbModel(
      title: 'Starred',
      parentRoute: 'Application / Email',
      childRoute: 'Starred',
    ),
    '/email/sent': const RouteBreadcrumbModel(
      title: 'Sent',
      parentRoute: 'Application / Email',
      childRoute: 'Sent',
    ),
    '/email/drafts': const RouteBreadcrumbModel(
      title: 'Drafts',
      parentRoute: 'Application / Email',
      childRoute: 'Drafts',
    ),
    '/email/spam': const RouteBreadcrumbModel(
      title: 'Spam',
      parentRoute: 'Application / Email',
      childRoute: 'Spam',
    ),
    '/email/trash': const RouteBreadcrumbModel(
      title: 'Trash',
      parentRoute: 'Application / Email',
      childRoute: 'Trash',
    ),
    '/email/details': const RouteBreadcrumbModel(
      title: 'Details',
      parentRoute: 'Application / Email',
      childRoute: 'Details',
    ),
    '/projects': const RouteBreadcrumbModel(
      title: 'Projects',
      parentRoute: 'Application',
      childRoute: 'Projects',
    ),
    '/kanban': const RouteBreadcrumbModel(
      title: 'Kanban',
      parentRoute: 'Application',
      childRoute: 'Kanban',
    ),
    '/openai/ai-writter': const RouteBreadcrumbModel(
      title: 'AI Writer',
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Writer',
    ),
    '/openai/ai-image': const RouteBreadcrumbModel(
      title: 'AI Image',
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Image',
    ),
    '/openai/ai-chat': const RouteBreadcrumbModel(
      title: 'AI Chat',
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Chat',
    ),
    '/openai/ai-code': const RouteBreadcrumbModel(
      title: 'AI Code',
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Code',
    ),
    '/openai/ai-voiceover': const RouteBreadcrumbModel(
      title: 'AI Voiceover',
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Voiceover',
    ),
    '/users/users-list': const RouteBreadcrumbModel(
      title: 'Users List',
      parentRoute: 'Application / Users',
      childRoute: 'Users List',
    ),
    '/users/users-grid': const RouteBreadcrumbModel(
      title: 'Users Grid',
      parentRoute: 'Application / Users',
      childRoute: 'Users Grid',
    ),
    '/users/user-profile': const RouteBreadcrumbModel(
      title: 'User Profile',
      parentRoute: 'Application / Users',
      childRoute: 'User Profile',
    ),
    '/tables/basic-table': const RouteBreadcrumbModel(
      title: 'Basic Table',
      parentRoute: 'Tables & Forms',
      childRoute: 'Basic Table',
    ),
    '/tables/data-table': const RouteBreadcrumbModel(
      title: 'Data Table',
      parentRoute: 'Tables & Forms',
      childRoute: 'Data Table',
    ),
    '/forms/basic-forms': const RouteBreadcrumbModel(
      title: 'Basic Forms',
      parentRoute: 'Table & Forms',
      childRoute: 'Basic Forms',
    ),
    '/forms/form-select': const RouteBreadcrumbModel(
      title: 'Form Select',
      parentRoute: 'Tables & Forms',
      childRoute: 'Form Select',
    ),
    '/forms/form-validation': const RouteBreadcrumbModel(
      title: 'Form Validation',
      parentRoute: 'Tables & Forms',
      childRoute: 'Form Validation',
    ),
    '/components/buttons': const RouteBreadcrumbModel(
      title: 'Buttons',
      parentRoute: 'Components',
      childRoute: 'Buttons',
    ),
    '/components/colors': const RouteBreadcrumbModel(
      title: 'Colors',
      parentRoute: 'Components',
      childRoute: 'Colors',
    ),
    '/components/alerts': const RouteBreadcrumbModel(
      title: 'Alerts',
      parentRoute: 'Components',
      childRoute: 'Alerts',
    ),
    '/components/typography': const RouteBreadcrumbModel(
      title: 'Typography',
      parentRoute: 'Components',
      childRoute: 'Typography',
    ),
    '/components/cards': const RouteBreadcrumbModel(
      title: 'Cards',
      parentRoute: 'Components',
      childRoute: 'Cards',
    ),
    '/components/avatars': const RouteBreadcrumbModel(
      title: 'Avatars',
      parentRoute: 'Components',
      childRoute: 'Avatars',
    ),
    '/components/dragndrop': const RouteBreadcrumbModel(
      title: 'Drag & Drop',
      parentRoute: 'Components',
      childRoute: 'Drag & Drop',
    ),
    '/pages/gallery': const RouteBreadcrumbModel(
      title: 'Gallery',
      parentRoute: 'Pages',
      childRoute: 'Gallery',
    ),
    '/pages/maps': const RouteBreadcrumbModel(
      title: 'Maps',
      parentRoute: 'Pages',
      childRoute: 'Maps',
    ),
    '/pages/pricing': const RouteBreadcrumbModel(
      title: 'Pricing',
      parentRoute: 'Pages',
      childRoute: 'Pricing',
    ),
    '/pages/tabs-and-pills': const RouteBreadcrumbModel(
      title: 'Tabs & Pills',
      parentRoute: 'Pages',
      childRoute: 'Tabs & Pills',
    ),
    '/pages/faqs': const RouteBreadcrumbModel(
      title: 'FAQs',
      parentRoute: 'Pages',
      childRoute: 'FAQs',
    ),
    '/pages/404': const RouteBreadcrumbModel(
      title: '404',
      parentRoute: 'Pages',
      childRoute: '404',
    ),
    '/pages/privacy-policy': const RouteBreadcrumbModel(
      title: 'Privacy & Policy',
      parentRoute: 'Pages',
      childRoute: 'Privacy & Policy',
    ),
    '/pages/terms-conditions': const RouteBreadcrumbModel(
      title: 'Terms & Conditions',
      parentRoute: 'Pages',
      childRoute: 'Terms & Conditions',
    ),
  };
}
