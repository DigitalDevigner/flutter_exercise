import 'package:flutter/material.dart';

import 'screens/feed.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Feed',
      home: Feed(),
    );
  }
}
