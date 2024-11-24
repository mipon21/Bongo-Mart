// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/images/my_circular_Image.dart';
import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/common/widgets/text/section_heading.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';
import 'package:bongo_mart/features/personalization/screens/profile/widgets/change_date_of_birth.dart';
import 'package:bongo_mart/features/personalization/screens/profile/widgets/change_gender.dart';
import 'package:bongo_mart/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:bongo_mart/features/personalization/screens/profile/widgets/change_number.dart';
import 'package:bongo_mart/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(
      appBar: MyAppBar(
        title: Text('Profile'),
        leadingIcon: Icons.arrow_back_ios_new,
        leadingOnPressed: () {
          NavigationController.instance.selectedIndex.value = 4;
          Get.off(() => const NavigationMenu());
        },
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Obx(
                    () {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageLoading.value
                          ? MyShimmerEffect(width: 80, height: 80, radius: 80)
                          : MyCircularImage(
                              isNetworkImage: networkImage.isNotEmpty,
                              imageUrl: image,
                              width: 80,
                              height: 80,
                              isDark: isDark,
                            );
                    },
                  ),
                  TextButton(
                    onPressed: () => controller.uploadUserProfilePicture(),
                    child: Text('Change Profile Picture'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems),
            MySectionHeading(title: 'Basic Information'),
            SizedBox(height: TSizes.spaceBtwItems),
            Obx(
              () => MyProfileMenu(
                icon: Iconsax.arrow_right_34,
                title: 'Name',
                value: controller.user.value.fullName.isEmpty
                    ? "Not Set"
                    : controller.user.value.fullName,
                onPressed: () => Get.to(() => ChangeNameScreen()),
              ),
            ),
            MyProfileMenu(
              title: 'Username',
              value: controller.user.value.username.isEmpty
                  ? "Not Set"
                  : controller.user.value.username,
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
              value: controller.user.value.id.isEmpty
                  ? "Not Set"
                  : controller.user.value.id,
              onPressed: () {
                Clipboard.setData(
                    ClipboardData(text: controller.user.value.id));
                TLoaders.successSnackBar(
                    title: "Copied!", message: "User ID Copied to Clipboard");
              },
            ),
            MyProfileMenu(
              title: 'Email',
              value: controller.user.value.email.isEmpty
                  ? "xxxxx@gmail.com"
                  : controller.user.value.email,
            ),
            Obx(
              () => MyProfileMenu(
                icon: Iconsax.arrow_right_34,
                title: 'Phone Number',
                value: controller.user.value.phoneNumber.isEmpty
                    ? "Not Set"
                    : controller.user.value.phoneNumber,
                onPressed: () => Get.to(() => ChangePhoneNumberScreen()),
              ),
            ),
            Obx(
              () => MyProfileMenu(
                icon: Iconsax.arrow_right_34,
                title: 'Gender',
                value: controller.user.value.gender.isEmpty
                    ? "Not Set"
                    : controller.user.value.gender,
                onPressed: () => Get.to(() => ChangeGenderScreen()),
              ),
            ),
            Obx(
              () => MyProfileMenu(
                icon: Iconsax.arrow_right_34,
                title: 'Date of Birth',
                value: controller.user.value.dateOfBirth.isEmpty
                    ? "Not Set"
                    : controller.user.value.dateOfBirth,
                onPressed: () => Get.to(() => ChangeDateOfBirthScreen()),
              ),
            ),
            Divider(),
            SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: OutlinedButton(
                  onPressed: () => controller.deleteAccountWarning(),
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
