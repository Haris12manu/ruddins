import 'package:flutter/material.dart';

class FormData {
  String name = '';
  String phoneNumber = '';
  String email = '';
  String position = '';
  String gender = '';
}

class ProScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<ProScreen> {
  final _formKey = GlobalKey<FormState>();
  FormData formData = FormData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('กรอกข้อมูล'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'ชื่อ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกชื่อ';
                  }
                  return null;
                },
                onSaved: (value) {
                  formData.name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'เบอร์โทร'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกเบอร์โทร';
                  }
                  return null;
                },
                onSaved: (value) {
                  formData.phoneNumber = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'อีเมล์'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกอีเมล์';
                  }
                  return null;
                },
                onSaved: (value) {
                  formData.email = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'ตำแหน่ง'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกตำแหน่ง';
                  }
                  return null;
                },
                onSaved: (value) {
                  formData.position = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'เพศ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกเพศ';
                  }
                  return null;
                },
                onSaved: (value) {
                  formData.gender = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // สามารถใช้ formData ที่มีข้อมูลทั้งหมดได้ที่นี่
                    print(formData.name);
                    print(formData.phoneNumber);
                    print(formData.email);
                    print(formData.position);
                    print(formData.gender);
                  }
                },
                child: Text('บันทึก'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
