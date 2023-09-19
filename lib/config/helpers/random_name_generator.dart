import 'package:random_name_generator/random_name_generator.dart';

class RandomGenerator {
  static String getRandomName() {
    final name = RandomNames(Zone.spain);
    return name.fullName();
  }

  static Stream<String> randomNamesStream() {
    return Stream.periodic(const Duration(seconds: 2), (i) {
      print('Strema new value');
      return getRandomName();
    });
  }
}
