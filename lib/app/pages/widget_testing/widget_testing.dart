import 'package:flutter/material.dart';

import 'package:feather_icons/feather_icons.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

export 'package:flutter/widgets.dart';
import '../../core/static/static.dart';
import '../../core/theme/theme.dart';
import '../../widgets/widgets.dart';

class WidgetTestingPage extends StatelessWidget {
  const WidgetTestingPage({super.key});
  @override
  Widget build(BuildContext context) {
    final cryptoFontSize = rf.ResponsiveValue<double?>(context,
        conditionalValues: [
          rf.Condition.smallerThan(name: BreakpointName.SM.name, value: 18)
        ]).value;
    /* final cryptoSubTitleSize= rf.ResponsiveValue<double?>(
        context,
        conditionalValues: [
          rf.Condition.smallerThan(name: BreakpointName.SM.name,value: 18)
        ]
    ).value;*/
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              /*
              const SizedBox(height: 20,),
              WidgetCalender(),
              const SizedBox(height: 20,),
              UserGridWidget(
                imagePath:
                    'https://s3-alpha-sig.figma.com/img/c1a9/9c0f/1fb590496dd3f8eeb8d71ebafd1d3965?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hPjszXOwMZeyoG0HBGHf~YANXcRUAo~dpGtc7Th18H0xj5qjye35QESMRHuJ3TifOYk5G-n-Dw5UwMAvneFvtofjvsR8jLtMStwHiXI94AqOTsM0mfpq8ndru2mItr2CZyBe9QGOz2SxlAh8Lyju3ZTTBc4M9~OS8WcgpoZWbNWxHnutOBA6R4tyAtR-vRjbgmEImJszCayaArnRBlIBTzdv9l~wtzKGetpRkZOwRCpJE-zPXMM9zb-2xWaDC1eELTHIMnW-ZGg1lXJjC7oPhWnY69S-C9U2OGM2umUtHkw3l5lHKS0VuFQTZWthH5PrXCB1rzPMXZCCswUStFCxPA__',
                name: 'Courtney Henry',
                designation: 'Developer',
                followers: '485 followers',
                following: ' 187 following',
                totalRevenue: '${AppLocale.appCurrency}27,000',
                orders: '75',
                products: '25',
              ),
              SizedBox(height: 20,),
              const SocialMediaOverview(),
              const SizedBox(
                height: 20,
              ),
              const AmountProgressWidget(
                containerColor: Color(0xffBBE0FF),
                containerIcon: Icon(FeatherIcons.user, color: Colors.blue),
                subTitle: 'This Month Leave Request',
                title: '20',
                text: '12 Since Last Month Leave Request',
                progressColor: Color(0xff0D9AFF),
                progressBackgroundColor: Color(0xffBBE0FF),
                percentValue: 0.7,
                bottomIcon: Icon(
                  FeatherIcons.arrowUp,
                  color: AcnooAppColors.kSuccess,
                  size: 16,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const GeneralUsagesIncome(),
              const SizedBox(
                height: 20,
              ),
              UserProfileCardWidget(
                subtitle: 'Event planner',
                nameTextStyle: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                name: 'Arlene McCoy',
                onpressed: () {},
                imagePath:
                    'https://s3-alpha-sig.figma.com/img/c1a9/9c0f/1fb590496dd3f8eeb8d71ebafd1d3965?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hPjszXOwMZeyoG0HBGHf~YANXcRUAo~dpGtc7Th18H0xj5qjye35QESMRHuJ3TifOYk5G-n-Dw5UwMAvneFvtofjvsR8jLtMStwHiXI94AqOTsM0mfpq8ndru2mItr2CZyBe9QGOz2SxlAh8Lyju3ZTTBc4M9~OS8WcgpoZWbNWxHnutOBA6R4tyAtR-vRjbgmEImJszCayaArnRBlIBTzdv9l~wtzKGetpRkZOwRCpJE-zPXMM9zb-2xWaDC1eELTHIMnW-ZGg1lXJjC7oPhWnY69S-C9U2OGM2umUtHkw3l5lHKS0VuFQTZWthH5PrXCB1rzPMXZCCswUStFCxPA__',
              ),
              const SizedBox(
                height: 20,
              ),
              UserProfileCardWidget(
                subtitle: 'Ralph Edwards',
                nameTextStyle: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
                name: 'Ralph Edwards',
                onpressed: () {},
                buttonColor: AcnooAppColors.kPrimary200,
                buttonTextColor: AcnooAppColors.kPrimary600,
                imagePath:
                    'https://s3-alpha-sig.figma.com/img/21a8/1a5d/81e415238a036e2f11f72764f1758688?Expires=1723420800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TPB2tSXFSZHKO~JeHgDyHWOj00LtORUOBMAAKu0ux5gftrOWlhDwornvtSyGK~YpURSZpIpS8PMx9Vb1LSgB63z19zLFuiv0ZBqi5n-0eXqb1brGMSDfFamI~3I~~r09YZbuYwvk0svQx1tUMxBkT5Fvx0tMcS87aGKjFzz3rjMkIg3P1328eEFvZ9FwLZa0TWzEukjEDgfZNuaRFuQQUEQqcr4IlCWsjVS5GURv7~M2NM0ta65pXUBYaVBrBIsvwfE~9Wk5ANGXfqfuyoCtrcrYZ990WSgPVuivgXm5sHSF~q9NL0Mt6-go3IpTbr-G-VHWm8WJD~YBQYs1LDSfyg__',
              ),
              const SizedBox(
                height: 20,
              ),
              GeneralEarnWidget(
                topTitle: 'Bitcoin',
                topTitleTextStyle: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600, fontSize: cryptoFontSize),
                bottomTitle: '\$45,138',
                bottomSubtitle: '+ 27%',
                bottomTitleTextStyle: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600, fontSize: cryptoFontSize),
                topSubtitle: 'BTC',
                topSubtitleTextStyle: theme.textTheme.titleMedium,
                imagePath: 'assets/images/sidebar_icons/cursor-click.svg',
              ),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                title: 'Minguuan Chart',
                chart: MinguuanChart(),
                showdropdown: false,
              ),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                title: 'Muliple Line Chart',
                chart: MultipleLineChart(),
                showdropdown: false,
              ),
              const SizedBox(
                height: 20,
              ),
              BuyPlanWidget(
                title: 'Hello, Shaidul Islam',
                planName: ' Free Plan',
                planButton: () {},
                upgradeButtonTap: () {},
                buyButtonTap: () {},
                upgradeButtonText: 'Upgrade Plan',
                buyCreditText: 'Buy Credits',
              ),
              const SizedBox(
                height: 10,
              ),
              const DashboardItem(
                  title: '500',
                  subTittle: 'Generated Article ',
                  containerColor: AcnooAppColors.kPrimary200,
                  iconImage: AcnooStaticImage.articleIcon),
              const SizedBox(
                height: 10,
              ),
              const DashboardCalculationItem(
                  totalAmount: '500',
                  title: 'Total Users',
                  timeDuration: 'This Month ',
                  userOrAmount: '200',
                  colors: Color(0xffB9FDEC)),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                  showdropdown: true,
                  title: 'Word Generation',
                  chart: NumericAxisChart()),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                  showdropdown: true,
                  title: 'Contents Overviews',
                  chart: ContentOverViewChart()),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                  showdropdown: false,
                  title: 'Subscribe Statistic',
                  chart: SubscriptionStaticsChart()),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                  showdropdown: false, title: 'Area Chart', chart: AreaChart()),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                  showdropdown: false,
                  title: 'Transparent Chart',
                  chart: TransparentChart()),
              const SizedBox(
                height: 20,
              ),
              const ChartWithDropdown(
                  showdropdown: false,
                  title: 'Pie Chart',
                  chart: PieChartWidget()),
              */
            ],
          ),
        ),
      ),
    );
  }
}

final Map<int, double> heightMap = {
  0: 5,
  1: 10,
  2: 15,
  3: 20,
  4: 25,
  5: 30,
  6: 35,
  7: 40,
  8: 45,
  9: 50,
  10: 55,
  11: 50,
  12: 45,
  13: 40,
  14: 35,
  15: 30,
  16: 25,
  17: 20,
  18: 15,
  19: 10,
  20: 5,
};
