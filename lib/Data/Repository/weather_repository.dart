import 'package:simple_api_bloc_project/Data/Data_From_Network/weather_network.dart';
import 'package:simple_api_bloc_project/Data/Models/weather_data_model.dart';

weatherRepository(String location) async {
  var rowData = await weatherRowData(location);
  if (rowData != null) {
    final weatherModeledData = weatherFromJson(rowData);
    return weatherModeledData;
  } else {
    return 'No record';
  }
}
