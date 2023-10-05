import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BottomNavigationBar,
        BottomNavigationBarItem,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Card,
        Center,
        Colors,
        Container,
        DecorationImage,
        EdgeInsets,
        FontWeight,
        Icon,
        Icons,
        Image,
        Key,
        ListTile,
        ListView,
        MaterialApp,
        MaterialPageRoute,
        Navigator,
        NetworkImage,
        Scaffold,
        State,
        StatefulWidget,
        StatelessWidget,
        Text,
        TextStyle,
        ThemeData,
        ThemeMode,
        Widget,
        runApp;
import 'package:flutter/services.dart';
import 'package:flutter_mini_1/providers/transaction_provider.dart';
import 'package:flutter_mini_1/screen/form_screen.dart';
import 'package:flutter_mini_1/screen/play_detail_screen.dart';
import 'package:flutter_mini_1/screen/play_selection_screen.dart';
import 'package:flutter_mini_1/screen/profile.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) {
            return TransactionProvider();
          })
        ],
        child: MaterialApp(
          title: 'MANGA PLUS',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.tealAccent,
          ),
          home: BottomNavBar(),
          themeMode:
              ThemeMode.dark, // เพิ่มบรรทัดนี้หากต้องการให้แอปแสดงในโหมดมืด
          darkTheme:
              ThemeData.dark(), // เพิ่มบรรทัดนี้หากต้องการให้แอปแสดงในโหมดมืด
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://t4.ftcdn.net/jpg/03/37/08/65/360_F_337086574_uXbsZ1Hp8ct74pDsH7zauxXSMo9kNlX7.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: child,
            );
          },
        ));
  }
}

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PS5 AND PS4',
        ),
        leading: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/PlayStation_logo.svg/2560px-PlayStation_logo.svg.png',
          width: 30, // กำหนดความกว้างของโลโก้
          fit: BoxFit.cover, // ปรับขนาดของรูปให้พอดี
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          switch (index) {
            case 2: // ถ้าถูกเลือก index ที่ 2 (เพิ่มข้อมูล)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FormScreen(); // ไปยังหน้า FormScreen()
                }),
              );
              break;
            case 1: // ถ้าถูกเลือก index ที่ 2 (เพิ่มข้อมูล)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return CategorySelectionScreen(); // ไปยังหน้า FormScreen()
                }),
              );
              break;
            case 3: // ถ้าถูกเลือก index ที่ 2 (เพิ่มข้อมูล)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return Profile(); // ไปยังหน้า FormScreen()
                }),
              );
              break;
            default:
              setState(() {
                _currentIndex = index;
              });
          }
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_display),
            label: 'แสดง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'เพิ่มข้อมูล',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            child: Card(
              elevation: 15,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              color: Colors.cyan,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(4), // กำหนดความโค้งของ Box
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://blog.playstation.com/tachyon/2023/07/f7e0e13c08bb54dd65030eeeca56daf130abdb14.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'SPORT',
                      style: TextStyle(
                        fontSize: 24, // กำหนดขนาดฟอนต์
                        color: Colors.black, // กำหนดสีฟอนต์
                        fontWeight: FontWeight.w100, // (ตัวหนา) ตัวเลือก
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryDetailScreen(category: 'SPORT');
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            child: Card(
              elevation: 15,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              color: Colors.cyan,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(4), // กำหนดความโค้งของ Box
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://e0.pxfuel.com/wallpapers/614/635/desktop-wallpaper-genshin-impact-digital-art-2022-games-and-background.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'ADVENTURE',
                      style: TextStyle(
                        fontSize: 24, // กำหนดขนาดฟอนต์
                        color: Colors.black, // กำหนดสีฟอนต์
                        fontWeight: FontWeight.bold, // (ตัวหนา) ตัวเลือก
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryDetailScreen(category: 'ADVENTURE');
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            child: Card(
              elevation: 15,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              color: Colors.cyan,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(4), // กำหนดความโค้งของ Box
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.pockettactics.com/wp-content/uploads/2021/05/PUBG-Mobile-wallpapers-new.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'SHOOTING',
                      style: TextStyle(
                        fontSize: 24, // กำหนดขนาดฟอนต์
                        color: Colors.black, // กำหนดสีฟอนต์
                        fontWeight: FontWeight.w100, // (ตัวหนา) ตัวเลือก
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryDetailScreen(category: 'SHOOTING');
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            child: Card(
              elevation: 15,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              color: Colors.cyan,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(4), // กำหนดความโค้งของ Box
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://e0.pxfuel.com/wallpapers/374/753/desktop-wallpaper-jump-force-in-ultra-games.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      'FIGHTT',
                      style: TextStyle(
                        fontSize: 24, // กำหนดขนาดฟอนต์
                        color: Colors.black, // กำหนดสีฟอนต์
                        fontWeight: FontWeight.w100, // (ตัวหนา) ตัวเลือก
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryDetailScreen(category: 'FIGHT');
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // เพิ่มรายการประเภทอื่น ๆ ตามต้องการ
        ],
      ),
    );
  }
}
