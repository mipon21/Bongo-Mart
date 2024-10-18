
import 'package:bongo_mart/features/shop/screens/reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class MyOverAllRating extends StatelessWidget {
  const MyOverAllRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              MyRatingProgressIndicator(
                rating: 1.0,
                text: '5',
              ),
              MyRatingProgressIndicator(
                rating: 0.8,
                text: '4',
              ),
              MyRatingProgressIndicator(
                rating: 0.6,
                text: '3',
              ),
              MyRatingProgressIndicator(
                rating: 0.4,
                text: '2',
              ),
              MyRatingProgressIndicator(
                rating: 0.2,
                text: '1',
              ),
            ],
          ),
        )
      ],
    );
  }
}

