import 'package:flutter/material.dart';
import 'package:mini_project_x/Screens/TranslationCamera.dart';

class BottomSheetWidgetx extends StatefulWidget {
  const BottomSheetWidgetx({Key? key}) : super(key: key);

  @override
  State<BottomSheetWidgetx> createState() => _BottomSheetWidgetxState();
}

class _BottomSheetWidgetxState extends State<BottomSheetWidgetx> {
  int selectedWordId = 1;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.08,
        minChildSize: 0.08,
        snapSizes: const [0.08, 1],
        snap: true,
        builder: (BuildContext context, ScrollController scrollController) {
          return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(58)),
            child: Container(
              color: const Color.fromARGB(255, 70, 70, 70),
              child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                controller: scrollController,
                itemCount: words.length,
                itemBuilder: (BuildContext context, int index) {
                  final name = words[index];
                  if (index == 0) {
                    return Column(children: const [
                      SizedBox(
                        width: 50,
                        child: Divider(
                          thickness: 2,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Transcript",
                        style: TextStyle(
                            color: Color(0xffAF7272),
                            fontSize: 24,
                            fontFamily: 'JockeyOne'),
                      )
                    ]);
                  }
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      tileColor: const Color.fromARGB(255, 70, 70, 70),
                      selected: selectedWordId == name['id'],
                      selectedTileColor: const Color.fromARGB(255, 129, 126, 126),
                      selectedColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10),
                      onTap: () {
                        setState(() {
                          selectedWordId = name['id'];
                        });
                      },
                      title: Center(child: Text(name['word'])),
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
