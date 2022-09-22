import 'package:android_noti/noti_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    setupNoti();
  }

  Future<void> setupNoti() async {
    await Firebase.initializeApp().then((value) async {
      FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
      String? token = await firebaseMessaging.getToken();
      print("token ==>> $token");
    });

    //When App is opened
    FirebaseMessaging.onMessage.listen((event) { 
      String? title = event.notification!.title;
      String? body = event.notification!.body;
      print("Noti Open App title===>>> $title, body===>>> $body");
      NotiDialog(context: context).myDialog(title!, body!);
    });

    //When App is closed
    FirebaseMessaging.onMessageOpenedApp.listen((event) { 
      String? title = event.notification!.title;
      String? body = event.notification!.body;
      print("Noti Close  App title===>>> $title, body===>>> $body");
      NotiDialog(context: context).myDialog(title!, body!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('This is home page'),
    );
  }
}