import 'package:flutter/material.dart';

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
      style: smallSize? Theme.of(context).textTheme.bodySmall : Theme.of(context).textTheme.headlineSmall,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
