import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'user_info_page.dart';
import 'register_form_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  String name = '';
  String dob = '';
  String phone = '';
  String email = '';
  String country = '';

  void updateUserInfo(String n, String d, String p, String e, String c) {
    setState(() {
      name = n;
      dob = d;
      phone = p;
      email = e;
      country = c;
      _selectedIndex = 1;
    });
  }

  List<Widget> get _pages => [
        RegisterFormPage(onSubmit: updateUserInfo),
        UserInfoPage(name: name, dob: dob, phone: phone, email: email, country: country),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('registration_form'.tr()),
        actions: [
          IconButton(
            onPressed: () {
              final newLocale = context.locale.languageCode == 'en' ? const Locale('kk') : const Locale('en');
              context.setLocale(newLocale);
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.app_registration), label: 'form'.tr()),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'info'.tr()),
        ],
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
