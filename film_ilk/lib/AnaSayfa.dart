import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final urlImages = [
    'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/02c86638fd904a4bd54a7a26a63a8816d3663be8a05b1e31268216aa4ee0deb7._RI_V_TTW_.jpg',
    'https://m.media-amazon.com/images/M/MV5BM2QwMTdlYWYtOTQ4ZC00ZTVjLTkyZTMtYjUzYmE5N2FkZTFhXkEyXkFqcGdeQXVyMTA4NjE0NjEy._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BZjQ0NDgzNmQtZWM5MC00YTFiLWJlMDItZTg5NmU1N2ZkY2FjXkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BNDQwNzE0ZTItYmZjMC00NjI3LWFlNzctNTExZDY2NWE0Zjc0XkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDFlZWJmMjMtMmE0ZC00ZGY3LTg4ZTYtNWRjNDYzZjY0MjA1XkEyXkFqcGdeQXVyMTA3MDk2NDg2._V1_.jpg',
    'https://m.media-amazon.com/images/M/MV5BOTdmNTFjNDEtNzg0My00ZjkxLTg1ZDAtZTdkMDc2ZmFiNWQ1XkEyXkFqcGdeQXVyNTAzNzgwNTg@._V1_FMjpg_UX1000_.jpg',
    'https://m.media-amazon.com/images/M/MV5BMDQwOWQ0OGItNjJjYi00YzVjLTk4NmUtYzQ0NzUwZGY3NDZjXkEyXkFqcGdeQXVyMjUzOTY1NTc@._V1_FMjpg_UX1000_.jpg'
  ];

  bool aramaAktif = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.person,
                    size: 100,
                  ),
                  const Text("KullanıcıAdı"),
                ],
              ),
            ),
            ListTile(
              title: const Text('Favoriler'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Daha Sonra İzle '),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Top 100 '),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Ayarlar '),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: aramaAktif
            ? TextField(
                decoration: const InputDecoration(
                    hintText: "Aramak için bir şey yazın"),
                onChanged: (aramaSonucu) {
                  print("Arama sonucu : $aramaSonucu");
                },
              )
            : const Text(
                "LOGO",
                style: TextStyle(fontSize: 30),
              ),
        actions: [
          aramaAktif
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      aramaAktif = false;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      aramaAktif = true;
                    });
                  },
                ),
          Row(
            children: [
              IconButton(
                iconSize: 30,
                onPressed: () {},
                icon: const Icon(Icons.align_horizontal_left),
              ),
              const Text("Filtrele"),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  viewportFraction: 0.15,
                  autoPlayInterval: const Duration(seconds: 1),
                  height: Get.height * 0.3,
                  autoPlay: true,
                ),
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  return buildImage(urlImage, index);
                },
              ),
            ),
            SizedBox(
              height: Get.width * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.movie,
                        color: Colors.blueGrey,
                        size: Get.width * 0.025,
                      ),
                      Text(
                        " Yeni Filmler",
                        style: TextStyle(fontSize: Get.width * 0.015),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.blueGrey,
                        size: Get.width * 0.025,
                      )
                    ],
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      aspectRatio: 3.2 / 1,
                      viewportFraction: 0.2,
                      autoPlayInterval: const Duration(seconds: 1),
                    ),
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return SizedBox(
                          height: Get.height * 0.6,
                          width: Get.height * 0.3,
                          child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: Get.height * 0.35,
                                        child: Image.network(urlImages[index])),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      const Text("9.0"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Memento",
                                        style: TextStyle(
                                            fontSize: Get.width * 0.012)),
                                  ),
                                  SizedBox(
                                    width: Get.height * 0.3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: (() {}),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Beğen",
                                              style: TextStyle(
                                                  fontSize: Get.width * 0.012)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )));
                    },
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.movie,
                        color: Colors.blueGrey,
                        size: Get.width * 0.025,
                      ),
                      Text(
                        " Favoriler ",
                        style: TextStyle(fontSize: Get.width * 0.015),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.blueGrey,
                        size: Get.width * 0.025,
                      )
                    ],
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      aspectRatio: 3.2 / 1,
                      viewportFraction: 0.2,
                      autoPlayInterval: const Duration(seconds: 1),
                    ),
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return SizedBox(
                          height: Get.height * 0.6,
                          width: Get.height * 0.3,
                          child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                        height: Get.height * 0.35,
                                        child: Image.network(urlImages[index])),
                                  ),
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      const Text("9.0"),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Memento",
                                        style: TextStyle(
                                            fontSize: Get.width * 0.012)),
                                  ),
                                  SizedBox(
                                    width: Get.height * 0.3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: (() {}),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Beğen",
                                              style: TextStyle(
                                                  fontSize: Get.width * 0.012)),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImages, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        color: Colors.black,
        child: Image.network(
          urlImages,
          fit: BoxFit.fitWidth,
        ),
      );
}
