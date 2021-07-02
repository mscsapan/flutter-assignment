import 'package:ami_coding_pari_na/screen/screen_three.dart';
import 'package:ami_coding_pari_na/screen/section_two.dart';
import 'package:flutter/material.dart';

class SideView extends StatefulWidget {
  const SideView({Key? key}) : super(key: key);

  @override
  _SideViewState createState() => _SideViewState();
}

class _SideViewState extends State<SideView> {
  String image = 'https://upload.wikimedia'
      '.org/wikipedia/commons/1/17/Google-flutter-logo.png';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back)),
                ],
              ),
            ),
            Container(
              height: 250.0,
              width: double.infinity,
              //color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(image, width: 40),
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 2.0,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SectionTwo()));
                },
                color: Colors.green,
                child: Text(
                  'Khoj the Search',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DekhaoChobi()));
                },
                color: Colors.green,
                child: Text(
                  'Dekhao Chobi',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
