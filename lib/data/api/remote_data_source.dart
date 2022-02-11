

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_infinite_scroll/data/api/path_dio.dart';
import 'package:flutter_infinite_scroll/data/api/url_constant.dart';
import 'package:flutter_infinite_scroll/data/model/movie_model.dart';
import 'package:flutter_infinite_scroll/utils/helper.dart';
import 'package:logger/logger.dart';

import 'custom_interceptors.dart';

class RemoteDataSource{
  late Dio _dio;
  RemoteDataSource(){
    _dio = Dio();
    _dio.interceptors.add(CustomInterceptors());
  }


  Future<MoviePopular?>getMoviePopular(int page) async{
    try{
      final _parameters = {
        'api_key': '0d677b16a44d2b5a79edf325bc1ee9b7',
        'language': 'es-ES',
        'page': '$page'
      };
      final _url = PathDio.getUrl(path: UrlConstant.pathPopular, parameters: _parameters);
      final checkConnectivity = await Helper.checkConnectivity();
      if(checkConnectivity){
        final response = await _dio.getUri(_url);
        if(response.statusCode == HttpStatus.ok){
          final data = response.data;
          if(data != null){
            return MoviePopular.fromJson(response.data);
          }else{
            return null;
          }
        }else{
          return null;
        }
      }
    }catch (e){
      Logger().d(e);
      return null;
    }
  }
}