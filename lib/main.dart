import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;
import 'package:responsive_grid/responsive_grid.dart';

import 'app/core/app_config/app_config.dart';
import 'app/core/static/static.dart';
import 'app/core/theme/theme.dart';
import 'app/providers/providers.dart';
import 'app/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ResponsiveGridBreakpoints.value = ResponsiveGridBreakpoints(
    sm: 576,
    md: 1240,
    lg: double.infinity,
  );

  final _app = MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppThemeProvider()),
    ],
    child: const AcnooApp(),
  );
  runApp(_app);
}

class AcnooApp extends StatelessWidget {
  const AcnooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, appTheme, child) {
        return rf.ResponsiveBreakpoints.builder(
          breakpoints: [
            rf.Breakpoint(
              start: BreakpointName.XS.start,
              end: BreakpointName.XS.end,
              name: BreakpointName.XS.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.SM.start,
              end: BreakpointName.SM.end,
              name: BreakpointName.SM.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.MD.start,
              end: BreakpointName.MD.end,
              name: BreakpointName.MD.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.LG.start,
              end: BreakpointName.LG.end,
              name: BreakpointName.LG.name,
            ),
            rf.Breakpoint(
              start: BreakpointName.XL.start,
              end: BreakpointName.XL.end,
              name: BreakpointName.XL.name,
            ),
          ],
          child: MaterialApp.router(
            title: AppConfig.appName,
            theme: AcnooAppTheme.kLightTheme(),
            darkTheme: AcnooAppTheme.kDarkTheme(),
            themeMode: appTheme.themeMode,

            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: TextScaler.linear(rf.ResponsiveValue<double>(
                  context,
                  conditionalValues: [],
                  defaultValue: 1.0,
                ).value),
              ),
              child: child!,
            ),

            // Navigation Configuration
            routerConfig: AcnooAppRoutes.routerConfig,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
