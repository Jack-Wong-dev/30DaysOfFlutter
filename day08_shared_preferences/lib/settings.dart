import 'package:day08_shared_preferences/programming_language.dart';

import 'gender.dart';

class Settings {
  final String username;
  final Gender gender;
  final Set<ProgrammingLanguage> programmingLanguages;
  final bool isEmployed;

  Settings(
      this.username, this.gender, this.programmingLanguages, this.isEmployed);
}
