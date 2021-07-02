import 'package:ami_coding_pari_na/model/save_data.dart';
import 'package:ami_coding_pari_na/view/side_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SectionTwo extends StatefulWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  _SectionTwoState createState() => _SectionTwoState();
}

class _SectionTwoState extends State<SectionTwo> {
  TextEditingController inputTextController = TextEditingController();
  TextEditingController searchTextController = TextEditingController();
  SaveData _saveData = new SaveData();
  String result = 'True/False';

  storeData() {
    List<String> splitText = (inputTextController.text).split(',');
    var searchWord = int.parse((searchTextController.text));
    List<int> inputInt = splitText.map((e) => int.parse(e)).toList();
    if (inputInt.contains(searchWord)) {
      setState(() {
        result = 'True';
      });
    } else {
      setState(() {
        result = 'False';
      });
    }
    inputInt.sort();
    print(inputInt.reversed);
  }

  @override
  void initState() {
    super.initState();
    _saveData.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Section Two'),
          centerTitle: true,
          automaticallyImplyLeading: true),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: inputTextController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  hintText: 'insert like 10,15,20',
                  filled: true,
                  fillColor: Colors.grey[300]),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchTextController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.grey[300]),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Card(
            elevation: 7,
            child: Container(
              height: 100,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Output'),
                    SizedBox(height: 20.0),
                    Text(
                      result,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: double.infinity,
              height: 45,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () => storeData(),
                color: Colors.green,
                child: Text('Khoj', style: TextStyle(fontSize: 20.0)),
              ),
            ),
          ),
        ],
      ),
      drawer: SideView(),
    );
  }
}
