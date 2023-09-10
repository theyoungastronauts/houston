import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes.dart';
import '../../../core/screens/base_screen.dart';
import '../providers/album_form_provider.dart';
import '../components/album_list.dart';

class AlbumListScreen extends BaseScreen {
  const AlbumListScreen({super.key});

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Album List"),
      actions: const [],
    );
  }

  @override
  FloatingActionButton? floatingActionButton(
      BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(albumFormProvider("").notifier).clear();

        context.push("${AlbumRoutes.namespace}/edit/new");
      },
      child: const Icon(Icons.add),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const AlbumList();
  }
}
