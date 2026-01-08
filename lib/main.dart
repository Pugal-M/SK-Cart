import 'package:myapp/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/core/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: PRO_API, anonKey: API_ANON);

  runApp(const SKCartApp());
}

class SKCartApp extends StatelessWidget {
  const SKCartApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SKCart",
      home: AuthGate(),
    );
  }
}
