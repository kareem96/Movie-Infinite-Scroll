

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll/constants/app_constant.dart';
import 'package:flutter_infinite_scroll/data/model/movie_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomCard extends StatelessWidget {
  final Movie movie;
  final Function(Movie) onTap;
  const CustomCard(this.movie, this.onTap,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final releaseDate = movie.releaseDate ?? '${DateTime.now()}';
    final rating = (movie.voteAverage?.toDouble() ?? 0.0) /2;

    return GestureDetector(
      onTap: (){
        onTap(movie);
      },
      child: Card(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(2),
          child: Row(
            children: [
              Hero(
                tag: '${movie.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    width: 100,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                    imageUrl: '${AppConstant.urlImage}${movie.posterPath}',
                  ),

                ),
              ),
              const SizedBox(width: 3,),
              Expanded(
                child: Container(
                  color: Colors.white10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text('${movie.title}', textAlign: TextAlign.start, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                      ),
                      // Text('${UtilsApp.getYear(releaseDate)}'),
                      const SizedBox(height: 2,),
                      RatingBarIndicator(
                        rating:rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 20,
                        direction: Axis.horizontal,
                      ),
                      Text('Rating $rating'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
