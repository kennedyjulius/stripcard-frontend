

import 'package:stripcard/backend/utils/custom_loading_api.dart';
import '../../backend/model/gift_card/gift_details_model.dart';
import '../../controller/gift_card/create_gift_card_controller.dart';
import '../../utils/basic_screen_import.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/inputs/custom_dropdown_widget.dart';
import '../../widgets/inputs/primary_text_input_widget.dart';

class CreateGiftCardScreen extends StatelessWidget {
  CreateGiftCardScreen({super.key});
  final controller = Get.put(CreateGiftCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarWidget(text: Strings.giftCardDetails),
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSizeHorizontal * 0.8,
      ),
      child: ListView(
        children: [
          verticalSpace(Dimensions.heightSize),
          _amountWidget(context),
          _receiverEmailWidget(context),
          _countryDropDownWidget(context),
          _phoneNumberWidget(context),
          _fromNameWidget(context),
          _quantityWidget(context),
          _userWalletWidget(context),
          _buttonWidget(context)
        ],
      ),
    );
  }

  _receiverEmailWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: Column(
        children: [
          PrimaryTextInputWidget(
            controller: controller.receiverEmailController,
            labelText: Strings.receiverEmail,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  _phoneNumberWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: Column(
        children: [
          PrimaryTextInputWidget(
            controller: controller.phoneNumberController,
            labelText: Strings.phoneNumber,
            keyboardType: TextInputType.phone,
            prefixIcon: Container(
              margin: EdgeInsets.only(
                right: Dimensions.widthSize * 0.5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius * 0.5),
                  bottomLeft: Radius.circular(Dimensions.radius * 0.5),
                ),
                color: CustomColor.primaryLightColor,
              ),
              child: Row(
                mainAxisAlignment: mainCenter,
                mainAxisSize: mainMin,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.marginSizeHorizontal * 0.65,
                    ),
                    child: TitleHeading3Widget(
                      text: controller.mobileCode.value,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _fromNameWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: Column(
        children: [
          PrimaryTextInputWidget(
            controller: controller.fromNameController,
            labelText: Strings.fromName,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }

  _quantityWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: PrimaryTextInputWidget(
        controller: controller.quantityController,
        labelText: Strings.quantity,
        keyboardType: TextInputType.number,
      ),
    );
  }

  _countryDropDownWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          const TitleHeading4Widget(
            text: Strings.country,
            fontWeight: FontWeight.w600,
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
          CustomDropDown<CountryElement>(
            items: controller.countryList,
            onChanged: (value) {
              controller.selectedCountry.value = value!.name;
              controller.selectedCountryCode.value = value.iso2;
              controller.mobileCode.value = value.mobileCode;
            },
            hint: controller.selectedCountry.value,
          ),
        ],
      ),
    );
  }

  _userWalletWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          const TitleHeading4Widget(
            text: Strings.wallet,
            fontWeight: FontWeight.w600,
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
          CustomDropDown<UserWallet>(
            items: controller.userWalletList,
            onChanged: (value) {
              controller.selectedWalletName.value = value!.name;
              controller.selectedCountryCode.value = value.currencyCode;
            },
            hint: controller.selectedWalletName.value,
          ),
        ],
      ),
    );
  }

  _amountWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: Dimensions.heightSize,
      ),
      child: Column(
        crossAxisAlignment: crossStart,
        mainAxisSize: mainMin,
        children: [
          if (controller.giftCardDetailsModel.data.product.denominationType ==
              'FIXED') ...[
            const TitleHeading4Widget(
              text: Strings.amount,
              fontWeight: FontWeight.w600,
            ),
            verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
            Flexible(
              child: Wrap(
                children: List.generate(
                  controller.giftCardDetailsModel.data.product
                      .fixedRecipientDenominations.length,
                  (index) => InkWell(
                    onTap: () {
                      controller.selectedIndex.value = index;
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Dimensions.marginSizeVertical * 0.2,
                        horizontal: Dimensions.marginSizeHorizontal * 0.2,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeHorizontalSize,
                        vertical: Dimensions.paddingSizeVerticalSize * 0.35,
                      ),
                      decoration: BoxDecoration(
                        color: controller.selectedIndex.value == index
                            ? CustomColor.primaryLightColor
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius * 0.5),
                        border: Border.all(
                          color: controller.selectedIndex.value == index
                              ? Colors.transparent
                              : CustomColor.primaryLightColor,
                        ),
                      ),
                      child: TitleHeading3Widget(
                        text: controller.giftCardDetailsModel.data.product
                            .fixedRecipientDenominations[index]
                            .toString(),
                        fontWeight: FontWeight.bold,
                        color: controller.selectedIndex.value == index
                            ? Colors.white
                            : CustomColor.primaryLightColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ] else ...[
            PrimaryTextInputWidget(
              controller: controller.amountController,
              labelText: Strings.phoneNumber,
              onChanged: (v) {
                controller.selectedAmount.value = v;
              },
            ),
          ],
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => controller.isBuyLoading
          ? const CustomLoadingAPI()
          : Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.marginSizeVertical * 0.5,
              ),
              child: PrimaryButton(
                title: Strings.buyNow,
                onPressed: () {
                  controller.createGiftCardApi();
                },
              ),
            ),
    );
  }
}
