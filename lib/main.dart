import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/posts/presentation/pages/posts_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyPostsApp());
}

class MyPostsApp extends StatelessWidget {
  const MyPostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      title: 'PostsApp',
      home: const PostsPage(),
    );
  }
}
