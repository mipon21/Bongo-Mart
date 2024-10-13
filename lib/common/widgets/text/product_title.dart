import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MyProductTitle extends StatelessWidget {
  const MyProductTitle(
      {super.key,
      required this.title,
      this.smallSize = false,
      this.maxLines = 2,
      this.textAlign});

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize? Theme.of(context).textTheme.labelLarge : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
