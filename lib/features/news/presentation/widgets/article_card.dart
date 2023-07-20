import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/constants/dimens.dart';
import 'package:news_app/config/theme/app_colors.dart';
import 'package:news_app/config/theme/app_styles.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.author,
    required this.screenSize,
  });
  final VoidCallback onTap;
  final String title;
  final String image;
  final String createdAt;
  final String author;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(Dimens.small),
        child: Row(
          children: [
            SizedBox(
              width: screenSize.width / 2 - Dimens.small,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: fEncodeSansBold,
                    ),
                    SizedBox(height: Dimens.large),
                    Text(author, style: fEncodeSansMedium),
                    SizedBox(height: Dimens.small),
                    Text(
                      createdAt.substring(0, 10),
                      style: fEncodeSansRegular.copyWith(color: AppColors.grey),
                    ),
                    SizedBox(
                      height: Dimens.small,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width / 2 - Dimens.small,
              height: screenSize.height / 5,
              child: CachedNetworkImage(
                imageUrl: image,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(Dimens.medium)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: ((context, url) =>
                    const CircularProgressIndicator()),
                errorWidget: ((context, url, error) {
                  return Icon(
                    Icons.image_not_supported_outlined,
                    size: Dimens.xLarge - 14,
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
