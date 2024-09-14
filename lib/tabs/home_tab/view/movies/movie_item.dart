import 'package:flutter/material.dart';
import 'package:movies_app/shared/style/app_theme.dart';
import 'package:movies_app/tabs/home_tab/view/movies/movie_modal.dart';

class MovieItem extends StatefulWidget {
  final MovieModal movie;
  final bool showDetails;

  MovieItem({
    required this.movie,
    this.showDetails = false,
  });

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.grayBg,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  height: 120,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.asset(
                    widget.movie.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(36, 36),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.transparent,
                ),
                onPressed: _toggleBookmark,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: isBookmarked
                          ? AppTheme.orange
                          : const Color(0XFF514F4F).withOpacity(0.87),
                      size: 36,
                    ),
                    Icon(
                      isBookmarked ? Icons.check : Icons.add,
                      color: AppTheme.whiteColor,
                      size: 11,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (widget.showDetails) ...[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/star.png'),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.movie.rating ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.movie.title ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.movie.duration ?? '',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            )
          ],
        ],
      ),
    );
  }
}
