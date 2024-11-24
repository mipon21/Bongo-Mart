// ignore_for_file: prefer_const_constructors

import 'package:bongo_mart/data/repositories/address/address_repository.dart';
import 'package:bongo_mart/features/personalization/models/address_model.dart';
import 'package:bongo_mart/features/personalization/screens/address/addresses.dart';
import 'package:bongo_mart/utils/constants/image_strings.dart';
import 'package:bongo_mart/utils/constants/sizes.dart';
import 'package:bongo_mart/utils/helpers/network_manager.dart';
import 'package:bongo_mart/utils/popups/full_screen_loader.dart';
import 'package:bongo_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  //final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final RxBool refreshData = true.obs;

  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Address not found", message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }
      // Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;
      // Set the "selected" field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
    } catch (e) {
      TLoaders.errorSnackBar(
          title: "Error in selecting address", message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Adding new address", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: "No internet connection",
            message: "Please connect to the internet");
        return;
      }

      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        postalCode: postalCode.text.trim(),
        city: city.text.trim(),
        selectedAddress: true,
        //state: state.text.trim(),
        country: country.text.trim(),
      );

      final id = await addressRepository.addAddress(address);

      address.id = id;

      await selectAddress(address);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Address added successfully",
          message: "Address added successfully");
      Get.to(() => const UserAddressesScreen());
      refreshData.toggle();

      resetFormFields();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Error in adding new address", message: e.toString());
    }
  }

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    //state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  Future deleteAddress(String addressId) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Deleting address", TImages.processingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: "No internet connection",
            message: "Please connect to the internet");
        return;
      }

      await addressRepository.deleteAddress(addressId);

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: "Address deleted successfully",
          message: "Address deleted successfully");
      Get.to(() => const UserAddressesScreen());
      refreshData.toggle();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Error in deleting address", message: e.toString());
    }
  }
  void deleteAddressWarning(String addressId) {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(TSizes.md),
      title: 'Delete Address!',
      middleText: 'Are you sure you want to delete this address?',
      confirm: ElevatedButton(
        onPressed: () async => deleteAddress(addressId),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: BorderSide(color: Colors.red),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: Text('Cancel'),
      ),
    );
  }
}
