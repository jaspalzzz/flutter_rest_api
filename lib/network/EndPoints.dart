import 'dart:convert';
import 'package:flutter_rest_api/model/BeerListModel.dart';
// get reponse from API
import 'package:http/http.dart' as http;
// to check internet connection
import 'package:connectivity/connectivity.dart';

// API url
String url = "https://api.punkapi.com/v2/beers";

// Here we are using http package to fetch data from API
// We defined retrun type BeerListModel
Future<BeerListModel> getBeerListData() async {
  final response = await http.get(url,);
  //json.decode used to decode response.body(string to map)
  return BeerListModel.fromJson(json.decode(response.body));
}


// method defined to check internet connectivity
Future<bool> isConnected() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
