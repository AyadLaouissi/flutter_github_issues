import 'package:flutter/material.dart';
import 'package:flutter_media_markt/presentation/notifier/theme_notifier.dart';
import 'package:flutter_media_markt/presentation/views/issues_list_page.dart';
import 'package:provider/provider.dart';
import 'di/get_it.dart' as getIt;
import 'package:pedantic/pedantic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(getIt.init());
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, theme, child) {
          return MaterialApp(
            title: 'Github issues',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: theme.currentTheme(),
            debugShowCheckedModeBanner: false,
            home: child,
          );
        },
        child: IssuesListPage(),
      ),
    );
  }
}