import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/provider/provider_manager.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/widgets/button_primary.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/widgets/input_text_field.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final palindromeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    var height = mediaQueryData.size.height;
    var width = mediaQueryData.size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.3,
                  child: const CircleAvatar(
                    radius: 58,
                    backgroundColor: Colors.white54,
                    child: Icon(
                      Icons.person_add_alt_rounded,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InputTextField(
                          controller: nameController,
                          hintText: 'Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Enter your name please!");
                            }
                            return null;
                          },
                        ),
                        InputTextField(
                          controller: palindromeController,
                          hintText: 'Palindrome',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return ("Enter something please!");
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ButtonPrimary(
                        label: 'CHECK',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        width: width,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            Provider.of<ProviderManager>(context, listen: false)
                                .checkPalindrome(
                              nameController.text,
                              palindromeController.text,
                              context,
                            );
                          }
                        },
                      ),
                      ButtonPrimary(
                        label: 'NEXT',
                        size: 16,
                        fontWeight: FontWeight.w500,
                        width: width,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Provider.of<ProviderManager>(context, listen: false)
                                .setUserName(nameController.text, context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
