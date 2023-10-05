import 'package:flutter/material.dart';
import 'package:flutter_mini_1/model/Transactions.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionDetailScreen extends StatelessWidget {
  final Transactionss transaction;

  TransactionDetailScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://mangaplus.shueisha.co.jp/icn/app_icon_192.png',
                width: 30, // กำหนดความกว้างของโลโก้
                height: 30, // กำหนดความสูงของโลโก้
                fit: BoxFit.cover, // กำหนดวิธีการแสดงผล
              ),
              SizedBox(width: 8), // ระยะห่างระหว่างโลโก้กับข้อความ
              Text("DETAIL"),
            ],
          ),
          centerTitle: true, // จัดให้ Title อยู่ตรงกลาง
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 300,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                          20), // ให้มุม Container มีความโค้ง
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          20), // ให้มุมภาพทั้ง 4 มุมมีความโค้ง
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Image.file(
                          transaction.imageBytes,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  "เกมส์: " + transaction.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.cyan,
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue), // กำหนดสีเส้นขอบ
                      borderRadius: BorderRadius.circular(10.0), // กำหนดมุมโค้ง
                    ),
                    padding: EdgeInsets.all(8.0), // กำหนดระยะห่างรอบขอบ
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "รายละเอียด",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          transaction.textEditing,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              const url =
                                  'https://www.happyconsole.com/category/55/playstation-5/ps5-games';
                              // ignore: deprecated_member_use
                              if (await canLaunch(url)) {
                                // ignore: deprecated_member_use
                                await launch(url);
                              } else {
                                throw 'ไม่สามารถเปิดลิงก์ได้: $url';
                              }
                            },
                            child: Text('กดสั่งซื้อ'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
