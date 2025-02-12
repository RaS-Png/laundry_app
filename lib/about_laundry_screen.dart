import 'package:flutter/material.dart';

class AboutLaundryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Laundry'),
      ),
      body: Center(
        child: Text('Ini adalah Halaman Tentang Laundry'),
      ),
    );
  }
}