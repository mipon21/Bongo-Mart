// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last

import 'package:bongo_mart/common/style/rounded_container.dart';
import 'package:bongo_mart/common/widgets/appbar/appbar.dart';
import 'package:bongo_mart/common/widgets/products/cart/coupon_widget.dart';
import 'package:bongo_mart/common/widgets/widgets_login_signup/success_screen/success_screen.dart';
import 'package:bongo_mart/features/shop/screens/cart/cart_items.dart';
import 'package:bongo_mart/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:bongo_mart/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:bongo_mart/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:bongo_mart/navigation_menu.dart';
import 'package:bongo_mart/utils/constants/colors.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    NavigationController navigationController = Get.put(NavigationController());
    return Scaffold(
      appBar: MyAppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Container(
                height: 300,
                child: MyCartItems(showAddRemoveBtn: false, isScrollable: true),
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              //Coupon form field
              MyCouponCode(),

              SizedBox(height: TSizes.spaceBtwSections),

              //billing details

              MyRoundedContainer(
                padding: EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: isDark ? TColors.dark : TColors.light,
                child: Column(
                  children: [
                    //Price details
                    MyBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Devider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //Payment method
                    MyBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    //Address
                    MyBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              () => SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: 'Payment Successful!',
                subtitle:
                    'Your order has been placed successfully.Product will be deliver soon!',
                buttonText: 'Continue Shopping',
                onPressed: () {
                  navigationController.selectedIndex.value = 0;
                  Get.offAll(() => const NavigationMenu());
                },
              ),
            );
          },
          child: Text('Place Order'),
        ),
      ),
    );
  }
}
