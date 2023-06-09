import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_maps/app_router.dart';
import 'package:flutter_maps/constants/strings.dart';
import 'firebase_options.dart';

late String initialRoute;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if(user == null){
      initialRoute = MyStrings.loginScreen;
    } else{
      initialRoute = MyStrings.mapScreen;
    }
  });
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
