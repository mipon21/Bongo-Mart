// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bongo_mart/common/custom_dialog/customdialog.dart';
import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Profile'),
        leadingIcon: Icons.arrow_back_ios,
        leadingOnPressed: () => Get.back(),
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  MyCircularImage(
                    imageUrl: TImages.user,
                    width: 80,
                    height: 80,
                    isDark: isDark,
                  ),
                  TextButton(
                      onPressed: () {}, child: Text('Change Profile Picture')),
                ],
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems),
            MySectionHeading(title: 'Personal Information'),
            SizedBox(height: TSizes.spaceBtwItems),
            MyProfileMenu(
              icon: Iconsax.arrow_right_34,
              title: 'Name',
              value: 'Mipon Rahman',
              onPressed: () {},
            ),
            MyProfileMenu(
              icon: Iconsax.arrow_right_34,
              title: 'Username',
              value: 'mipon21',
              onPressed: () {},
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems),
            MySectionHeading(title: 'Personal Information'),
            SizedBox(height: TSizes.spaceBtwItems),
            MyProfileMenu(
              icon: Iconsax.copy,
              title: 'User ID',
              value: '1234567890',
              onPressed: () {},
            ),
            MyProfileMenu(
              icon: Iconsax.arrow_right_34,
              title: 'Email',
              value: 'mipon21@gmail.com',
              onPressed: () {},
            ),
            MyProfileMenu(
              icon: Iconsax.arrow_right_34,
              title: 'Phone Number',
              value: '01712345678',
              onPressed: () {},
            ),
            MyProfileMenu(
              icon: Iconsax.arrow_right_34,
              title: 'Gender',
              value: 'Male',
              onPressed: () {},
            ),
            MyProfileMenu(
              icon: Iconsax.arrow_right_34,
              title: 'Date of Birth',
              value: '01 Dec 2003',
              onPressed: () {},
            ),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    showCustomCupertinoDialog(
                        context: context,
                        title: 'Delete Account!!!',
                        titleColor: Colors.red,
                        content:
                            'Do You Want to Delete your Account Permanently?',
                        confirmText: 'Yes',
                        confirmTextColor: Colors.red,
                        cancelText: 'No',
                        cancelTextColor: Colors.green,
                        onConfirm: () {
                          Navigator.of(context).pop();
                        });
                  },
                  child: Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
