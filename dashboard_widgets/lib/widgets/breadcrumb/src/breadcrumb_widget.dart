import 'package:flutter/material.dart';
import 'breadcrumb_item.dart';

class BreadCrumbList extends StatelessWidget {
  const BreadCrumbList(
      {Key? key, required this.breadcrumbs, this.breadcrumbDivider = '/'})
      : super(key: key);

  final List<BreadcrumbItem> breadcrumbs;
  final String breadcrumbDivider;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.topStart,
      child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: breadcrumbs
              .map((element) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      element,
                      if (breadcrumbs.last != element)
                        Text(
                          '  $breadcrumbDivider  ',
                          style: TextStyle(color: Colors.grey),
                        )
                    ],
                  ))
              .toList()),
    );
  }
}
