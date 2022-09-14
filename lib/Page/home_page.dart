import 'package:flutter/material.dart';
import 'package:little_dinosaur/data/data_dino.dart';
import 'package:little_dinosaur/model/item_list.dart';
import 'package:scroll_to_top/scroll_to_top.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key, required this.userame}) : super(key: key);

  String userame;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 249, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 68, 148, 197),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Text(
                "Halo $userame,\nMau belajar apa hari ini?",
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'Mali',
                    fontWeight: FontWeight.w800,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: ScrollToTop(
                scrollController: scrollController,
                scrollOffset: 200,
                btnColor: Colors.white,
                txtColor: const Color.fromARGB(255, 64, 73, 105),
                child: ListView.builder(
                  controller: scrollController,
                  itemExtent: 100,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  itemCount: dinoDataList.length,
                  itemBuilder: ((context, index) {
                    return ItemList(dinoData: dinoDataList[index]);
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
