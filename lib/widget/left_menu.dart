import 'package:flutter/material.dart';

class LeftMenuBar extends StatefulWidget {
  const LeftMenuBar({
    super.key,
    required this.menus,
    this.gap = 30,
    this.onSelected,
    this.selectedIndex = 0,
    this.indicatorColor = Colors.black,
    this.indicatorSize = const Size(40, 40),
  });

  final ValueChanged<int>? onSelected;

  final int selectedIndex;

  // 指示器颜色
  final Color indicatorColor;

  final List<LeftMenu> menus;

  final Size indicatorSize;

  // 元素间隔
  final double gap;

  @override
  State<LeftMenuBar> createState() => _LeftMenuBarState();
}

class _LeftMenuBarState extends State<LeftMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.menus.length; i += 1) ...{
          _LeftMenu(
            size: widget.indicatorSize,
            selected: widget.selectedIndex == i,
            selectedChild: widget.menus[i].selectedChild,
            indicatorColor: widget.indicatorColor,
            child: widget.menus[i].child,
            onTap: () {
              if (widget.onSelected != null) {
                widget.onSelected!(i);
              }
            },
          ),
          SizedBox(
            height: widget.gap,
          )
        }
      ],
    );
  }
}

class LeftMenu {
  late Widget child;
  late Widget selectedChild;
  LeftMenu({
    required this.child,
    required this.selectedChild,
  });
}

class _LeftMenu extends StatelessWidget {
  const _LeftMenu({
    required this.size,
    required this.child,
    required this.onTap,
    required this.selected,
    required this.selectedChild,
    required this.indicatorColor,
  });

  final VoidCallback onTap;

  final bool selected;

  final Size size;

  final Widget child;

  final Widget selectedChild;

  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: selected
            ? [
                BoxShadow(
                  color: const Color(0xFFA9D196).withOpacity(.8),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        type: selected ? MaterialType.button : MaterialType.transparency,
        color: selected ? indicatorColor : null,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onTap,
          child: Container(
            width: size.width,
            height: size.height,
            alignment: Alignment.center,
            // decoration: selected
            //     ? BoxDecoration(
            //         color: indicatorColor,
            //         borderRadius: BorderRadius.circular(5),
            //       )
            //     : null,
            child: selected ? selectedChild : child,
          ),
        ),
      ),
    );
  }
}
