import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inhirited_app/data/models/contact.dart';

class ContactService {
  static const String _url = "https://jsonplaceholder.typicode.com/users";
  static Future<List<Contact>> browse({required String? query}) async {
    final response = await http.get(
      Uri.parse(_url),
    );
    String content = response.body;
    List collection = jsonDecode(content);

    Iterable<Contact> contacts = collection.map((json) {
      return Contact.fromJson(json);
    });

    if (query != null && query.isNotEmpty) {
      contacts = contacts.where(
        (element) => element.name.toLowerCase().contains(query),
      );
    }
    return contacts.toList();
  }
}
