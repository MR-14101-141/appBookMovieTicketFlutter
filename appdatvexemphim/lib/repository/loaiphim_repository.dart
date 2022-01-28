import 'dart:convert';
import 'package:http/http.dart';
import 'package:appdatvexemphim/repository/Model/loaiphim.dart';

class LoaiPhimRepository {
  List<LoaiPhim> lst = List.empty();

  Future<List<LoaiPhim>> loadDsloaiphim() async {
    final response = await get(Uri.parse(
        'https://rapphimmeme.000webhostapp.com/home?page=1'));
    lst = (json.decode(response.body)['dslphim'] as List)
        .map((data) => LoaiPhim.fromJson(data))
        .toList();
    return lst;
  }
}
