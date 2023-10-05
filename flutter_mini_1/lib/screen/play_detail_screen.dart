import 'package:flutter/material.dart';
import 'package:flutter_mini_1/model/Transactions.dart';
import 'package:flutter_mini_1/providers/transaction_provider.dart';
import 'package:flutter_mini_1/screen/transaction_detail_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  CategoryDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$category'),
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget) {
          var categoryTransactions = provider.transactions
              .where((transaction) => transaction.type == category)//ตัวแปรที่ดึงประภทมาแสดง
              .toList();

          if (categoryTransactions.isEmpty) {
            return Center(
              child: Text(
                "สิ่นค้าหมดโปรดรอและสั่งรอบใหม่",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: categoryTransactions.length,
              itemBuilder: (context, int index) {
                Transactionss data = categoryTransactions[index];
                return GestureDetector(
                  onTap: () {
                    // เมื่อกดบนการ์ดในรายการ ListView
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TransactionDetailScreen(
                              transaction:
                                  data); // ไปยังหน้า ShowScreen พร้อมส่งข้อมูล transaction
                        },
                      ),
                    );
                  },
                  child: Card(
                    elevation: 25,
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    child: Container(
                      constraints: BoxConstraints(
                        minHeight: 0, // สามารถเปลี่ยนเป็นค่าอื่นได้
                      ),
                      child: ListTile(
                        // ignore: unnecessary_null_comparison
                        leading: data.imageBytes != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    9), // ให้มุมภาพทั้ง 4 มุมมีความโค้ง
                                child: Image.file(
                                  data.imageBytes,
                                  width: 100,
                                  height: 600,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : CircleAvatar(
                                radius: 40,
                                child: FittedBox(
                                  child: Text(data.amount.toString()),
                                ),
                              ),
                        title: Text("เกมส์ : ${data.title}"),
                        subtitle: Text(
                          "ราคา : ${data.amount.toStringAsFixed(2)} .B\n"
                          "แนว : ${data.type}  \n"
                          "ว่างจำหน่าย : ${DateFormat("dd/MM/yyyy").format(data.date)}",
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
