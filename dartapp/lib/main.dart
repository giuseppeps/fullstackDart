import 'package:dartapp/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'injection.dart' as ij;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ij.init();
  await Supabase.initialize(
    url: 'https://uhraxsxingzpkqykfrkp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVocmF4c3hpbmd6cGtxeWtmcmtwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTg4NDAyMTQsImV4cCI6MTk3NDQxNjIxNH0.dq90nf4_hMAcZT6IlbXZdG1UovmdovwZlyVKflYH634',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}
