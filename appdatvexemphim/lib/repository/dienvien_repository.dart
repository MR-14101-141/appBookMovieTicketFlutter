import 'dart:convert';
import 'package:http/http.dart';
import 'package:appdatvexemphim/repository/Model/dienvien.dart';

class DienVienRepository {
  List<DienVien> lst = List.empty();

  Future<List<DienVien>> loadDsDienVien() async {
    final response = await get(Uri.parse(
        'https://rapphimmeme.000webhostapp.com/home?page=1'));
    lst = (json.decode(response.body)['dsdv'] as List)
        .map((data) => DienVien.fromJson(data))
        .toList();
    return lst;
  }
}
