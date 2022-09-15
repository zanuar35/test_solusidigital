import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_solusidigital/blocs/getData/cubit/get_data_cubit.dart';
import 'package:test_solusidigital/screen/homePage/widget/container_antrian.dart';
import 'package:test_solusidigital/screen/homePage/widget/news_box.dart';

List<String> gambar = [
  "assets/img/promothumb-1565.png",
  "assets/img/promothumb-1565.png",
  "assets/img/promothumb-1565.png",
  "assets/img/promothumb-1565.png",
  "assets/img/promothumb-1565.png",
  "assets/img/promothumb-1565.png",
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetDataCubit>(context).getData();
  }

  final List<Widget> imageSliders = gambar
      .map((item) => Container(
            margin: const EdgeInsets.all(5.0),
            child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.fill, width: 1000.0),
              ],
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 150,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Image.asset(
            "assets/img/MEDIPLUS_Logo.png",
            scale: 1,
          ),
        ),
        actions: [
          const Center(
            child: Text(
              "Hi, Bagus",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xff5a5a5a)),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            backgroundColor: const Color(0xff5A5A5A),
            radius: 17,
            child: Center(
              child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.person,
                  ),
                  onPressed: () {
                    BlocProvider.of<GetDataCubit>(context).getData();
                  }),
            ),
          ),
          const SizedBox(
            width: 18,
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 20),
              height: 60,
              child: const TextField(
                decoration: InputDecoration(
                  fillColor: Color(0xfff4f4f4),
                  contentPadding: EdgeInsets.only(left: 12, top: 2, bottom: 2),
                  hintText: "Cari Klinik / Rumah Sakit",
                  hintStyle: TextStyle(color: Color(0xffb7b7b7), fontSize: 14),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.elliptical(20, 20)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    const ContainerAntrian(),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconButton("Klinik Terdekat", const Color(0xff0093DD),
                            Icons.settings),
                        iconButton(
                            "Riwayat", const Color(0xff0093DD), Icons.settings),
                        iconButton("Data Scan", const Color(0xff8445A2),
                            Icons.settings),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          iconButton("Notifikasi", const Color(0xff0093DD),
                              Icons.notifications),
                          iconButton("Beri Nilai", const Color(0xff8445A2),
                              Icons.star),
                          iconButton("Pengaturan", const Color(0xffDD127B),
                              Icons.settings),
                        ],
                      ),
                    ),
                    Expanded(
                      child: CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            aspectRatio: 16 / 5,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: gambar.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: _current == entry.key ? 22 : 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : const Color(0xff0093DD))
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                    BlocBuilder<GetDataCubit, GetDataState>(
                        builder: (context, state) {
                      if (state is GetDataLoading) {
                        return Column(
                          children: [
                            shimmer(),
                            const SizedBox(height: 15),
                            shimmer()
                          ],
                        );
                      }
                      if (state is GetDataSuccess) {
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return NewsBox(
                                  title: state.articles?[index].title,
                                  source: state.articles?[index].source?.name,
                                  publishAt: state.articles?[index].publishedAt,
                                  urlImage: state.articles?[index].urlToImage,
                                  content: state.articles?[index].content,
                                );
                              }),
                        );
                      }
                      return const SizedBox();
                    })
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget shimmer() {
    return SizedBox(
      width: double.infinity,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.black45,
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          )),
    );
  }

  Widget iconButton(String title, Color warna, IconData icons) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: warna,
          ),
          child: Icon(icons, color: Colors.white),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(title)
      ],
    );
  }
}
