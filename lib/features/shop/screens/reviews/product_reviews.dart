// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/ratingbar/rating_bar_uni.dart';
import 'package:bongo_mart/features/shop/screens/reviews/widgets/over_all_rating.dart';
import 'package:bongo_mart/features/shop/screens/reviews/widgets/user_review_card.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Reviews & Ratings'),
        leadingOnPressed: Get.back,
        leadingIcon: Icons.arrow_back_ios_new,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ratings and Reviews are very important to us. They help us improve our products and services. We appreciate your time and feedback.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Overall Rating
              MyOverAllRating(),
              MyRatingBarIndicatorUni(
                rating: 4.8,
                itemSize: 40,
              ),
              Text('18,123 Reviews', style: Theme.of(context).textTheme.bodyMedium,),
              SizedBox(height: TSizes.spaceBtwItems,),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

