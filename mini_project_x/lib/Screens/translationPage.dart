import 'package:flutter/material.dart';
import 'package:mini_project_x/Screens/homeScreen.dart';
import 'package:get/get.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('materials/background.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, top: 30),
                    child: GestureDetector(
                      child: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      onTap: () {
                        // Get.to(() => HomeScreen());
                        Get.off(HomeScreen());
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 55.0, bottom: 4),
                child: Container(
                  height: 454,
                  width: 278,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.green,
                  ),
                ),
              ),
              const Text(
                "Hello",
                style: TextStyle(
                  fontFamily: 'JotiOne',
                  fontSize: 64,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
