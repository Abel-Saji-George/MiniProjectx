import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project_x/Screens/TranslationCamera.dart';
import 'package:mini_project_x/Widgets/bottomSheet.dart';
import 'translationPage.dart';
import 'package:bouncing_widget/bouncing_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("materials/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 130.0, bottom: 60),
                child: Text(
                  "SIGENE",
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Color(0xffFFEEEE),
                      fontSize: 64,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                height: 180,
                width: 180,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('materials/symbol.png'),
                  ),
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 180.0),
                child: BouncingWidget(
                  duration: Duration(milliseconds: 300),
                  scaleFactor: 2,
                  onPressed: () {
                    // Get.to(() => TranslateScreen());
                    // !commented for test purposes
                    // Get.off(TranslateScreen());
                    Get.off(Translate());
                    // Get.off(BottomSheetWidgetx());
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: const Color(0xffD56969),
                    ),
                    child: const Center(
                      child: Text(
                        "TRANSLATE",
                        style: TextStyle(
                            fontFamily: 'JotiOne',
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
