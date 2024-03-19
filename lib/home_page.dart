import 'package:flutter/material.dart';
import 'package:kuis_123210149/disease_data.dart';
import 'package:kuis_123210149/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 134, 34),
        title: Text("Plant Diseases App", style: TextStyle(color: Colors.white),),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 0.75,
          ),
          itemCount: listDisease.length,
          itemBuilder: (context, index) {
            final Diseases diseases = listDisease[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(id: diseases);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image.network(diseases.imgUrls),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(diseases.name),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
