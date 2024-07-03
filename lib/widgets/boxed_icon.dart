import 'package:flutter/material.dart';
import 'package:my_stackz/themes/custom_text_theme.dart';

class BoxedIcon extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onTap;
  final Color? backgroundColor;
  final Color? iconColor;

  const BoxedIcon(
      {super.key,
      required this.onTap,
      this.icon = Icons.close,
      this.backgroundColor,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                color: backgroundColor ?? context.getTheme.cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            child:
                Icon(icon, color: iconColor ?? IconTheme.of(context).color)));
  }
}
