import 'package:digifly/core/utils/sharded_pref.dart';
import 'package:digifly/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppService.initializeSharedPreferences();
  runApp(const MyApp());
}


