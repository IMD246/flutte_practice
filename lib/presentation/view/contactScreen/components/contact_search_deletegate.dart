import 'package:flutter/material.dart';

import '../../../services/bloc/contact_manager.dart';
import 'contact_list_builder.dart';

class ContactSearchDelegate extends SearchDelegate {
  final ContactManager manager;

  ContactSearchDelegate(this.manager);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Center(
        child: Text(
          "Your query is $query",
        ),
      );
    }
    manager.inFilter.add(query);
    return ContactListBuilder(
      stream: manager.browse$,
      builder: (context, contacts) {
        return ListView.separated(
          itemBuilder: (context, index) {
            final contact = contacts.elementAt(index);
            return ListTile(
              title: Text(
                contact.name,
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(thickness: 3);
          },
          itemCount: contacts.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
