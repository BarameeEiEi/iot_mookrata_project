import 'dart:io';

import 'package:flutter/material.dart';

class ShowBillUI extends StatefulWidget {
  int? numAdult;
  int? numChild;
  int? numCoke;
  int? numPure;
  double? payBuffetTotal;
  double? payWaterBuffet;
  double? paySale;
  double? payBuffetTotalNoSale;
  File? imageFile;

  ShowBillUI({
    super.key,
    this.numAdult,
    this.numChild,
    this.numCoke,
    this.numPure,
    this.payBuffetTotal,
    this.payWaterBuffet,
    this.paySale,
    this.payBuffetTotalNoSale,
    File? imageFile,
  });

  @override
  State<ShowBillUI> createState() => _ShowBillUIState();
}

class _ShowBillUIState extends State<ShowBillUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('ใบเสร็จรับเงิน',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            widget.imageFile == null
                ? Image.asset(
                    'assets/images/camera.jpg',
                    width: 150,
                    height: 150,
                  )
                : Image.file(
                    widget.imageFile!,
                    width: 200,
                    height: 200,
                  ),
            SizedBox(
              height: 20,
            ),
            Text('รายละเอียดใบเสร็จรับเงิน',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 20,
            ),
            Text('จํานวนผู้ใหญ่: ${widget.numAdult} คน'),
            SizedBox(
              height: 20,
            ),
            Text('จํานวนผู้เด็ก: ${widget.numChild} คน'),
            SizedBox(
              height: 20,
            ),
            Text('จํานวนโค้ก: ${widget.numCoke} ขวด'),
            SizedBox(
              height: 20,
            ),
            Text('จํานวนน้ำเปล่า: ${widget.numPure} ขวด'),
            SizedBox(
              height: 20,
            ),
            Text('ราคาบุฟเฟ่ต์นํ้า: ${widget.payWaterBuffet} บาท'),
            SizedBox(
              height: 20,
            ),
            Text('ส่วนลดเป็นเงิน: ${widget.paySale} บาท'),
            SizedBox(
              height: 20,
            ),
            Text('ราคาบุฟเฟ่ต์ทั้งหมด: ${widget.payBuffetTotal} บาท',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/payqr.png',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
