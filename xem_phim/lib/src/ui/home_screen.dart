import 'dart:io' show Platform;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xem_phim/src/bloc/bloc/moviebloc_bloc.dart';
import 'package:xem_phim/src/model/movie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieblocBloc>(
          create: (context) => MovieblocBloc()..add(MovieEventStarted(0, '')),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.black45,
          ),
          title: Text(
            'Movie-db'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption
                ?.copyWith(color: Colors.black45, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                  // backgroundImage: AssetImage('assets/images/logo.jpg'),
                  ),
            )
          ],
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext contex, BoxConstraints constraints) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<MovieblocBloc, MovieblocState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return Center(
                      child: Platform.isAndroid ? CircularProgressIndicator() : CircularProgressIndicator(),
                    );
                  }
                  if (state is MovieLoaded) {
                    List<Movie> movies = state.movieList;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider.builder(
                          itemCount: movies.length,
                          itemBuilder: (context, index, realIndex) {
                            Movie movie = movies[index];
                            print(movie.backdropPath);
                            return Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                                  child: CachedNetworkImage(
                                    imageUrl: 'http://image.tmdb.org/t/p/original/${movie.backdropPath}',
                                    height: MediaQuery.of(context).size.height / 3,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        Platform.isAndroid ? CircularProgressIndicator() : CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Container(
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          options: CarouselOptions(
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(microseconds: 5000),
                            pauseAutoPlayOnTouch: true,
                            viewportFraction: 0.8,
                            enlargeCenterPage: true,
                          ),
                        )
                      ],
                    );
                  } else {
                    return Container(
                      child: Text("hoang cong thuan"),
                    );
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
