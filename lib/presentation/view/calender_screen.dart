import 'package:flutter/material.dart';
import 'package:inhirited_app/presentation/view/counter.dart';
import 'package:inhirited_app/presentation/services/bloc/counter_manager.dart';
import 'package:inhirited_app/presentation/services/provider/provider.dart';

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
