import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',

      home: MyHomePage(),
    );
  }
}
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. watch the counterStateProvider
    final counter = ref.watch(counterStateProvider);
    return Scaffold(
      body: Center(
          child:  Text(
            'Value: $counter',
            style: Theme.of(context).textTheme.headline4,
          )
      ),floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
          // access the provider via ref.read(), then increment its state.
          onPressed: () => ref.read(counterStateProvider.notifier).state++,
          child: Icon(Icons.add),
    ),
SizedBox(width: 20,),
          FloatingActionButton(
            // access the provider via ref.read(), then increment its state.
            onPressed: () => ref.read(counterStateProvider.notifier).state--,
            child: Icon(Icons.remove),
          ),
        ],
      )
    );
  }
}