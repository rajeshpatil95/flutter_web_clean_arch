import 'package:flutter/material.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text("Post Detail"),
      );

  Widget _buildBody() {
    return const Center(child: Text('Post Detail Page'));
  }
}
