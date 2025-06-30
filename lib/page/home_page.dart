import 'dart:ui';

import 'package:desktop/model/chart_sample_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/radius_extension.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            children: [
              buildTitle(),
              30.verticalSpace,
              Row(
                children: [
                  buildDataCard(
                    data: "271,555K",
                    title: "千卡",
                    color: const Color(0xFFD67B7B),
                    icon: HugeIcons.strokeRoundedFire,
                  ),
                  20.horizontalSpace,
                  buildDataCard(
                    data: "1529.56",
                    title: "公里",
                    color: const Color(0xFFA9D196),
                    icon: HugeIcons.strokeRoundedWorkoutRun,
                  ),
                  20.horizontalSpace,
                  buildDataCard(
                    data: "28,480",
                    title: "分钟",
                    color: const Color(0xFF48ADE5),
                    icon: HugeIcons.strokeRoundedDumbbell01,
                  ),
                  20.horizontalSpace,
                  buildDataCard(
                    data: "122,34",
                    title: "分钟",
                    color: const Color(0xFFD1AB96),
                    icon: HugeIcons.strokeRoundedHandPrayer,
                  ),
                ],
              ),
              20.verticalSpace,
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: Row(
                  children: [
                    Expanded(child: buildAllRecord()),
                    20.horizontalSpace,
                    Expanded(child: buildMap()),
                  ],
                ),
              ),
              20.verticalSpace,
              SizedBox(
                height: 200,
                child: Row(
                  children: [
                    Expanded(child: buildStatus()),
                    20.horizontalSpace,
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: buildMsgs()),
                          20.horizontalSpace,
                          Expanded(child: Image.asset("images/run.png")),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 350,
          color: const Color(0xFFE8F3E3),
          child: buildUserInfo(),
        ),
      ],
    );
  }

  //标题区域
  buildTitle() {
    return Row(
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("您已运动 10086 天！👏", style: TextStyle(fontSize: 24)),
            Text("让我们开始今天的运动吧", style: TextStyle(color: Color(0xFF939EA2))),
          ],
        ),
        const Spacer(),
        const SizedBox(
          width: 240,
          child: TextField(
            decoration: InputDecoration(
              hintText: "请输入内容",
              prefixIconConstraints: BoxConstraints(minWidth: 50),
              prefixIcon: HugeIcon(
                icon: HugeIcons.strokeRoundedSearch01,
                color: Color(0xFF939EA2),
                size: 16,
              ),
            ),
          ),
        ),
        10.horizontalSpace,
        SizedBox(
          width: 50,
          height: 50,
          child: OutlinedButton(
            onPressed: () {},
            child: const HugeIcon(
              icon: HugeIcons.strokeRoundedNotification03,
              color: Color(0xFF939EA2),
              size: 16,
            ),
          ),
        ),
      ],
    );
  }

  // 卡片边框
  Widget buildCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD8E4E9)),
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  // 数据卡片
  Widget buildDataCard({
    required String data,
    required String title,
    required Color color,
    required IconData icon,
  }) {
    return Expanded(
      child: buildCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withAlpha(51),
              child: HugeIcon(icon: icon, color: color, size: 20),
            ),
            12.verticalSpace,
            Text(
              data,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            12.verticalSpace,
            Text(
              title,
              style: const TextStyle(color: Color(0xFF939EA2), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  //运动总记录
  Widget buildAllRecord() {
    return AspectRatio(
      aspectRatio: 1,
      child: buildCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("运动总记录", style: TextStyle(fontSize: 22)),
            10.verticalSpace,
            const Text(
              "10月23日 至 10月29日",
              style: TextStyle(color: Color(0xFF939EA2), fontSize: 16),
            ),
            30.verticalSpace,
            Expanded(
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                plotAreaBorderWidth: 0,
                primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  majorTickLines: MajorTickLines(width: 0),
                  axisLine: AxisLine(width: 0),
                  labelStyle: TextStyle(color: Color(0xFF939EA2)),
                ),
                primaryYAxis: const NumericAxis(
                  axisLine: AxisLine(width: 0),
                  //labelFormat: '{value}%',
                  majorTickLines: MajorTickLines(size: 0),
                ),
                series: <ColumnSeries<ChartSampleData, String>>[
                  ColumnSeries<ChartSampleData, String>(
                    dataSource: <ChartSampleData>[
                      ChartSampleData(x: '23', y: 60),
                      ChartSampleData(x: '24', y: 80),
                      ChartSampleData(x: '25', y: 120),
                      ChartSampleData(x: '26', y: 90),
                      ChartSampleData(x: '27', y: 30),
                      ChartSampleData(x: '28', y: 60),
                      ChartSampleData(x: '29', y: 90),
                    ],
                    borderRadius: BorderRadius.vertical(top: 8.radius),
                    xValueMapper: (ChartSampleData sales, _) => sales.x,
                    yValueMapper: (ChartSampleData sales, _) => sales.y,
                    pointColorMapper: (datum, index) {
                      if (datum.y > 90) {
                        return const Color(0xFFA9D196);
                      }
                      return const Color(0xFFF6EAE6);
                    },
                    // dataLabelSettings: const DataLabelSettings(
                    //   isVisible: false,
                    //   textStyle: TextStyle(fontSize: 10),
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 地图
  Widget buildMap() {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage("images/map.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white54,
                        Colors.white.withAlpha(204),
                        Colors.white54,
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "查看我的跑步轨迹",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF666666),
                        ),
                      ),
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                        color: Color(0xFF666666),
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 状态
  Widget buildStatus() {
    return buildCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("当前状态", style: TextStyle(fontSize: 22)),
                10.verticalSpace,
                const Text(
                  "累计减重15KG 👏👏👏",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xFF939EA2), fontSize: 16),
                ),
                const Spacer(),
                Text.rich(
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  TextSpan(
                    children: [
                      const TextSpan(text: "52KG"),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: HugeIcon(
                            icon: HugeIcons.strokeRoundedArrowRight02,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      const TextSpan(text: "44.5KG"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 200,
            child: SfCircularChart(
              margin: EdgeInsets.zero,
              series: <RadialBarSeries<ChartSampleData, String>>[
                RadialBarSeries<ChartSampleData, String>(
                  maximumValue: 100,
                  dataSource: <ChartSampleData>[
                    ChartSampleData(x: '减重', y: 15),
                  ],
                  gap: "70%",
                  radius: "100%",
                  pointColorMapper: (datum, index) {
                    return Theme.of(context).primaryColor;
                  },
                  xValueMapper: (ChartSampleData data, _) => data.x,
                  yValueMapper: (ChartSampleData data, _) => data.y,
                  pointRadiusMapper: (ChartSampleData data, _) =>
                      data.y.toString(),
                  dataLabelMapper: (ChartSampleData data, _) => data.x,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 消息
  Widget buildMsgs() {
    return buildCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [
              Text("消息", style: TextStyle(fontSize: 22)),
              Spacer(),
              HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: Colors.grey,
              ),
            ],
          ),
          20.verticalSpace,
          Expanded(
            child: buildMsgContent(
              avatar: "images/user.jpg",
              name: "Dream.Machine",
              msg: "大哥,又偷我效果图?",
              time: "12:06",
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: buildMsgContent(
              avatar: "images/user1.jpg",
              name: "7bit",
              msg: "Flutter 如何?",
              time: "18:00",
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMsgContent({
    required String avatar,
    required String name,
    required String msg,
    required String time,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(radius: 24, foregroundImage: AssetImage(avatar)),
        10.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
              8.verticalSpace,
              Text(
                msg,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Color(0xFF939EA2), fontSize: 12),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: const TextStyle(color: Color(0xFF939EA2), fontSize: 12),
        ),
      ],
    );
  }

  //用户信息
  buildUserInfo() {
    return ListView(
      padding: const EdgeInsets.only(left: 40, right: 50, top: 40, bottom: 30),
      children: [
        const Text(
          "个人资料",
          style: TextStyle(color: Color(0xFF333333), fontSize: 22),
        ),
        30.verticalSpace,
        Center(
          child: ClipOval(
            child: Image.asset(
              "images/avatar.jpg",
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
          ),
        ),
        10.verticalSpace,
        const Center(
          child: Text("Dream.Machine", style: TextStyle(fontSize: 22)),
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedMagicWand02,
              color: Color(0xFFE2A08E),
              size: 16,
            ),
            10.horizontalSpace,
            const Text(
              "Flutter 程序员",
              style: TextStyle(fontSize: 14, color: Color(0xFF939EA2)),
            ),
            const SizedBox(height: 14, child: VerticalDivider()),
            const Text(
              "四川 成都",
              style: TextStyle(fontSize: 14, color: Color(0xFF939EA2)),
            ),
          ],
        ),
        10.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/qq1.png", width: 20, fit: BoxFit.cover),
            const Text(
              "944095635",
              style: TextStyle(fontSize: 16, color: Color(0xFF939EA2)),
            ),
          ],
        ),
        20.verticalSpace,
        const Divider(),
        20.verticalSpace,
        SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.range,
          initialSelectedRange: PickerDateRange(
            DateTime.now().add(const Duration(days: -10)),
            DateTime.now().add(const Duration(days: -3)),
          ),
          backgroundColor: Colors.transparent,
          showNavigationArrow: true,
          headerStyle: const DateRangePickerHeaderStyle(
            backgroundColor: Colors.transparent,
          ),
          rangeSelectionColor: const Color(0xFFA9D196).withAlpha(77),
          navigationDirection: DateRangePickerNavigationDirection.vertical,
          // selectionColor: Colors.redAccent,
          // rangeSelectionColor: Colors.redAccent,
          // todayHighlightColor: Colors.redAccent,
          // endRangeSelectionColor: Colors.redAccent,
          // startRangeSelectionColor: Colors.redAccent,
        ),
        const Divider(),
        20.verticalSpace,
        const Text(
          "夜跑",
          style: TextStyle(fontSize: 18, color: Color(0xFF666666)),
        ),
        20.verticalSpace,
        Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedClock01,
              color: Color(0xFF939EA2),
              size: 16,
            ),
            6.horizontalSpace,
            const Text(
              "22号 19:25",
              style: TextStyle(fontSize: 16, color: Color(0xFF939EA2)),
            ),
            const Spacer(),
            FilledButton(onPressed: () {}, child: const Text("邀请")),
          ],
        ),
        10.verticalSpace,
        Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedClock01,
              color: Color(0xFF939EA2),
              size: 16,
            ),
            6.horizontalSpace,
            const Text(
              "26号 18:50",
              style: TextStyle(fontSize: 16, color: Color(0xFF939EA2)),
            ),
          ],
        ),
        10.verticalSpace,
        Row(
          children: [
            const HugeIcon(
              icon: HugeIcons.strokeRoundedClock01,
              color: Color(0xFF939EA2),
              size: 16,
            ),
            6.horizontalSpace,
            const Text(
              "27号 18:33",
              style: TextStyle(fontSize: 16, color: Color(0xFF939EA2)),
            ),
            const Spacer(),
            FilledButton(
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(30, 30)),
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                shape: WidgetStatePropertyAll(CircleBorder()),
              ),
              onPressed: () {},
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedStarCircle,
                color: Colors.white,
                size: 16,
              ),
            ),
            6.horizontalSpace,
            FilledButton(
              style: const ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(30, 30)),
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                shape: WidgetStatePropertyAll(CircleBorder()),
                backgroundColor: WidgetStatePropertyAll(Color(0xFFD67B7B)),
              ),
              onPressed: () {},
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedShocked,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
