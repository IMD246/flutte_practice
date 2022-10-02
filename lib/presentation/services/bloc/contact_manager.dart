import 'package:rxdart/rxdart.dart';

import '../../../data/models/contact.dart';
import '../../../data/repository/contact_service.dart';

class ContactManager {
  final PublishSubject<String> _filterSubject = PublishSubject<String>();
  final PublishSubject<int> _countSubject = PublishSubject<int>();
  final PublishSubject<List<Contact>> _collectionSubject = PublishSubject();

  Sink<String> get inFilter => _filterSubject.sink;

  Stream<int> get count$ => _countSubject.stream;
  Stream<List<Contact>> get browse$ => _collectionSubject.stream;

  ContactManager() {
    _filterSubject.stream.listen((filter) async {
      var contacts = await ContactService.browse(query: filter);
      _collectionSubject.add(contacts);
    });
    _collectionSubject.listen((value) {
      _countSubject.add(value.length);
    });
  }
  void dispose() {
    _countSubject.close();
    _filterSubject.close();
  }
}
