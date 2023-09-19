import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/presentation/providers/providers.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final namesStream$ = ref.watch(namesStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider'),
      ),
      body: namesStream$.when(
        data: (data) => Center(child: Text(data)),
        error: (error, stackTrace) => Text('error: $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
