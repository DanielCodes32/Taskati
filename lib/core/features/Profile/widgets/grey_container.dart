import 'package:flutter/material.dart';

class GreyContainer extends StatelessWidget {
  final List<Widget> children;
  const GreyContainer({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffF6F8FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}
