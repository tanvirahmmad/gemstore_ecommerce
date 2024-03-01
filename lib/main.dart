import 'package:flutter/material.dart';
import 'package:gemstore_ecommerce/gemstore.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'common/notification_manager.dart';
import 'data/local_storage/product_storage/product_storage_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationManager().init();

  await Hive.initFlutter();
  ProductStorageManager().init();

  runApp(const Gemstore());
}
