import 'package:flutter/material.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: textPoppins('Third Screen', 18, darkColor, FontWeight.w600),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: Colors.black,
            height: 0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: blueColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
