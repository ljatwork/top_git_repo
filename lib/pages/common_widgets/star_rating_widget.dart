import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating, size;
  final Color color;

  const StarRating({
    super.key,
    this.size = 15,
    this.starCount = 5,
    this.rating = .0,
    this.color = Colors.amber,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        color: Colors.black45,
        size: size,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: size,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: size,
      );
    }
    return InkResponse(
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$rating",
          style: TextStyle(
            fontSize: size * 0.8,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
        SizedBox(
          width: size * 0.3,
        ),
        Row(
            children:
                List.generate(starCount, (index) => buildStar(context, index))),
      ],
    );
  }
}
