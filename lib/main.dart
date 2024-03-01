import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/gemstore.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  runApp(const Gemstore());
}


