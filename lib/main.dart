import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_clean_arch/features/posts/presentation/bloc/create_update_delete_post/bloc/create_update_delete_post_bloc.dart';

import 'core/theme/app_theme.dart';
import 'features/posts/presentation/bloc/read_posts/bloc/read_posts_bloc.dart';
import 'features/posts/presentation/pages/posts_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyPostsApp());
}

class MyPostsApp extends StatelessWidget {
  const MyPostsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<ReadPostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme,
            title: 'Posts App',
            home: const PostsPage()));
  }
}
