import 'package:day08_shared_preferences/preferences_service.dart';
import 'package:day08_shared_preferences/programming_language.dart';
import 'package:day08_shared_preferences/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'gender.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferencesService = PreferencesService();

  final _usernameController = TextEditingController();
  var _selectedGender = Gender.Female;
  var _selectedLanguages = Set<ProgrammingLanguage>();
  var _isEmployed = false;

  @override
  void initState() {
    super.initState();
    _populateFields();
  }

  void _populateFields() async {
    final settings = await _preferencesService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedLanguages = settings.programmingLanguages;
      _isEmployed = settings.isEmployed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: TextField(
                decoration: InputDecoration(labelText: 'Username'),
                controller: _usernameController,
              ),
            ),
            for (var gender in Gender.values)
              RadioListTile(
                title: Text(describeEnum(gender)),
                value: gender,
                groupValue: _selectedGender,
                onChanged: (newValue) => _genderSelected(newValue),
              ),
            for (var language in ProgrammingLanguage.values)
              CheckboxListTile(
                title: Text(describeEnum(language)),
                value: _selectedLanguages.contains(language),
                onChanged: (_) => _languageSelected(language),
              ),
            SwitchListTile(
                title: Text('Is Employed'),
                value: _isEmployed,
                onChanged: (newValue) => _switchSelected(newValue)),
            TextButton(onPressed: _saveSettings, child: Text('Save Settings'))
          ],
        ),
      ),
    );
  }

  void _genderSelected(Gender gender) {
    setState(() => _selectedGender = gender);
  }

  void _languageSelected(ProgrammingLanguage language) {
    setState(() {
      _selectedLanguages.contains(language)
          ? _selectedLanguages.remove(language)
          : _selectedLanguages.add(language);
    });
  }

  void _switchSelected(bool value) {
    setState(() => _isEmployed = value);
  }

  void _saveSettings() {
    final newSettings = Settings(_usernameController.text, _selectedGender,
        _selectedLanguages, _isEmployed);

    print(newSettings);

    _preferencesService.saveSettings(newSettings);
  }
}
