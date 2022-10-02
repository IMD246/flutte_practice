import 'package:flutter/material.dart';
import 'counter.dart';
import '../services/bloc/counter_manager.dart';
import '../services/provider/provider.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canlender"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          manager.increament();
        },
      ),
      body: const Counter(),
    );
  }
}
