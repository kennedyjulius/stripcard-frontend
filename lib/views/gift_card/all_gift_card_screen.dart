

import 'package:stripcard/backend/utils/custom_loading_api.dart';

import '../../backend/local_storage.dart';
import '../../backend/model/gift_card/gift_card_list_model.dart';
import '../../controller/gift_card/all_gift_card_controller.dart';
import '../../utils/basic_screen_import.dart';
import '../../widgets/appbar/appbar_widget.dart';
import '../../widgets/inputs/custom_dropdown_widget.dart';

class AllGiftCardScreen extends StatelessWidget {
  AllGiftCardScreen({super.key});
  final controller = Get.put(AllGiftCardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBarWidget(text: Strings.giftCards),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.8,
        ),
        child: Column(
          children: [
            _selectCountryWidget(context),
            if (controller.isLoading) ...[
              const CustomLoadingAPI()
            ] else ...[
              Flexible(
                child: GridView(
                  controller: controller.scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                  children: List.generate(
                    controller.historyList.length,
                    (index) => InkWell(
                      onTap: () {
                        LocalStorage.saveProductId(
                          id: controller.historyList[index].productId
                              .toString(),
                        );
                        Get.toNamed(Routes.createGiftCardScreen);
                      },
                      child: Column(
                        children: [
                          Image.network(
                            controller.historyList[index].logoUrls.first,
                            height: Dimensions.heightSize * 5,
                          ),
                          verticalSpace(Dimensions.heightSize),
                          TitleHeading4Widget(
                            text: controller.historyList[index].productName,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
            Obx(
              () => controller.isMoreLoading
                  ? const CircularProgressIndicator(
                      color: CustomColor.primaryLightColor,
                    )
                  : const SizedBox(),
            ),
            verticalSpace(Dimensions.heightSize * 1.5),
          ],
        ),
      ),
    );
  }

  _selectCountryWidget(BuildContext context) {
    return Column(
      children: [
        CustomDropDown<CountryElement>(
          items: controller.countryList,
          onChanged: (value) {
            controller.selectedCountry.value = value!.name;
            controller.selectedCountryCode.value = value.iso2;
            controller.giftCardListModelProcess();
          },
          hint: controller.selectedCountry.value,
        ),
        verticalSpace(Dimensions.heightSize * 1.5),
      ],
    );
  }
}
