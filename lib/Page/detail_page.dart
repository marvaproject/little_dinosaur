import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:little_dinosaur/data/data_dino.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final DinoData dinoData;
  const DetailPage({super.key, required this.dinoData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 249, 255),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(16),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 4, bottom: 8),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 237, 249, 255),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  dinoData.name,
                  style: const TextStyle(
                      fontFamily: "Mali",
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 64, 73, 105),
            expandedHeight: 230,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                dinoData.dinoImage,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 100,
                              child: const Text(
                                'Tinggi',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 14,
                              child: const Text(
                                ':',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  dinoData.height,
                                  style: const TextStyle(
                                      fontFamily: 'Mali',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 100,
                              child: const Text(
                                'Panjang',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 14,
                              child: const Text(
                                ':',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  dinoData.length,
                                  style: const TextStyle(
                                      fontFamily: 'Mali',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 100,
                              child: const Text(
                                'Berat',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 14,
                              child: const Text(
                                ':',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  dinoData.weight,
                                  style: const TextStyle(
                                      fontFamily: 'Mali',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: 100,
                              child: const Text(
                                'Makanan',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topCenter,
                              width: 14,
                              child: const Text(
                                ':',
                                style: TextStyle(
                                    fontFamily: 'Mali',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  dinoData.food,
                                  style: const TextStyle(
                                      fontFamily: 'Mali',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    dinoData.description,
                    style: const TextStyle(
                      fontFamily: "Mali",
                      fontSize: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          var url = dinoData.url;
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.only(left: 1, right: 16),
                          height: 38,
                          width: 210,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 64, 73, 105),
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: const Color.fromARGB(255, 64, 73, 105).withOpacity(0.3),
                                  blurRadius: 4,
                                  spreadRadius: 1)
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Icon(
                                Icons.play_circle_fill_rounded,
                                color: Colors.white,
                                size: 36,
                              ),
                              Text(
                                "Tonton Videonya",
                                style: TextStyle(
                                    fontFamily: "Mali",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 237, 249, 255),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 183, 199, 207),
                                offset: Offset(2, 2),
                                blurRadius: 4,
                                spreadRadius: 1),
                            BoxShadow(
                                color: Color.fromARGB(255, 255, 255, 255),
                                offset: Offset(-2, -2),
                                blurRadius: 4,
                                spreadRadius: 1)
                          ],
                        ),
                        child: FavoriteButton(
                          isFavorite: false,
                          iconSize: 36,
                          iconColor: const Color.fromARGB(255, 64, 73, 105),
                          iconDisabledColor: Color.fromARGB(255, 187, 187, 187),
                          valueChanged: (_isFavorite) {
                            print('Is Favorite $_isFavorite)');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
