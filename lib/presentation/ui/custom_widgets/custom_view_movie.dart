

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll/constants/app_constant.dart';
import 'package:flutter_infinite_scroll/data/model/movie_model.dart';

class CustomViewMovie extends StatelessWidget {
  final Movie movie;
  const CustomViewMovie({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkWell(
          onTap: (){},
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: '${movie.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      height: 500,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                      imageUrl: '${AppConstant.urlImage}${movie.posterPath}',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5, right: 5, left: 5),
                  child: Text('${movie.overview}', textAlign: TextAlign.justify,style: const TextStyle(color: Colors.white),),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 3, right: 5),
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Okay'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
