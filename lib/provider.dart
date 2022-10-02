import 'package:flutter/cupertino.dart';
import 'package:inhirited_app/overseer.dart';

class Provider extends InheritedWidget {
  final Overseer data;

  const Provider({
    super.key,
    required Widget child,
    required this.data,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant Provider oldWidget) {
    return data != oldWidget.data;
  }

  static Overseer of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.data;
  }
}
