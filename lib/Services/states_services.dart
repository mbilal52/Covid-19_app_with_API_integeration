import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid_tracker/Models/WorldStatesModel.dart';
import 'package:covid_tracker/Services/Utilities/app_url.dart';

class StatesServices{

  Future<WorldStatesModel> fetchWorldStatesRecords() async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);

    }else{
      throw Exception('Error');
    }
  }

  var data;
  Future<List<dynamic>> countriesListApi() async{
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;

    }else{
      throw Exception('Error');
    }
  }
}