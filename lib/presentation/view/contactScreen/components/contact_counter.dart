import 'package:flutter/material.dart';

import '../../../services/provider/provider.dart';
import '../../../widgets/observer.dart';
import '../../../services/bloc/contact_manager.dart';

class ContactCounter extends StatelessWidget {
  const ContactCounter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactManager contactManager =
        Provider.of(context).fetch(ContactManager);
    return Observer<int>(
      stream: contactManager.count$,
      onError: (context, error) {
        return Text(error.toString());
      },
      onSuccess: (context, data) {
        return Chip(
          backgroundColor: Colors.red,
          label: Text(
            (data ?? 0).toString(),
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
      onLoading: null,
    );
  }
}
