import 'package:ami_coding_pari_na/model/model.dart';
import 'package:ami_coding_pari_na/service/item_service.dart';
import 'package:ami_coding_pari_na/view/side_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DekhaoChobi extends StatefulWidget {
  const DekhaoChobi({Key? key}) : super(key: key);

  @override
  _DekhaoChobiState createState() => _DekhaoChobiState();
}

class _DekhaoChobiState extends State<DekhaoChobi> {
  List<Item>? item;
  late bool loading;
  @override
  void initState() {
    super.initState();
    setState(() {
      loading = true;
    });
    Service().item().then((value) {
      setState(() {
        item = value;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(loading ? 'Loading..' : 'Dekhao Chobi'),
            automaticallyImplyLeading: true),
        drawer: SideView(),
        body: FutureBuilder(
          future: Service().item(),
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: 100,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 80.0,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            height: 250.0,
                            width: 350.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'ID: ',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                      child: Center(
                                        child: Text('${item![index].id}',
                                            style: TextStyle(
                                                fontSize:
                                                    index <= 100 ? 14.0 : 20.0,
                                                color: Colors.black54)),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.0),
                                Container(
                                  height: 180.0,
                                  width: double.infinity,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  child: Image.network(
                                    '${item![index].url}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '${item![index].title}',
                                  style: TextStyle(fontSize: 16.0),
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    staggeredTileBuilder: (index) => StaggeredTile.fit(1))
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ));
  }
}
