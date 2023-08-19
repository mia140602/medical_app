import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_app/services/storage_service.dart';

class Global{
  static late StorageService storageService;
  static Future init() async{
      WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(

  );
  storageService = await StorageService().init();

  }
}