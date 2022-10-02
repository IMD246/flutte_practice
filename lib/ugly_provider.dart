import 'package:flutter/material.dart';

class UglyProvider extends StatefulWidget {
  final Widget child;
  const UglyProvider({super.key, required this.child});

  @override
  State<UglyProvider> createState() => _UglyProviderState();

  // ignore: library_private_types_in_public_api
  static _UglyProviderState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_UglyProvider>()!).data;
  }
}

class _UglyProviderState extends State<UglyProvider> {
  late int count;
  @override
  void initState() {
    count = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _UglyProvider(
      data: this,
      child: widget.child,
    );
  }
}

class _UglyProvider extends InheritedWidget {
  final _UglyProviderState data;
  const _UglyProvider({required this.data, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
