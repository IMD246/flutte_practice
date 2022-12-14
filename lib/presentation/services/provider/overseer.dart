
import '../bloc/contact_manager.dart';
import '../bloc/counter_manager.dart';

class Overseer {
  Map<dynamic, dynamic> repository = {};
  Overseer() {
    register(ContactManager, ContactManager());
    register(CounterManager, CounterManager());
  }
  register(name, object) {
    return repository[name] = object;
  }

  fetch(name) {
    return repository[name];
  }
}
