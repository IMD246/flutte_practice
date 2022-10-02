
class Contact {
  final String name;
  final String email;
  final String phone;
  Contact({
    required this.name,
    required this.email,
    required this.phone,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory Contact.fromJson(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
    );
  }
}
