import 'package:flutter/material.dart';
import 'package:inhirited_app/counter_manager.dart';
import 'package:inhirited_app/observer.dart';
import 'package:inhirited_app/provider.dart';

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
