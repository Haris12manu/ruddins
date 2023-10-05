// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_mini_1/model/Transactions.dart';
import 'package:flutter_mini_1/screen/transaction_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/transaction_provider.dart';

class CategorySelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ALL GAMER",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Consumer(builder: (context, TransactionProvider provider, Widget) {
        var count = provider.transactions.length;
        if (count <= 0) {
          return Center(
            child: Text(
              "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: provider.transactions.length,
              itemBuilder: (BuildContext context, int index) {
                Transactionss data = provider.transactions[index];

                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TransactionDetailScreen(transaction: data);
                          },
                        ),
                      );
                    },
                    child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                height: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      10), // กำหนดมุมโค้งที่นี่
                                  child: data.imageBytes != null
                                      ? Image.file(
                                          data.imageBytes,
                                          fit: BoxFit.cover,
                                        )
                                      : Placeholder(
                                          color: Colors.grey.shade300,
                                        ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "เกมส์ | " + data.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                      Text(
                                        "ประเภท | " + data.type,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                      Text(
                                        "ราคา | " +
                                            data.amount.toStringAsFixed(2) +
                                            " บาท ",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0,
                                        ),
                                      ),
                                    ],
                                  ))
                            ])));
              });
        }
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // ไปยังหน้าหลัก
            Navigator.pop(context);
          },
          child: Text('กลับหน้าหลัก'),
        ),
      ),
    );
  }
}
