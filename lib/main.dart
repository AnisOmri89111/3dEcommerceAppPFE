import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pfeprojectcar/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pfeprojectcar/data/repos/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async{
  //Edit Widget Binding
  final WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();

//GetxStorage Initialisation 
  await GetStorage.init();
  //Splash Screen Once
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding) ;
  //Firebase Initialization 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
).then((FirebaseApp value) => Get.put( AuthenticationRepository()));
  runApp(const App());
}
