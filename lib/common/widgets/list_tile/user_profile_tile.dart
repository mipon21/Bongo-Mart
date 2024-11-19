// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:bongo_mart/common/widgets/shimmer/shimmer_effect.dart';
import 'package:bongo_mart/features/personalization/controller/user_controller.dart';

import '../images/my_circular_Image.dart';
import '../../../features/personalization/screens/profile/profile.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class MyUserProfile extends StatelessWidget {
  const MyUserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return ListTile(
        leading: Obx(
          () {
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : TImages.user;
            return controller.imageLoading.value
                ? MyShimmerEffect(width: 56, height: 56, radius: 56)
                : MyCircularImage(
                    isNetworkImage: networkImage.isNotEmpty,
                    imageUrl: image,
                    padding: EdgeInsets.zero,
                    width: 56,
                    backgroundColor: Colors.transparent,
                    height: 56,
                    isDark: isDark,
                  );
          },
        ),
        title: Obx(
          () => Text(
            controller.user.value.fullName.isEmpty
                ? "Sir,"
                : controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
        ),
        subtitle: Obx(
          () => Text(
            controller.user.value.email.isEmpty
                ? "xxxxx@gmail.com"
                : controller.user.value.email,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white),
          ),
        ),
        trailing: IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),
            icon: const Icon(
              Iconsax.edit,
              color: TColors.white,
            )));
  }
}
