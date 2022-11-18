import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/item_model.dart';
import '../../utils/ui_components.dart';

class RepoTileWidget extends StatelessWidget {
  final ItemModel model;

  const RepoTileWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: model.owner.avatarUrl,
          width: size.width * 0.25,
          placeholder: (context, url) => Icon(
            CupertinoIcons.person_alt_circle_fill,
            size: size.width * 0.25,
            color: Colors.blueGrey,
          ),
          errorWidget: (context, url, error) => Icon(
            CupertinoIcons.person_alt_circle_fill,
            size: size.width * 0.25,
            color: Colors.blueGrey,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: size.width * 0.65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name ?? '',
                style: const TextStyle(
                  fontSize: kSubHeader,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "by ${model.owner.login}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: kBody2,
                  fontWeight: FontWeight.w700,
                  color: kBodyColor,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                model.description ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: kBody1,
                  fontWeight: FontWeight.w500,
                  color: kBodyColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              buildStarIcon(),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildStarIcon() {
    double iconSize = 15;
    return Row(
      children: [
        Text(
          model.stargazersCount.toString() ?? "",
          style: TextStyle(
            fontSize: iconSize,
            fontWeight: FontWeight.w500,
            color: Colors.amber,
          ),
        ),
        SizedBox(
          width: iconSize * 0.3,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: iconSize,
        ),
      ],
    );
  }
}
