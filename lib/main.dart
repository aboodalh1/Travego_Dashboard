import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:travego_dashboard/Dio/dioHelper.dart';
import 'feature/desktop_feature/presentation/desktop/users/Users.dart';
import 'feature/desktop_feature/presentation/desktop/desktoplog.dart';
import 'feature/desktop_feature/presentation/desktop/provider.dart';

void main() async {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 1000, tablet: 510, watch: 500),
  );
  await DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Mypro>(create: (_) => Mypro()),
      ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'safariat Alabood ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routes: const {
        // PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
        //  EditPlaceScreen.routeName: (ctx) => EditPlaceScreen(),
      },
      home: ScreenTypeLayout.builder(
        // mobile: (BuildContext context) => const Mobilelogin(),
        // tablet: (BuildContext context) => const Tabletlogin(),
        desktop: (BuildContext context) => Desktoplogin(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    throw const Scaffold(
      body: Center(
        child: Text('Welcome'),
      ),
    );
  }
}
