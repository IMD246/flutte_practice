import 'package:flutter/material.dart';
import 'package:inhirited_app/presentation/services/provider/provider.dart';
import 'package:inhirited_app/presentation/view/contactScreen/components/contact_counter.dart';
import 'package:inhirited_app/presentation/view/contactScreen/components/contact_search_deletegate.dart';
import 'contactScreen/components/contact_list_builder.dart';
import 'contactScreen/components/contact_manager.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactManager contactManager =
        Provider.of(context).fetch(ContactManager);
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Chip(
            backgroundColor: Colors.blue,
            label: ContactCounter(),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ContactSearchDelegate(contactManager),
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ContactListBuilder(
        stream: contactManager.browse$(query: null),
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
      ),
    );
  }
}

