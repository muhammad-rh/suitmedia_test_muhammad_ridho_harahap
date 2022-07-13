import 'package:flutter/material.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';

class DataListCard extends StatelessWidget {
  final String url;
  final String firstName;
  final String lastName;
  final String email;
  const DataListCard({
    Key? key,
    required this.url,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipOval(
        child: SizedBox.fromSize(
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: textPoppins(
        '$firstName $lastName',
        16,
        darkColor,
        FontWeight.w600,
      ),
      subtitle: textPoppins(
        email,
        10,
        darkSecondColor,
        FontWeight.w600,
      ),
    );
  }
}
