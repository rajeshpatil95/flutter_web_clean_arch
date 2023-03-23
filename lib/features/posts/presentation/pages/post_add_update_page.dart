import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PostAddUpdatePage extends StatelessWidget {
  const PostAddUpdatePage({super.key});

  AppBar _buildAppBar() => AppBar(title: const Text('Add/Update Post'));

  Widget _buildBody() {
    return const Center(child: Text('Add/Update Post'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}
