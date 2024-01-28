import 'package:firebase_core/firebase_core.dart';
import 'package:learning_app/firebase_options.dart';
import 'package:learning_app/src/services/storage_service.dart';

import 'src/app/app.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    storageService = await StorageService().init();
  }
}
