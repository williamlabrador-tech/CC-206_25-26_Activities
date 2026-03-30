// CONCEPT 1: Class and Object Creation
class Animal {
  // CONCEPT 2: Attributes / Properties
  String name;
  String kingdom;
  DateTime dob;
  int numLegs;

  // CONCEPT 3: Constructor
  Animal(this.name, this.kingdom, this.dob, this.numLegs);

  // CONCEPT 4: Method with Condition (if-else)
  void walk(String direction) {
    if (numLegs <= 0) {
      print("$name can't walk because it has no legs.");
    } else {
      print("$name is walking towards the $direction.");
    }
  }

  // CONCEPT 5: Method Returning Value (MULTILINE FORMAT)
  String displayInfo() {
    return "Animal Info - \n"
        "Name: $name \n"
        "Kingdom: $kingdom \n"
        "DOB: ${dob.toLocal().toString().split(' ')[0]} \n"
        "Legs: $numLegs";
  }
}

// CONCEPT 6: Inheritance (Pet extends Animal)
class Pet extends Animal {
  String? nickname;
  int kindness;

  // CONCEPT 7: Constructor WITHOUT nickname
  Pet.withoutNickname(String name, String kingdom, DateTime dob, int numLegs)
      : kindness = 0,
        super(name, kingdom, dob, numLegs);

  // CONCEPT 8: Constructor WITH nickname (sets kindness positive)
  Pet.withNickname(
    String name,
    String kingdom,
    DateTime dob,
    int numLegs,
    this.nickname,
  ) : kindness = 50,
      super(name, kingdom, dob, numLegs);

  // CONCEPT 9: Method (decreasing value)
  void kick(int decreaseValue) {
    kindness -= decreaseValue;
    print("You kicked $name. Kindness is now $kindness.");
  }

  // REQUIRED NAME: pet()
  void pet(int increaseValue) {
    if (kindness < 0) {
      print("Failed to pet $name. Kindness is too low ($kindness).");
    } else {
      kindness += increaseValue;
      print("You petted $name. Kindness is now $kindness.");
    }
  }

  // CONCEPT 10: Custom Method (increase kindness)
  void feedTreat(int value) {
    kindness += value;
    print("${nickname ?? name} enjoyed a treat! Kindness is now $kindness.");
  }

  // MULTILINE FORMAT for Pet
  @override
  String displayInfo() {
    return "${super.displayInfo()} \n"
        "Nickname: ${nickname ?? 'None'} \n"
        "Kindness: $kindness";
  }
}

void main() {
  // LIST of Animals (ZOO)
  List<Animal> ZOO = [
    Animal("Lion", "Animalia", DateTime(2018, 5, 12), 4),
    Animal("Python", "Animalia", DateTime(2020, 8, 20), 0),
    Animal("Eagle", "Animalia", DateTime(2019, 3, 15), 2),
    Animal("Dolphin", "Animalia", DateTime(2015, 11, 2), 0),
    Animal("Elephant", "Animalia", DateTime(2010, 7, 24), 4),
  ];

  print("=== ZOO ===");

  // Loop through ZOO
  for (var animal in ZOO) {
    print(animal.displayInfo());
    print(""); // ✅ FIXED
    animal.walk("North");
    print("----------------------");
  }

  // LIST of Pets (PET_HOME)
  List<Pet> PET_HOME = [
    Pet.withNickname("Dog", "Animalia", DateTime(2021, 1, 1), 4, "Buddy"),
    Pet.withNickname("Cat", "Animalia", DateTime(2022, 2, 2), 4, "Luna"),
    Pet.withoutNickname("Parrot", "Animalia", DateTime(2023, 3, 3), 2),
  ];

  print("\n=== PET HOME ===");

  // Display all pet info (NOW MULTILINE)
  for (var pet in PET_HOME) {
    print(pet.displayInfo());
    print("----------------------");
  }

  // Decrease kindness below 0
  print("\n-- Manipulating Dog --");
  PET_HOME[0].kick(100);
  PET_HOME[0].pet(20);

  // Increase kindness above 1000
  print("\n-- Manipulating Cat --");
  PET_HOME[1].feedTreat(1000);
  PET_HOME[1].pet(50);

  // Additional pet
  print("\n-- Manipulating Parrot --");
  PET_HOME[2].feedTreat(20);
}