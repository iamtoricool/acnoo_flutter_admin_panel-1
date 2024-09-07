import 'package:flutter/material.dart';

import 'package:magicoon_icons/MagicoonIcons_icons.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../core/theme/theme.dart';
import '../../widgets/widgets.dart';
import '../dashboard/components/_top_grid_layout.dart';
import 'general data/general_data_model.dart';

class GeneralWidgetsView extends StatelessWidget {
  const GeneralWidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    final _padding = responsiveValue<double>(
      context,
      xs: 8,
      lg: 12,
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(_padding),
        child: Column(
          children: [
            // Overview Tiles
            const TopGridLayout(),

            //Crypto Card
            ResponsiveGridRow(
              rowSegments: 100,
              children: [
                ...List.generate(
                  CoinList.cryptoList.length - 1,
                  (index) {
                    final _info = CoinList.cryptoList[index];
                    return ResponsiveGridCol(
                      lg: 22,
                      md: 50,
                      xs: 100,
                      child: Padding(
                        padding: EdgeInsets.all(_padding),
                        child: GeneralEarnWidget(
                          cryptoList: CoinList.cryptoList[index],
                        ),
                      ),
                    );
                  },
                ),
                ResponsiveGridCol(
                  lg: 34,
                  md: 50,
                  xs: 100,
                  child: Padding(
                    padding: EdgeInsets.all(_padding),
                    child: GeneralEarnWidget(
                      cryptoList: CoinList.cryptoList.last,
                    ),
                  ),
                )
              ],
            ),

            // Users Card___&___statistics
            ResponsiveGridRow(
              rowSegments: 100,
              children: [
                ResponsiveGridCol(
                  lg: 34,
                  md: 100,
                  xs: 100,
                  child: Container(
                    constraints: BoxConstraints.tightFor(
                      height: responsiveValue<double?>(
                        context,
                        xs: null,
                        lg: 423,
                      ),
                    ),
                    padding: EdgeInsets.all(_padding),
                    child: const GeneralUsagesIncome(),
                  ),
                ),

                //User_info
                ...List.generate(
                  _userInfo.length,
                  (index) {
                    final _user = _userInfo[index];
                    final _cardMargin = responsiveValue<(double, double)>(
                      context,
                      xs: (8, 6),
                      md: (8, 4),
                      lg: (12, 12),
                    );
                    return ResponsiveGridCol(
                      lg: 22,
                      md: 33,
                      xs: 100,
                      child: Container(
                        constraints: BoxConstraints.tightFor(
                          height: responsiveValue<double?>(
                            context,
                            xs: null,
                            lg: 400,
                          ),
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: _cardMargin.$1,
                          vertical: _cardMargin.$2,
                        ),
                        child: UserProfileCardWidget(
                          imagePath: _user.$3,
                          name: _user.$1,
                          subtitle: _user.$2,
                          onpressed: () {},
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // Overview Card
            ResponsiveGridRow(
              children: [
                ...List.generate(
                  _overviewCard.length,
                  (index) {
                    final _overview = _overviewCard[index];
                    return ResponsiveGridCol(
                      lg: 3,
                      md: 6,
                      child: Padding(
                        padding: EdgeInsets.all(_padding),
                        child: AmountProgressWidget(
                          containerColor: _overview.$4.withOpacity(0.25),
                          containerIcon: Icon(
                            _overview.$5,
                            color: _overview.$4,
                          ),
                          title: _overview.$1,
                          subTitle: _overview.$2,
                          text: _overview.$3,
                          bottomIcon: Icon(
                            index == 1 || index == 2 ? Icons.arrow_downward_outlined : Icons.arrow_upward_outlined,
                            color: index == 1 || index == 2 ? AcnooAppColors.kError : AcnooAppColors.kSuccess,
                            size: 16,
                          ),
                          progressColor: _overview.$4,
                          progressBackgroundColor: _overview.$4.withOpacity(0.25),
                          percentValue: 0.15 * (index + 1),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),

            // User Card, Social Media Card & Calendar
            ResponsiveGridRow(
              rowSegments: 100,
              children: [
                ResponsiveGridCol(
                  lg: 27,
                  md: 50,
                  xs: 100,
                  child: Container(
                    constraints: BoxConstraints.tightFor(
                      height: responsiveValue<double?>(
                        context,
                        xs: null,
                        md: 410,
                      ),
                    ),
                    margin: EdgeInsets.all(_padding),
                    child: const UserGridWidget(
                      imagePath: 'https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_05.jpeg',
                      name: 'Jonto Liya',
                      designation: 'UI/UX Designer',
                      followers: '485',
                      following: '187',
                      totalRevenue: '\$27,000',
                      orders: '75',
                      products: '25',
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 27,
                  md: 50,
                  xs: 100,
                  child: Container(
                    constraints: BoxConstraints.tightFor(
                      height: responsiveValue<double?>(
                        context,
                        xs: 360,
                        md: 410,
                      ),
                    ),
                    margin: EdgeInsets.all(_padding),
                    child: const ShadowContainer(
                      headerText: 'Social Media Overview',
                      child: Align(child: SocialMediaOverviewGrid()),
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  lg: 46,
                  xs: 100,
                  child: Container(
                    constraints: BoxConstraints.tightFor(
                      height: responsiveValue<double?>(
                        context,
                        xs: null,
                        md: 410,
                      ),
                    ),
                    margin: EdgeInsets.all(_padding),
                    child: const ShadowContainer(
                      headerText: 'Calendar',
                      padding: EdgeInsets.zero,
                      child: WidgetCalender(),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaOverviewGrid extends StatelessWidget {
  const SocialMediaOverviewGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _socialMediaInfo
              .take(3)
              .map(
                (item) => Flexible(
                  flex: 2,
                  child: SocialMediaOverviewCard(
                    platformName: item.$1,
                    platformLogoPath: item.$3,
                    followersCount: item.$2,
                  ),
                ),
              )
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _socialMediaInfo
              .skip(3)
              .map(
                (item) => Flexible(
                  flex: 2,
                  child: SocialMediaOverviewCard(
                    platformName: item.$1,
                    platformLogoPath: item.$3,
                    followersCount: item.$2,
                  ),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}

final _overviewCard = [
  (
    "20",
    "This Month Leave Request",
    "12 Since Last Month Leave Request",
    const Color(0xff0D9AFF),
    MagicoonIcons.user_minus,
  ),
  (
    "\$10,000",
    "This Month Salary",
    "\$8,000 Since Last Month Salary",
    const Color(0xff8B4DFF),
    MagicoonIcons.sack_dollar2,
  ),
  (
    "20",
    "Total Employees",
    "18 Today Present",
    const Color(0xff009F5E),
    MagicoonIcons.users_group1,
  ),
  (
    "\$8,000",
    "This Month Expenses",
    "\$10,000 Since Last Month Expenses",
    const Color(0xffE13F3D),
    MagicoonIcons.money_bills,
  ),
];

final _socialMediaInfo = [
  ("Facebook", 5123, "assets/images/widget_images/sm_icon/facebok.png"),
  ("Twitter", 5123, "assets/images/widget_images/sm_icon/twitter.png"),
  ("Instagram", 5123, "assets/images/widget_images/sm_icon/instagram.png"),
  ("Youtube", 5123, "assets/images/widget_images/sm_icon/youtube.png"),
  ("Linkedin", 5123, "assets/images/widget_images/sm_icon/linkedIn.png"),
  ("Pinterest", 5123, "assets/images/widget_images/sm_icon/pinterest.png"),
];

final _userInfo = [
  ("Arlene McCoy", "Event planner", "https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_11.jpeg"),
  ("Ralph Edwards", "Language Tutor", "https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_12.jpeg"),
  ("Devon Lane", "Fitness Trainer", "https://raw.githubusercontent.com/iamtoricool/static_images/main/avatars/person_images/person_image_13.jpeg"),
];
