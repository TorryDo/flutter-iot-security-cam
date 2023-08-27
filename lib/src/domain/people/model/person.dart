import 'dart:typed_data';

class Person {
  final int id;
  final String name;
  final ByteData imageData;

  const Person(this.id, this.name, this.imageData);
}
