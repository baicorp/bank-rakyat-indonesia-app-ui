import 'package:bri/dummyData/list_data_aktifitas.dart';
import 'package:bri/style/font_style.dart';
import 'package:flutter/material.dart';

class AktifitasMenu extends StatefulWidget {
  const AktifitasMenu({Key? key}) : super(key: key);

  @override
  State<AktifitasMenu> createState() => _AktifitasMenuState();
}

class _AktifitasMenuState extends State<AktifitasMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Aktivitas',
            style: appBarButton,
          ),
          centerTitle: true,
          actions: const [Icon(Icons.menu), SizedBox(width: 10.0)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView.builder(
            itemCount: deskripsi.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(5.0, 11, 0, 5.0),
                //const EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/icons/briva-icon-colored.png',
                        width: 30.0,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      flex: 6,
                      child: Description(
                        title: deskripsi[index].title,
                        companyName: deskripsi[index].companyName,
                        companyNum: deskripsi[index].companyNum,
                        refNum: deskripsi[index].refNum,
                        date: deskripsi[index].date,
                        time: deskripsi[index].time,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFF09b970),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Center(
                          child: Text('Sukses', style: textPutih),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Description extends StatefulWidget {
  Description(
      {Key? key,
      required this.title,
      required this.companyName,
      required this.companyNum,
      required this.refNum,
      required this.date,
      required this.time})
      : super(key: key);

  final String title, companyName, companyNum, refNum, date, time;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: title),
            const SizedBox(height: 3.0),
            Text(widget.companyName, style: subtitle),
            Text(widget.companyNum, style: subtitle),
            Text(widget.refNum, style: subtitle),
          ],
        ),
        const SizedBox(height: 5.0),
        Row(
          children: [
            Text(widget.date, style: subtitle),
            const SizedBox(width: 3.0),
            Text(widget.time, style: subtitle),
          ],
        ),
      ],
    );
  }
}
