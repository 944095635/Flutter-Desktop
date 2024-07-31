import 'package:desktop/page/home_page.dart';
import 'package:desktop/widget/left_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled/size_extension.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:window_manager/window_manager.dart';

class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
  int index = 0;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const HomePage(),
      const Text("时间"),
      const Text("收藏"),
      const Text("记录"),
      const Text("设置"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Row(
          children: [
            buildLeftMenu(),
            Expanded(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  pages[index],
                  const Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 40,
                      child: WindowCaption(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 左侧菜单
  Widget buildLeftMenu() {
    return SizedBox(
      width: 100,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DragToMoveArea(
            child: Container(
              color: const Color(0xFFFAFDF9),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 19.5,
              right: 19.5,
              top: 44,
              bottom: 60,
            ),
            child: Column(
              children: [
                Image.asset(
                  "images/logo.png",
                  width: 60,
                  height: 60,
                ),
                80.verticalSpace,
                Expanded(
                  child: LeftMenuBar(
                    selectedIndex: index,
                    onSelected: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                    indicatorColor: const Color(0xFFA9D196),
                    menus: [
                      LeftMenu(
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedHome01,
                          color: Color(0xFF939EA2),
                        ),
                        selectedChild: const HugeIcon(
                          icon: HugeIcons.strokeRoundedHome01,
                          color: Colors.white,
                        ),
                      ),
                      LeftMenu(
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedCalendar03,
                          color: Color(0xFF939EA2),
                        ),
                        selectedChild: const HugeIcon(
                          icon: HugeIcons.strokeRoundedCalendar03,
                          color: Colors.white,
                        ),
                      ),
                      LeftMenu(
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedFavourite,
                          color: Color(0xFF939EA2),
                        ),
                        selectedChild: const HugeIcon(
                          icon: HugeIcons.strokeRoundedFavourite,
                          color: Colors.white,
                        ),
                      ),
                      LeftMenu(
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedChartEvaluation,
                          color: Color(0xFF939EA2),
                        ),
                        selectedChild: const HugeIcon(
                          icon: HugeIcons.strokeRoundedChartEvaluation,
                          color: Colors.white,
                        ),
                      ),
                      LeftMenu(
                        child: const HugeIcon(
                          icon: HugeIcons.strokeRoundedSettings01,
                          color: Color(0xFF939EA2),
                        ),
                        selectedChild: const HugeIcon(
                          icon: HugeIcons.strokeRoundedSettings01,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
