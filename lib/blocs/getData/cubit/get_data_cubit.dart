// ignore: depend_on_referenced_packages
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:test_solusidigital/models/news_model.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit() : super(GetDataInitial());

  void getData() async {
    emit(GetDataLoading());

    var res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2b7494b2a0754ebcb758148be4e32842"));

    // Jika berhasil get data
    if (res.statusCode == 200) {
      Map<String, dynamic> dataMap = json.decode(res.body);
      NewsModel newsModel = NewsModel.fromJson(dataMap);
      List<Articles>? newsData = newsModel.articles;
      emit(GetDataSuccess(newsData));
    }
    // jika gagal get data
    else if (res.statusCode != 200) {
      emit(GetDataError());
    }
  }
}
