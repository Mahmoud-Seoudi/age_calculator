class AgeCalculator {
  static int age;

  AgeCalculator(int birthYear) {
    age = DateTime.now().year - birthYear;
  }
}
