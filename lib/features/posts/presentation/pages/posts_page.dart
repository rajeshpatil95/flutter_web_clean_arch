import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_web_clean_arch/features/posts/presentation/pages/post_add_update_page.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  AppBar _buildAppBar() => AppBar(title: const Text('Posts'));

  Widget _buildBody() {
    return const Center(
      child: Text("Rajesh Patil"),
    );
  }

  Widget _buildFloatingButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => const PostAddUpdatePage()));
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingButton(context),
    );
  }
}
