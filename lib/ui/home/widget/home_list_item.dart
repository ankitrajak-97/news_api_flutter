// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/utils/style/app_dimen.dart';

import '../utils/home_utils.dart';

class HomeListItem extends StatelessWidget {
  final String? imageUrl;
  final String? author;
  final String? title;
  final String? desc;
  final String? publishedAt;
  final String? url;
  final VoidCallback onIconButtonClick;



  const HomeListItem({
    super.key,
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.desc,
    required this.publishedAt,
    required this.url,
    required this.onIconButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    final reportDate = getStructuredDateTime(publishedAt);
    // title is structure here
    final modifiedTitle = modifyTitle(title: title);
    return SizedBox(
      height: kHeight * 22,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              width: kWidth * 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(kPadding),
                    height: kHeight * 16,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(kRadius * 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(kRadius * 2),
                        ),
                        child: Image.network(
                          imageUrl ?? "",
                          fit: BoxFit.cover,
                          // Frame builder to add custom behavior when the image frame is loaded
                          frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                            if (wasSynchronouslyLoaded) {
                              return child;
                            }
                            return AnimatedOpacity(
                              opacity: frame == null ? 0 : 1,
                              duration: const Duration(seconds: 1),
                              child: child,
                            );
                          },
                          // Loading builder to show a loader while the image is being fetched
                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                    : null,
                              ),
                            );
                          },
                          // Error builder to handle any errors while fetching the image
                          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.error,
                                color: Colors.red,
                                size: 50,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Author: $author',
                      style: GoogleFonts.roboto(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                        height: 1.1,
                        color: Colors.white54,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  SizedBox(
                    height: kHeight * 1.5,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              // color: Colors.green,
              padding: EdgeInsets.symmetric(
                horizontal: kWidth * 2,
              ).copyWith(top: kHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    modifiedTitle,
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      height: 1.1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: kHeight,
                  ),
                  Text(
                    desc ?? "",
                    style: GoogleFonts.roboto(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w200,
                      height: 1.4,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        reportDate,
                        style: GoogleFonts.roboto(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white30,
                        ),
                      ),
                      IconButton(
                        onPressed: onIconButtonClick,
                        tooltip: "Open in Browser",
                        icon: Icon(Icons.arrow_forward),
                        iconSize: 16.0,
                        splashRadius: 2.0,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: kHeight / 2,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(kHeight),
                  //   child: GestureDetector(
                  //     onTap: () => _launchURL(context),
                  //     child: Text(
                  //       '$url',
                  //       style: GoogleFonts.roboto(
                  //         fontSize: 12.0,
                  //         fontWeight: FontWeight.w600,
                  //         height: 1.4,
                  //         color: Colors.blue,
                  //         decoration: TextDecoration.underline,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
