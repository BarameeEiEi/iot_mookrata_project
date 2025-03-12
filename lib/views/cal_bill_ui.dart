import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CalBillUI extends StatefulWidget {
  const CalBillUI({super.key});

  @override
  State<CalBillUI> createState() => _CalBillUIState();
}

class _CalBillUIState extends State<CalBillUI> {
  File? imgFlie;

  bool? isAdult = false;
  bool? isChild = false;

  bool? isWater = false;

  TextEditingController adultCtrl = TextEditingController();
  TextEditingController childCtrl = TextEditingController();
  TextEditingController cokeCtrl = TextEditingController();
  TextEditingController pureCtrl = TextEditingController();

  int groupWater = 1;

  String? membershipType = 'ไม่เป็นสมาชิก';

  Future getCemera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    setState(() {
      imgFlie = File(image.path);
    });
  }

  Future getGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      imgFlie = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            bottom: 50.0,
            left: 40.0,
            right: 40.0,
          ),
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Wrap(
                        children: [
                          ListTile(
                            onTap: () {
                              getCemera()
                                  .then((Value) => {Navigator.pop(context)});
                            },
                            leading: Icon(
                              Icons.camera_alt,
                              color: Colors.deepOrange,
                            ),
                            title: const Text(
                              'เปิดกล้อง',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                          Divider(
                            color: Colors.deepOrange,
                          ),
                          ListTile(
                            onTap: () {
                              getGallery()
                                  .then((Value) => {Navigator.pop(context)});
                            },
                            leading: Icon(
                              Icons.browse_gallery,
                              color: Colors.deepOrange,
                            ),
                            title: const Text(
                              'เปิดเเกลอรี่',
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: imgFlie == null
                      ? Image.asset(
                          'assets/images/camera.jpg',
                          width: 130.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        )
                      : Image.file(
                          imgFlie!,
                          width: 130.0,
                          height: 130.0,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          isAdult = value;
                          if (value == false) {
                            adultCtrl.clear();
                          }
                        });
                      },
                      value: isAdult,
                      activeColor: Colors.deepOrange,
                    ),
                    Text('ผู้ใหญ่ 299 บาท/คน จำนวน '),
                    Expanded(
                      child: TextField(
                        controller: adultCtrl,
                        enabled: isAdult,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text('คน'),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      onChanged: (value) {
                        setState(() {
                          isChild = value;
                          if (value == false) {
                            childCtrl.clear();
                          }
                        });
                      },
                      value: isChild,
                      activeColor: Colors.deepOrange,
                    ),
                    Text('เด็ก 69 บาท/คน จำนวน '),
                    Expanded(
                      child: TextField(
                        controller: childCtrl,
                        enabled: isChild,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text('คน'),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุฟเฟ่ต์นํ้าดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: groupWater,
                      onChanged: (value) {
                        setState(() {
                          groupWater = value!;
                          isWater = false;
                          cokeCtrl.clear();
                          pureCtrl.clear();
                        });
                      },
                      activeColor: Colors.deepOrange,
                    ),
                    Text('รับ 25 บาท/หัว'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: groupWater,
                      onChanged: (value) {
                        setState(() {
                          groupWater = value!;
                          isWater = true;
                        });
                      },
                      activeColor: Colors.deepOrange,
                    ),
                    Text('ไม่รับ'),
                  ],
                ),
                Row(
                  children: [
                    Text('         โค้ก 20 บาท/ขวด จำนวน '),
                    Expanded(
                      child: TextField(
                        controller: cokeCtrl,
                        enabled: isWater,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text('ขวด'),
                  ],
                ),
                Row(
                  children: [
                    Text('         นํ้าเปล่า 15 บาท/ขวด จำนวน '),
                    Expanded(
                      child: TextField(
                        controller: pureCtrl,
                        enabled: isWater,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '0',
                        ),
                      ),
                    ),
                    Text('ขวด'),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: membershipType,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  underline: Container(
                    height: 2,
                    color: Colors.deepOrangeAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      membershipType = newValue!;
                    });
                  },
                  items: <String>[
                    'ไม่เป็นสมาชิก',
                    'สมาชิกทั่วไป ลด 10%',
                    'สมาชิก VIP ลด 20%'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calculate,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวณ',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
