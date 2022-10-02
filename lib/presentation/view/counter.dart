import 'package:flutter/material.dart';
import '../services/bloc/counter_manager.dart';
import '../widgets/observer.dart';
import 'package:inhirited_app/presentation/services/provider/provider.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    CounterManager manager = Provider.of(context).fetch(CounterManager);
    return Center(
      child: Observer<int>(
        stream: manager.counter$,
        onError: (context, error) {
          return Text(
            error.toString(),
          );
        },
        onSuccess: (contet, data) {
          int count = data ?? 0;
          return Text("Calender: $count");
        },
        onLoading: null,
      ),
    );
  }
}
