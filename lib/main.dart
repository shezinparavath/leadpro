import 'package:flutter/material.dart';
import 'package:leadpro/provider/common_provider.dart';
import 'package:leadpro/routing/named_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
void openEndDrawer() {
  scaffoldKey.currentState!.openEndDrawer();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CommonProvider())
    ], child: MaterialApp.router(routerConfig: NamedNavigation.router));
  }
}
