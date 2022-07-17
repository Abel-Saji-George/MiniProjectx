import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_x/Screens/homeScreen.dart';
import 'package:mini_project_x/Widgets/bottomSheet.dart';
import 'package:mini_project_x/main.dart';
import 'package:get/get.dart';
// !the package for tensorflow
// import 'package:tflite/tflite.dart';

List words = [
  {'id': 0, 'word': ''},
  {'id': 1, 'word': 'Hello'},
  {'id': 2, 'word': 'this'},
  {'id': 3, 'word': 'is'},
  {'id': 4, 'word': 'just'},
  {'id': 5, 'word': 'a'},
  {'id': 6, 'word': 'test'},
  {'id': 7, 'word': 'case'},
  {'id': 8, 'word': 'dont'},
  {'id': 9, 'word': 'mind'},
  {'id': 10, 'word': 'me'},
  {'id': 11, 'word': 'just'},
  {'id': 12, 'word': 'popin'},
  {'id': 13, 'word': 'hastala'},
  {'id': 14, 'word': 'vista'},
  {'id': 15, 'word': 'heiley'},
];

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  CameraImage? cameraImage;
  CameraController? cameraController;
  // !dont forget to initialize as empty string later on
  String output = 'Hello';
  @override
  void initState() {
    super.initState();
    loadCamera();
    loadModel();
  }

  loadCamera() {
    cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    cameraController!.initialize().then((value) {
      if (!mounted) {
        return;
      } else {
        setState(() {
          cameraController!.startImageStream((imageStream) {
            cameraImage = imageStream;
            runModel();
          });
        });
      }
    });
  }

// ! The codes that contains the functions for loading the model,running the model,present as comments here since the TFlite is deprecated i'd have to look into it later on
  runModel() async {
    //   if (cameraImage != null) {
    //     var predictions = await Tflite.runModelOnFrame(
    //         bytesList: cameraImage!.planes.map((plane) {
    //           return plane.bytes;
    //         }).toList(),
    //         imageHeight: cameraImage!.height,
    //         imageWidth: cameraImage!.width,
    //         imageMean: 127.5,
    //         imageStd: 127.5,
    //         rotation: 90,
    //         numResults: 2,
    //         threshold: 0.1,
    //         asynch: true);
    //     predictions!.forEach((element) {
    //       setState(() {
    //         output = element['label'];
    //       });
    //     });
    // }
  }
  loadModel() async {
    // await TFlite.loadModel(
    //   model:"materials/model.tflite",labels:"assets/labels.txt"
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffD56969)),
                            child: Center(
                              child: Icon(
                                Icons.home_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
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
                      height: 500,

                      width: 300,
                      // height: MediaQuery.of(context).size.height * 0.7,
                      // width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(40),
                      //! For testing not needed irl
                      // color: Colors.green,
                      // ),
                      child: !cameraController!.value.isInitialized
                          ? Container()
                          : ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(40),
                                  bottom: Radius.circular(40)),
                              child: AspectRatio(
                                aspectRatio:
                                    cameraController!.value.aspectRatio,
                                child: CameraPreview(
                                  cameraController!,
                                ),
                              ),
                            ),
                    ),
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontFamily: 'JotiOne',
                      fontSize: 64,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        BottomSheetWidgetx()
      ],
    );
  }
}
