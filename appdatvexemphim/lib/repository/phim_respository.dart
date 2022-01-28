import 'dart:convert';
import 'package:http/http.dart';
import 'package:appdatvexemphim/repository/Model/phim.dart';

class PhimRepository {
  List<Phim> lst = List.empty();
  int pageCount = 1;

  Future<List<Phim>> loadDsphim() async {
    final response = await get(Uri.parse(
        'https://rapphimmeme.000webhostapp.com/home?page=$pageCount'));
    List<Phim> list1 = (json.decode(response.body)['dsphim']['data'] as List)
        .map((data) => Phim.fromJson(data))
        .toList();
    lst = List.from(lst)..addAll(list1);
    pageCount++;
    return lst;
  }

  Future<List<Phim>> refreshDsPhim() async {
    final response = await get(Uri.parse(
        'https://rapphimmeme.000webhostapp.com/home?page=1'));
    lst = (json.decode(response.body)['dsphim']['data'] as List)
        .map((data) => Phim.fromJson(data))
        .toList();
    pageCount = 2;
    return lst;
  }

  Future<Phim> loadphimddetail(int idphim) async {
    final response = await get(
        Uri.parse('https://rapphimmeme.000webhostapp.com/home/singlePhim/$idphim'));
    Phim phim = Phim.fromJson(json.decode(response.body));
    return phim;
  }
}
