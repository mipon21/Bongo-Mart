
import 'curved_edges.dart';
import 'package:flutter/material.dart';

class MyCurvedEdgesWidgets extends StatelessWidget {
  const MyCurvedEdgesWidgets({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: MyCustomCurvedEdges(), child: child);
  }
}