import 'package:flutter_iot_security_cam/src/domain/people/model/person.dart';
import 'package:flutter_iot_security_cam/src/domain/people/repository/people_repository.dart';

class PeopleRepositoryImpl extends PeopleRepository{

  @override
  Future<bool> addPerson(Person person) {
    // TODO: implement addPerson
    throw UnimplementedError();
  }

  @override
  Future<bool> allowPeople(bool enabled) {
    // TODO: implement allowPeople
    throw UnimplementedError();
  }

  @override
  Future<bool> removePerson(int personId) {
    // TODO: implement removePerson
    throw UnimplementedError();
  }

  @override
  Stream<List<Person>> subscribePeople() {
    // TODO: implement subscribePeople
    throw UnimplementedError();
  }

  @override
  Future<bool> allowPerson(int personId) {
    // TODO: implement allowPerson
    throw UnimplementedError();
  }

  @override
  Future<bool> banPerson(int personId) {
    // TODO: implement banPerson
    throw UnimplementedError();
  }

}