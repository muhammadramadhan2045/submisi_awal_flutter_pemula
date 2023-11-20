import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    this.title,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.toolbarTextStyle,
  }) : super(key: key);

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final double? elevation;
  final ShapeBorder? shape;
  final TextStyle? toolbarTextStyle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      leading: leading,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      toolbarTextStyle: toolbarTextStyle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
