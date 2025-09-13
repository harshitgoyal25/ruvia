import 'package:flutter/material.dart';
import 'package:sih/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'login_screen.dart';
import 'me_page.dart';
import 'startRun.dart';
import 'insights.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://zwudcebtsexnnbkwhoun.supabase.co',
    anonKey:
        "JhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp3dWRjZWJ0c2V4bm5ia3dob3VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc1MjgwMzIsImV4cCI6MjA3MzEwNDAzMn0.EMtM4647RwjfTUxo_RLVWWspqPpftGO2ltzk0BPP1F0",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INTVL',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home': (context) => HomePage(),
        '/me': (context) => MePage(),
        '/run': (context) => StartRunPage(),
        '/insights':(context)=> InsightsPage(),

        // Add routes for signup, forgot password, home, etc.
      },
    );
  }
}
