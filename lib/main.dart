import 'locator.dart';

void main() {
  // Chamando método responsável por gerenciar as instânciações feitas
  // no início do projeto/app, semelhante o que é feito no get_it
  setupLocator();

  final person = Person('Pedro');
  final lazyPerson = Person('João');

  locator.registerSingleton<Person>(person);
  locator.registerLazySingleton<Person>(() => lazyPerson, name: 'lazy');

  print(locator.isRegistered<Person>()); // true
  print(locator.isRegistered<Person>(name: 'lazy')); // false

  print('');

  print(locator<Person>().name); // Pedro
  print(locator.get<Person>(name: 'lazy').name); // João

  locator.unregister<Person>();

  print('');

  print(locator.isRegistered<Person>()); // false
  print(locator.isRegistered<Person>(name: 'lazy')); // true
}

class Person {
  Person(this.name);

  late final String name;
}
