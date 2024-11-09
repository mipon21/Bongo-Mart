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
    return ListTile(
        leading: MyCircularImage(
          isDark: isDark,
          padding: EdgeInsets.zero,
          width: 50,
          height: 50,
          imageUrl: TImages.user,
        ),
        title: Text(
          'Mipon Rahman',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.white),
        ),
        subtitle: Text(
          'mipon550@gmail.com',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.white),
        ),
        trailing: IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),
            icon: const Icon(
              Iconsax.edit,
              color: TColors.white,
            )));
  }
}