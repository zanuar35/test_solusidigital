import 'package:flutter/material.dart';

class ContainerAntrian extends StatefulWidget {
  const ContainerAntrian({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerAntrian> createState() => _ContainerAntrianState();
}

class _ContainerAntrianState extends State<ContainerAntrian> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [Color(0xffCA1D84), Color(0xff1288D5)],
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Text(
            "Info Antrian",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: .4,
                color: Colors.white),
          ),
          const Divider(
            height: 9,
            thickness: 2,
            color: Colors.white,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xffFFF9AA), width: 3)),
                    child: const Center(
                      child: Text(
                        "21",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Nomor Antrian",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xffFFF9AA), width: 3)),
                    child: const Center(
                      child: Text(
                        "5",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Sisa antrian",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Dokter Anda",
                    style: TextStyle(color: Color(0xffFFF9AA)),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "dr. Rina Agustina",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Klinik / RS anda",
                    style: TextStyle(color: Color(0xffFFF9AA)),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "RS. National Hospital",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
