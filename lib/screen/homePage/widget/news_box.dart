import 'package:flutter/material.dart';

class NewsBox extends StatefulWidget {
  const NewsBox(
      {Key? key,
      required this.title,
      required this.source,
      this.publishAt,
      this.urlImage,
      this.content})
      : super(key: key);

  final String? title, source, publishAt, urlImage, content;

  @override
  State<NewsBox> createState() => _NewsBoxState();
}

class _NewsBoxState extends State<NewsBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      // color: const Color(0xffF4F4F4),
      child: Column(
        children: [
          SizedBox(
              width: double.infinity,
              child: widget.urlImage == null
                  ? Image.asset("assets/img/gambar.png")
                  : Image.network(
                      widget.urlImage.toString(),
                      scale: 1.15,
                    )),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  widget.title.toString(),
                  style: const TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 65, 64, 64)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Sumber : ${widget.source}",
                  style: const TextStyle(color: Color(0xffB7B7B7)),
                ),
                Text(
                  widget.publishAt == null
                      ? "tidak ada data"
                      : widget.publishAt.toString(),
                  style: const TextStyle(color: Color(0xffB7B7B7)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.content == null
                      ? "Tidak ada data"
                      : widget.content.toString(),
                  maxLines: 5,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Baca selengkapnya..",
                  style: TextStyle(color: Color(0xff0093dd)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
