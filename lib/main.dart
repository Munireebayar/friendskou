import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:friendskou/pages/login_page.dart';
import 'package:friendskou/resources/auth.dart';
import 'utils/color.dart';
import 'pages/register_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: 'AIzaSyB0R9LruyE-Om9fEnkRaIrglcOq5Fpw2ME', 
      appId: '1:663021204331:web:44c064da11d74acf01122e', 
      messagingSenderId: '663021204331', 
      projectId: 'friendskou',
      storageBucket: 'friendskou.appspot.com'
    ),
  );
  }
  else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Friends Koü',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: colorWhite(),
        primaryColor: colorGreen3(),
      ),
      home: AuthPage(),
      //home: const ResponsiveScreen(
        //mobileScreenLayout:MobileScreenLayout(),
        //webScreenLayout:WebScreenLayout(),
    );
  }
}