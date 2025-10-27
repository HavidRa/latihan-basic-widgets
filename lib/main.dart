import 'package:flutter/material.dart';
import 'screens/profile_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(ProfileCardApp());
}

class ProfileCardApp extends StatefulWidget {
  @override
  State<ProfileCardApp> createState() => _ProfileCardAppState();
}

class _ProfileCardAppState extends State<ProfileCardApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Card App'),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(Icons.color_lens_outlined, color: Colors.white),
              onSelected: (value) {
                setState(() {
                  if (value == 'Terang') _themeMode = ThemeMode.light;
                  else if (value == 'Gelap') _themeMode = ThemeMode.dark;
                  else _themeMode = ThemeMode.system;
                });
              },
              itemBuilder: (_) => [
                PopupMenuItem(value: 'Terang', child: Text('Tema Terang')),
                PopupMenuItem(value: 'Gelap', child: Text('Tema Gelap')),
                PopupMenuItem(value: 'Otomatis', child: Text('Tema Otomatis')),
              ],
            ),
          ],
        ),
        body: ProfilePage(),
      ),
    );
  }
}
