part of '../colors_view.dart';

class GroupedColors {
  final String groupName;
  final List<ColorTiles> colors;

  const GroupedColors({
    required this.groupName,
    required this.colors,
  });
}

class ColorTiles {
  final String name;
  final Color color;
  const ColorTiles({
    required this.name,
    required this.color,
  });
}

const _colorMockData = <GroupedColors>[
  GroupedColors(
    groupName: 'Bases',
    colors: [
      ColorTiles(name: 'Black', color: Color(0xff000000)),
      ColorTiles(name: 'White', color: Color(0xffFFFFFF)),
    ],
  ),
  GroupedColors(
    groupName: 'Primary',
    colors: [
      ColorTiles(name: '50', color: Color(0xffFAF4FF)),
      ColorTiles(name: '100', color: Color(0xfff2e5ff)),
      ColorTiles(name: '200', color: Color(0xffdac0fe)),
      ColorTiles(name: '300', color: Color(0xffc194fe)),
      ColorTiles(name: '400', color: Color(0xffa664ff)),
      ColorTiles(name: '500', color: Color(0xff8424FF)),
      ColorTiles(name: '600', color: Color(0xff7500fd)),
      ColorTiles(name: '700', color: Color(0xff7500fd)),
      ColorTiles(name: '800', color: Color(0xff6800f7)),
      ColorTiles(name: '900', color: Color(0xff5400ef)),
    ],
  ),
  GroupedColors(
    groupName: 'Secondary ',
    colors: [
      ColorTiles(name: '50', color: Color(0xffEFF6FF)),
      ColorTiles(name: '100', color: Color(0xffDBEAFE)),
      ColorTiles(name: '200', color: Color(0xffBFDBFE)),
      ColorTiles(name: '300', color: Color(0xff93C5FD)),
      ColorTiles(name: '400', color: Color(0xff60A5FA)),
      ColorTiles(name: '500', color: Color(0xff3B82F6)),
      ColorTiles(name: '600', color: Color(0xff2563EB)),
      ColorTiles(name: '700', color: Color(0xff1D4ED8)),
      ColorTiles(name: '800', color: Color(0xff1E40AF)),
      ColorTiles(name: '900', color: Color(0xff1E3A8A)),
    ],
  ),
  GroupedColors(
    groupName: 'Neutral',
    colors: [
      ColorTiles(name: '50', color: Color(0xffD9D9D9)),
      ColorTiles(name: '100', color: Color(0xffFAFBFD)),
      ColorTiles(name: '200', color: Color(0xffEAECF0)),
      ColorTiles(name: '300', color: Color(0xffD0D5DD)),
      ColorTiles(name: '400', color: Color(0xff98A2B3)),
      ColorTiles(name: '500', color: Color(0xff667085)),
      ColorTiles(name: '600', color: Color(0xff475467)),
      ColorTiles(name: '700', color: Color(0xff344054)),
      ColorTiles(name: '800', color: Color(0xff1D2939)),
      ColorTiles(name: '900', color: Color(0xff101828)),
    ],
  ),
  GroupedColors(
    groupName: 'Success',
    colors: [
      ColorTiles(name: '50', color: Color(0xffF0FDF4)),
      ColorTiles(name: '100', color: Color(0xffDCFCE7)),
      ColorTiles(name: '200', color: Color(0xffBBF7D0)),
      ColorTiles(name: '300', color: Color(0xff86EFAC)),
      ColorTiles(name: '400', color: Color(0xff4ADE80)),
      ColorTiles(name: '500', color: Color(0xff22C55E)),
      ColorTiles(name: '600', color: Color(0xff16A34A)),
      ColorTiles(name: '700', color: Color(0xff15803D)),
      ColorTiles(name: '800', color: Color(0xff166534)),
      ColorTiles(name: '900', color: Color(0xff14532D)),
    ],
  ),
  GroupedColors(
    groupName: 'Info ',
    colors: [
      ColorTiles(name: '50', color: Color(0xffEFF6FF)),
      ColorTiles(name: '100', color: Color(0xffDBEAFE)),
      ColorTiles(name: '200', color: Color(0xffBFDBFE)),
      ColorTiles(name: '300', color: Color(0xff93C5FD)),
      ColorTiles(name: '400', color: Color(0xff60A5FA)),
      ColorTiles(name: '500', color: Color(0xff3B82F6)),
      ColorTiles(name: '600', color: Color(0xff2563EB)),
      ColorTiles(name: '700', color: Color(0xff1D4ED8)),
      ColorTiles(name: '800', color: Color(0xff1E40AF)),
      ColorTiles(name: '900', color: Color(0xff1E3A8A)),
    ],
  ),
  GroupedColors(
    groupName: 'Warning ',
    colors: [
      ColorTiles(name: '50', color: Color(0xffFEFCE8)),
      ColorTiles(name: '100', color: Color(0xffFEF9C3)),
      ColorTiles(name: '200', color: Color(0xffFEF08A)),
      ColorTiles(name: '300', color: Color(0xffFDE047)),
      ColorTiles(name: '400', color: Color(0xffFACC15)),
      ColorTiles(name: '500', color: Color(0xffEAB308)),
      ColorTiles(name: '600', color: Color(0xffCA8A04)),
      ColorTiles(name: '700', color: Color(0xffA16207)),
      ColorTiles(name: '800', color: Color(0xff854D0E)),
      ColorTiles(name: '900', color: Color(0xff713F12)),
    ],
  ),
  GroupedColors(
    groupName: 'Error',
    colors: [
      ColorTiles(name: '50', color: Color(0xffFEF2F2)),
      ColorTiles(name: '100', color: Color(0xffFEE2E2)),
      ColorTiles(name: '200', color: Color(0xffFECACA)),
      ColorTiles(name: '300', color: Color(0xffFCA5A5)),
      ColorTiles(name: '400', color: Color(0xffF87171)),
      ColorTiles(name: '500', color: Color(0xffEF4444)),
      ColorTiles(name: '600', color: Color(0xffDC2626)),
      ColorTiles(name: '700', color: Color(0xffB91C1C)),
      ColorTiles(name: '800', color: Color(0xff991B1B)),
      ColorTiles(name: '900', color: Color(0xff7F1D1D)),
    ],
  ),
];
