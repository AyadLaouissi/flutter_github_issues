import 'package:flutter/material.dart';
import 'package:flutter_media_markt/presentation/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SwitchListTile(
        value: themeNotifier.isDarkTheme,
        onChanged: themeNotifier.switchTheme,
        title: Text('Dark mode'),
      ),
    );
  }
}
