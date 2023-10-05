import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mini_1/model/Transactions.dart';
import 'package:flutter_mini_1/providers/transaction_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final titleController = TextEditingController();
  String selectedType = 'แนว'; // ตั้งค่าเริ่มต้น
  String selectedGender = '';
  final amountController = TextEditingController();
  final ctitleController = TextEditingController();
  final textEditingController = TextEditingController();
  // Uint8List? imageBytes; // เปลี่ยนเป็น Uint8List
  DateTime selectedDate = DateTime.now(); // ตั้งค่าเริ่มต้นของวันที่

  File? _imageFile; // เพิ่มตัวแปร _imageFile
  final ImagePicker _imagePicker = ImagePicker(); // เพิ่มตัวแปร _imagePicker

  // คำสั่งยืนยันรูปภาพและเปลี่ยนสถานะตัวแปร _imageFile
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _clearImage() {
    setState(() {
      _imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> types = ['แนว', 'SPORT', 'FIGHT', 'SHOOTING', 'ADVENTURE'];

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 48, 51, 51),
        appBar: AppBar(
          title: Center(child: Text("แบบฟอร์มบันทึกข้อมูล")),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black), // กำหนดสีเส้นขอบเป็นสีดำ
                    borderRadius: BorderRadius.circular(10.0), // กำหนดมุมโค้ง
                  ),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: "เกมส์",
                      labelStyle: TextStyle(
                          color: Colors.white), // กำหนดสีของ Label เป็นสีดำ
                    ),
                    autofocus: true,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black), // กำหนดสีเส้นขอบเป็นสีดำ
                    borderRadius: BorderRadius.circular(10.0), // กำหนดมุมโค้ง
                  ),
                  child: TextFormField(
                    controller: ctitleController,
                    decoration: InputDecoration(
                      labelText: "รองรับรุ่น",
                      labelStyle: TextStyle(
                          color: Colors.white), // กำหนดสีของ Label เป็นสีดำ
                    ),
                    autofocus: true,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(width: 16.0), // ระยะห่าง

                            InkWell(
                              onTap: () {
                                _pickImage(); // เมื่อคลิกที่ภาพเพื่อเลือกรูป
                              },
                              child: Stack(
                                children: [
                                  _imageFile != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              5), // เพิ่มขอบโค้งของรูปภาพ
                                          child: Image.file(
                                            _imageFile!,
                                            width: 207,
                                            height: null,
                                            fit: BoxFit
                                                .cover, // ปรับขนาดรูปภาพให้พอดีกับ Container
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              5), // เพิ่มขอบโค้งของ Container
                                          child: Container(
                                            width: 207,
                                            height: 207,
                                            color: Color.fromARGB(
                                                255, 53, 51, 194),
                                            child: Center(
                                              child: Icon(
                                                Icons.add_photo_alternate,
                                                color: Color.fromARGB(
                                                    255, 13, 208, 208),
                                                size: 50,
                                              ),
                                            ),
                                          ),
                                        ),
                                  if (_imageFile != null)
                                    Positioned(
                                      top: 1, // ระยะขอบบนของรูปภาพ
                                      right: 1, // ระยะขอบซ้ายของรูปภาพ
                                      child: InkWell(
                                        onTap: _clearImage,
                                        child: Container(
                                          padding: EdgeInsets.all(3),
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(width: 16.0), // ระยะห่าง
                            ElevatedButton.icon(
                              onPressed: () async {
                                final DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101),
                                );
                                if (picked != null && picked != selectedDate) {
                                  setState(() {
                                    selectedDate = picked;
                                  });
                                }
                              },
                              icon: Icon(Icons.calendar_today),
                              label: Text(
                                "เลือกวันที่: ${DateTime.now().toLocal().toString().split(' ')[0]}",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: DropdownButton<String>(
                      value: selectedType,
                      onChanged: (value) {
                        setState(() {
                          selectedType = value!;
                        });
                      },
                      items: types.map((type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child: Text(type),
                        );
                      }).toList(),
                      style: TextStyle(color: Colors.white),
                      icon: Icon(Icons.arrow_downward, color: Colors.white),
                      dropdownColor: Colors.blue,
                      elevation: 10,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: textEditingController,
                    maxLines: 2, // กำหนดให้ Text Area สามารถขยายความสูงได้
                    decoration: InputDecoration(
                      labelText: "รายละเอียดเกมส์",
                      border: OutlineInputBorder(), // กรอบของ Text Area
                    ),
                  ),
                ),
                TextFormField(
                  controller: amountController,
                  decoration: new InputDecoration(labelText: "ราคา"),
                  keyboardType: TextInputType.number,
                ),
                Center(
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      var title = titleController.text;
                      var amount = amountController.text;
                      var textEditing = textEditingController.text;

                      // ตรวจสอบค่าที่ถูกเลือกใน Dropdown
                      if (selectedType == 'วันที่') {
                        // ในกรณีที่ไม่มีค่าที่ถูกเลือกใน Dropdown
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("ค่าประเภทไม่ถูกเลือก"),
                              content: Text("โปรดเลือกประเภทก่อนบันทึก"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("ปิด"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // ในกรณีที่ค่าถูกเลือกใน Dropdown และค่าเริ่มต้นไม่ว่างเปล่า
                        Transactionss statement = Transactionss(
                          title: title,
                          type: selectedType,
                          amount: double.parse(amount),
                          textEditing: textEditing,
                          date: selectedDate,
                          imageBytes: _imageFile,
                        );

                        // Get the provider and add the transaction
                        var provider = Provider.of<TransactionProvider>(context,
                            listen: false);
                        provider.addTransaction(statement);

                        Navigator.pop(context);
                      }
                    },
                    child: Text('เพิ่มข้อมูล'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
