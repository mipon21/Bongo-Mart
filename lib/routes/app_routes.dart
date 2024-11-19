import 'package:bongo_mart/features/authentication/screens/login/login.dart';
import 'package:bongo_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:bongo_mart/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:bongo_mart/features/authentication/screens/signup/signup.dart';
import 'package:bongo_mart/features/authentication/screens/signup/vertify_email.dart';
import 'package:bongo_mart/features/personalization/screens/address/add_new_address.dart';
import 'package:bongo_mart/features/personalization/screens/profile/profile.dart';
import 'package:bongo_mart/features/personalization/screens/settings/settings.dart';
import 'package:bongo_mart/features/shop/screens/cart/cart_screen.dart';
import 'package:bongo_mart/features/shop/screens/checkout/checkout.dart';
import 'package:bongo_mart/features/shop/screens/favourite/favourite_screen.dart';
import 'package:bongo_mart/features/shop/screens/home/home_screen.dart';
import 'package:bongo_mart/features/shop/screens/order/order.dart';
import 'package:bongo_mart/features/shop/screens/reviews/product_reviews.dart';
import 'package:bongo_mart/features/shop/screens/store/store.dart';
import 'package:bongo_mart/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviews()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const AddNewAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VertifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoarding()),
  ];
}
