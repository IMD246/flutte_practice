import 'package:flutter/material.dart';
import 'presentation/view/app.dart';
import 'presentation/services/provider/overseer.dart';
import 'presentation/services/provider/provider.dart';
import 'presentation/services/provider/ugly_provider.dart';

void main() {
  runApp(const EmailApp());
}

class EmailApp extends StatelessWidget {
  const EmailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const UglyProvider(
          child: App(),
        ),
      ),
    );
  }
}
