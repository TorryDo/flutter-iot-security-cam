import 'package:flutter_iot_security_cam/src/domain/people/model/person.dart';

abstract class PeopleRepository{

  Future<bool> allowPeople(bool enabled);

  Future<bool> addPerson(Person person);
  Future<bool> removePerson(int personId);

  Future<bool> allowPerson(int personId);
  Future<bool> banPerson(int personId);

  Stream<List<Person>> subscribePeople();




}