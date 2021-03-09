import 'package:flutter/material.dart';
import 'VComponents.dart';

class MainScaffold extends StatelessWidget {
  final Widget body;
  final AppBar? appBar;
  final DockBar dockBar;
  MainScaffold({required this.body, required this.dockBar, this.appBar});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this.appBar,
      bottomNavigationBar: dockBar,
      body: body,
    );
  }
}
