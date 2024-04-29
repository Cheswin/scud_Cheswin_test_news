import 'package:flutter/material.dart';
import 'package:news_app_test/view/pages/newsScreen/postScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadToPage();
    super.initState();
  }

  loadToPage() async {
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PostScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Align(alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.newspaper,size: 200,color: Colors.black,),
                Text("GOOGLE NEWS"),
              ],
        
           
        ),
      ),
    );
  }
}
