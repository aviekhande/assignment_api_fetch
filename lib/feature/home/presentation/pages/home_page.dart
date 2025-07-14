import 'dart:async';
import 'dart:developer';

import 'package:assignment_api/core/theme/app_colors.dart';
import 'package:assignment_api/feature/home/presentation/bloc/posts_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/posts_bloc.dart';
import '../bloc/posts_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PostsBloc>().add(PostsFetchEvent());
  }

  List<String> recentSearch = [];
  Timer? _debunce;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kColorPrimary,
        title: Text(
          "Home Page",
          style: TextStyle(color: AppColors.kColorWhite),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.kColorWhite,
              boxShadow: [
                BoxShadow(
                  color: AppColors.kColorBlack.withAlpha((0.05 * 255).toInt()),
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: TextFormField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  if (_debunce?.isActive ?? false) _debunce?.cancel();
                  _debunce = Timer(Duration(milliseconds: 500), () async {
                    if (value.isEmpty) {
                      context.read<PostsBloc>().add(PostsResetEvent());
                      return;
                    }
                    context.read<PostsBloc>().add(
                      PostsSearchEvent(serachKey: value),
                    );

                    recentSearch.add(value);
                  });
                } else {
                  context.read<PostsBloc>().add(PostsResetEvent());
                  return;
                }
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ),
          BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              return recentSearch.isNotEmpty
                  ? SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: recentSearch.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.kColorBlack.withAlpha(
                                      (0.05 * 255).toInt(),
                                    ),
                                    blurRadius: 14,
                                    spreadRadius: 10,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: AppColors.kColorWhite,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(10),
                              child: Text(recentSearch[index]),
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox.shrink();
            },
          ),

          Expanded(
            child: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is PostsLoadedState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<PostsBloc>().add(PostsFetchEvent());
                    },
                    child: ListView.builder(
                      itemCount: state.postsData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: AppColors.kColorWhite,

                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.kColorBlack.withAlpha(
                                  (0.05 * 255).toInt(),
                                ),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title : ${state.postsData![index].title}"),
                              SizedBox(height: 10),
                              Text(
                                "Description : ${state.postsData![index].description}",
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is PostsLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
