import 'dart:async';

import 'package:inhirited_app/contact_service.dart';
import 'package:rxdart/rxdart.dart';

import 'contact.dart';

class ContactManager {
  final BehaviorSubject<int> _contactCount = BehaviorSubject<int>();

  Stream<int> get count$ => _contactCount.stream;
  Stream<List<Contact>> browse$({required String? query}) =>
      Stream.fromFuture(ContactService.browse(query: query));

  ContactManager() {
    browse$(query: null).listen((event) {
      _contactCount.add(event.length);
    });
  }
  void dispose() {
    _contactCount.close();
  }
}
