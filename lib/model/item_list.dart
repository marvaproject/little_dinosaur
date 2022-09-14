import 'package:flutter/material.dart';
import 'package:little_dinosaur/Page/detail_page.dart';
import 'package:little_dinosaur/data/data_dino.dart';

class ItemList extends StatelessWidget {
  final DinoData dinoData;

  const ItemList({super.key, required this.dinoData});

  get name => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      height: 150,
      child: GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                dinoData: dinoData,
              ),
            ),
          );
        }),
        child: Container(
          padding: const EdgeInsets.only(left: 0.8, right: 4),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: const Color.fromARGB(255, 64, 73, 105),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Image(
                    image: AssetImage(dinoData.dinoIcon),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  margin: const EdgeInsets.only(
                      bottom: 4, right: 4, left: 4, top: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          dinoData.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontFamily: 'Mali',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          dinoData.description,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: const TextStyle(
                              fontFamily: 'Mali',
                              fontWeight: FontWeight.w200,
                              fontSize: 9,
                              color: Colors.white),
                        ),
                      )
                    ],
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
