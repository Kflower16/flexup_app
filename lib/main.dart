import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      title: Text("facebook", style: TextStyle(color: Color(0xFF005aff), fontWeight: FontWeight.bold, fontSize: 27)),
      actions: [
        IconButton(icon: SvgPicture.asset('assets/icons/ic_add_outline.svg'), onPressed: (){},),
        IconButton(icon: SvgPicture.asset('assets/icons/ic_find_outline.svg'), onPressed: (){},),
        IconButton(icon: SvgPicture.asset('assets/icons/ic_messenger_filled.svg'), onPressed: (){},),
      ],
    ),
    body: ListView(
      children: [
        //composer
        _StatusComposer(),

        //stories
        _StoriesSection(),
      ],
    ),
    bottomNavigationBar: _FacebookBottomNav(),
   );
  }

}

class _StatusComposer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/img_ava_2.jpg'),),
          SizedBox(width: 10,),
          Expanded(child: Row(
            children: [
              Text("Bạn đang nghĩ gì ?"),
              Expanded(child: const SizedBox(width: 300,)),
              Icon(Icons.image)
            ],
          ))
        ],
      ),
    );
  }

}

class _StoriesSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 3,),
          _StoryItem(imagaPath: 'assets/images/img_ava_1.jpg',userName: 'Mỹ Tiên', userAvatarPath: 'assets/images/img_ava_1.jpg', userOnline: false,),
          _StoryItem(imagaPath: 'assets/images/img_ava_2.jpg',userName: 'Hồng Ngọc', userAvatarPath: 'assets/images/img_ava_2.jpg',userOnline: true,),
          _StoryItem(imagaPath: 'assets/images/img_ava_3.jpg',userName: 'Trúc Lan', userAvatarPath: 'assets/images/img_ava_3.jpg',userOnline: false,),
          _StoryItem(imagaPath: 'assets/images/img_ava_2.jpg',userName: 'Gia Hân', userAvatarPath: 'assets/images/img_ava_2.jpg',userOnline: true,),
          _StoryItem(imagaPath: 'assets/images/img_ava_3.jpg',userName: 'Ánh Nguyệt', userAvatarPath: 'assets/images/img_ava_3.jpg',userOnline: false,),
          _StoryItem(imagaPath: 'assets/images/img_ava_1.jpg',userName: 'Ngọc Bảo', userAvatarPath: 'assets/images/img_ava_1.jpg',userOnline: true,),
        ],
      ),
    );
  }

}

class _StoryItem extends StatelessWidget{
  final String imagaPath;
  final String userName;
  final String userAvatarPath;
  final bool userOnline;

  const _StoryItem({required this.imagaPath, required this.userAvatarPath, required this.userName, required this.userOnline});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imagaPath
          )
        ),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF005aff),
                      width: 3,
                    )
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(userAvatarPath),
                    radius: 12,
                  )
                ),
                userOnline?
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12.3,
                    height: 12.3,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      )
                    ),
                  ),
                ):const SizedBox(),
              ],
            ),
            Expanded(child: const SizedBox(height: 200,)),
            Text(
              userName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }

}

class _FacebookBottomNav extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, 
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
        BottomNavigationBarItem(icon: Icon(Icons.ondemand_video), label: 'Reels'),
        BottomNavigationBarItem(icon: Icon(Icons.face_5_outlined), label: 'Bạn bè'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Thông báo'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      ],
    );
  }

}