import 'package:ami_coding_pari_na/model/model.dart';
import 'package:http/http.dart' as http;

class Service {
  final String uri = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Item>> item() async {
    try {
      var client = Uri.parse(uri);
      http.Response response = await http.get(client);
      if (response.statusCode == 200) {
        final List<Item> _item = itemFromJson(response.body);
        return _item;
      }
    } catch (e) {
      throw Exception('This Exception is occur ${e.toString()}');
    }
    return item();
  }
}
