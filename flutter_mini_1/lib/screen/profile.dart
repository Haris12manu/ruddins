import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 28, 27, 27),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black), // เพิ่มกรอบด้วย Border
          borderRadius: BorderRadius.circular(10), // ให้มีมุมโค้ง
        ),
        padding: const EdgeInsets.all(20), // เพิ่มพื้นที่ว่างรอบขอบ
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                'https://scontent.fbkk20-1.fna.fbcdn.net/v/t39.30808-6/320694087_544177397619155_3846933314827401998_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=1b51e3&_nc_eui2=AeF-sGexx_IyErGeGwyRucBI4Hk4no8zssjgeTiejzOyyPlEkKoh321VnixbhK39zB3IGq0bIBfm5dbXYSl4T8Q5&_nc_ohc=OzdyJrAC3SUAX91Tb5z&_nc_ht=scontent.fbkk20-1.fna&_nc_e2o=f&oh=00_AfAfIo2AZNNt_Pf2n_oUgYB5cdwKlVskWM-Hdz94RUY2Jg&oe=6523A6B4',
              ),
            ),
            const SizedBox(height: 20),
            itemProfile('ชื่อ', 'ฮาริส เจะโมะ', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('เบอร์โทร', '0650691040', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile('ที่อยู่', '65/5 ม.4 ต.ตลิ่งชั่น อ.บันนังสตา จ.ยะลา ',
                CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', 'harisjehmoh11@gmail.com', CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            itemProfile('มหาวิทยาลัย', 'ราชภัฏยะลา', CupertinoIcons.map),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BottomNavBar();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                    primary: Colors.white, // ตั้งค่าสีพื้นหลังของปุ่ม
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Back to home',
                        style: TextStyle(
                            color: Colors.black), // ตั้งค่าสีของข้อความ
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 81, 76, 76),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.blue.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        tileColor: const Color.fromARGB(255, 62, 61, 61),
      ),
    );
  }
}
