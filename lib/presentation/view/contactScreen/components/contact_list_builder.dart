import 'package:flutter/material.dart';

import '../../../../data/models/contact.dart';
import '../../../widgets/observer.dart';

class ContactListBuilder extends StatelessWidget {
  const ContactListBuilder(
      {super.key, required this.stream, required this.builder});
  final Stream<List<Contact>> stream;
  final Function builder;

  @override
  Widget build(BuildContext context) {
    return Observer<List<Contact>>(
      stream: stream,
      onLoading: null,
      onError: (p0, p1) {
        return Text("error+$p1.toString()");
      },
      onSuccess: (context, data) {
        return builder(context, data);
      },
    );
  }
}
