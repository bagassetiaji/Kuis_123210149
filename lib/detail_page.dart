import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kuis_123210149/disease_data.dart';

class DetailPage extends StatelessWidget {
  final Diseases id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 134, 34),
        title: Text(id.name, style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: id.imgUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(id.imgUrls);
                }),
          ),
          Text("Diseases Name"),
          Text(id.name),
          Text("Plant Name"),
          Text(id.plantName),
          Text("Symptom"),
          Text(id.symptom),
          ElevatedButton(
              onPressed: () {
                launchURL(id.imgUrls);
              },
              child: Text("Lihat Foto")),
        ],
      ),
    );
  }
}

Future<void> launchURL(String url) async {
  final Uri _url = Uri.parse(url);
  if (!await launchUrl(_url)) {
    throw "Couldn't launch $_url";
  }
}