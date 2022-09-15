import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage(
      {super.key,
      required this.title,
      required this.content,
      required this.source,
      required this.publishedAt,
      required this.urlImage});

  final String? title, content, source, publishedAt, urlImage;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.chevron_left)),
          title: const Text("Berita"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Column(
            children: [
              Image.network(widget.urlImage!),
              const SizedBox(
                height: 14,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title!,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xff5a5a5a)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sumber : ${widget.source}",
                      style: const TextStyle(color: Color(0xffB7B7B7)),
                    ),
                    Text(
                      widget.publishedAt == null
                          ? "tidak ada data"
                          : widget.publishedAt!,
                      style: const TextStyle(color: Color(0xffB7B7B7)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.content == null
                          ? "Tidak ada data"
                          : widget.content!,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
