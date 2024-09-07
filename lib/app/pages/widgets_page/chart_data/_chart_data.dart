import '../../../widgets/pie_chart/_pie_chart.dart';
import '../../../widgets/widgets.dart';
import '../../pages.dart';

List<String> chartTitleList=[
  'Default Line Chart',
  'Multiple Line Chart',
  'Area Chart',
  'Transparent Chart',
  'Mingguan Chart',
  'Pie Chart'
];

List<Widget> chartWidgetList= const[
  DefaultLineChart(),
  MultipleLineChart(),
  AreaChart(),
  TransparentChart(),
  MinguuanChart(),
  PieChartWidget()
];
