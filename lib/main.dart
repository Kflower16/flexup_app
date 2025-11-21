import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flex Up App',
      theme: ThemeData(
        primarySwatch: Colors.blue
        // primaryColor: Color(0xFF1c1c1d),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      title: Text("facebook", style: TextStyle(color: Color(0xFF005aff), fontWeight: FontWeight.bold)),
      actions: [
        IconButton(icon: SvgPicture.asset('assets/icons/ic_add_outline.svg'), onPressed: (){},),
        IconButton(icon: SvgPicture.asset('assets/icons/ic_find_outline.svg'), onPressed: (){},),
        IconButton(icon: SvgPicture.asset('assets/icons/ic_messenger_filled.svg'), onPressed: (){},),
      ],
    ),
    body: Center(
      child: Text("Body"),
    ),
    bottomNavigationBar: Text("BottomNavigationBar",style: TextStyle(color: Colors.amber),),
   );
  }

}