import 'package:flutter/material.dart';

class GroupSeparator extends StatelessWidget {
  final String title;
  GroupSeparator(this.title);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class VListView extends StatelessWidget {
  final List<Widget> children;
  VListView({
    required this.children,
  });
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: ScrollController(initialScrollOffset: 0.1),
      physics: BouncingScrollPhysics(),
      children: this.children,
    );
  }
}
