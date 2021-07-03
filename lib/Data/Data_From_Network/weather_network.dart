import 'package:http/http.dart' as http;
import 'package:simple_api_bloc_project/enum/enum_constents.dart';

weatherRowData(String location) async {
  const weather_url = 'api.openweathermap.org';
  var url = Uri.http(weather_url, '/data/2.5/weather',
      {'q': '$location', 'appid': '$eather_API_Key'});
  var response = await http.get(url);
  if (response.statusCode == 200) {
    // print(response.body);

    return response.body;
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}
