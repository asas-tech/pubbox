import 'package:flutter/material.dart';

class BreadcrumbItem extends StatelessWidget {
  const BreadcrumbItem(
      {Key? key,
      this.label,
      this.icon,
      this.onTap,
      this.isActive,
      this.customColor})
      : super(key: key);

  final String? label;
  final IconData? icon;
  final Function? onTap;
  final bool? isActive;
  final Color? customColor;

  bool checkIsActive() {
    if (onTap != null) {
      return isActive ?? true;
    } else {
      return isActive ?? false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    bool isActive = checkIsActive();
    return Container(
        child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          Icon(
            icon,
            color: isActive ? primary : Colors.grey,
            size: 18,
          ),
        if (label != null)
          Text(
            label ?? '',
            style: TextStyle(color: isActive ? primary : Colors.grey),
          ),
      ],
    ));
  }
}
