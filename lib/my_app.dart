
import 'package:flutter/material.dart';
import 'routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aula 6',
      debugShowCheckedModeBanner: false,
      theme: ioasysThemeData,
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

final ThemeData ioasysThemeData = ThemeData(
  fontFamily: 'Poppins',
  primarySwatch: Colors.blue,
  iconTheme: IconThemeData(color: Color(0xFFC1007E)),
  listTileTheme: ListTileThemeData(iconColor: Color(0xFFC1007E)),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Color(0xFFC1007E),
    secondary: Color(0xFF919191),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: Color(0xFFC1007E)),
  ),
  toggleableActiveColor: Color(0xFFC1007E),
);
