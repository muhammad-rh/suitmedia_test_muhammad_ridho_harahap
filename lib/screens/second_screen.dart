import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/provider/provider_manager.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/widgets/button_primary.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/widgets/data_list_card.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    var manager = Provider.of<ProviderManager>(context, listen: false);

    var mediaQueryData = MediaQuery.of(context);
    var width = mediaQueryData.size.width;

    return Scaffold(
      appBar: AppBar(
        title: textPoppins('Second Screen', 18, darkColor, FontWeight.w600),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            color: secondaryColor,
            height: 0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: blueColor,
          onPressed: () {
            Navigator.pushNamed(context, '/firstScreen');
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: ListTile(
                    title:
                        textPoppins('Welcome', 12, darkColor, FontWeight.w400),
                    subtitle: textPoppins(
                        manager.userName, 18, darkColor, FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Align(
                    alignment: Alignment.center,
                    child: manager.selectedData == null
                        ? textPoppins('Selected User Name', 24, darkColor,
                            FontWeight.w600)
                        : DataListCard(
                            url: manager.selectedData!.avatar!,
                            firstName: manager.selectedData!.firstName!,
                            lastName: manager.selectedData!.lastName!,
                            email: manager.selectedData!.email!,
                          ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 32, left: 30, right: 30),
                  child: ButtonPrimary(
                    label: 'Choose a User',
                    size: 14,
                    fontWeight: FontWeight.w500,
                    width: width,
                    onPressed: () {
                      Navigator.pushNamed(context, '/thirdScreen');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
