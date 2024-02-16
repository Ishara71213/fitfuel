import 'package:flutter/material.dart';
import 'package:flutter/qr_flutter.dart';

class UserData {
  final String name;
  final String email;
  final String phoneNumber;

  UserData({required this.name, required this.email, required this.phoneNumber});
}

class QRGenerator extends StatefulWidget {
  final UserData userData;

  QRGenerator({required this.userData});

  @override
  _QRGeneratorState createState() => _QRGeneratorState();
}

class _QRGeneratorState extends State<QRGenerator> {
  @override
  Widget build(BuildContext context) {
    String data = "${widget.userData.name}\n${widget.userData.email}\n${widget.userData.phoneNumber}";

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: data,
              version: QrVersions.auto,
              size: 200.0,
            ),
            SizedBox(height: 20),
            Text(
              'Scan this QR Code to register',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserData user = UserData(
      name: 'John Doe',
      email: 'john@example.com',
      phoneNumber: '+1234567890',
    );

    return MaterialApp(
      title: 'QR Code Generator Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QRGenerator(userData: user),
    );
  }
}
