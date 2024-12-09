import 'package:flutter/material.dart';

class DetailbrandPage extends StatefulWidget {
  const DetailbrandPage(
      {super.key, required this.brandName, required this.brandlogo});
  final String brandName;
  final String brandlogo;
  @override
  State<DetailbrandPage> createState() => _DetailbrandPageState();
}

class _DetailbrandPageState extends State<DetailbrandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.brandName.toString()),
      ),
      body: Image.asset(
        widget.brandlogo,
        height: 200,
      ),
    );
  }
}
