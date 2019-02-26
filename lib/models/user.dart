class User {
  String firstName = '';
  String lastName = '';
  Map<String, bool> passions = {};
  bool newsletter = false;

  User() {
    passions[Activity.Cooking] = false;
    passions[Activity.Traveling] = false;
    passions[Activity.Hiking] = false;
  }

  save() {
    print('saving user using a web service');
  }
}

class Activity {
  static const Cooking = 'cooking';
  static const Traveling = 'traveling';
  static const Hiking = 'hiking';
}
