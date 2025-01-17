import 'package:intl/intl.dart';
import '../../../../controller/drawer/transaction_controller.dart';
import '../../../../widgets/bottom_navbar/transaction_history_widget.dart';
import '../../../backend/model/others/transaction_model.dart';
import '../../../utils/basic_screen_import.dart';

class AddMoneyLogScreen extends StatelessWidget {
  const AddMoneyLogScreen({Key? key, required this.controller})
      : super(key: key);
  final TransactionController controller;

  @override
  Widget build(BuildContext context) {
    var data = controller.transactioData.data!.transactions!.addMoney;
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        //  crossAxisAlignment: CrossAxisAlignment.center,
      
        children: [
          SizedBox(
            height: Dimensions.heightSize * 1.5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.78,
            child: data!.isNotEmpty
                ? ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.paddingSize * .3,
                    ),
                    separatorBuilder: (_, index) => verticalSpace(4),
                    itemCount: data.length,
                    itemBuilder: (_, i) {
                      return _mainListWidget(i, data, context);
                    },
                  )
                : Center(
                    child: TitleHeading1Widget(
                      textAlign: TextAlign.center,
                      text: Strings.noRecordFound,
                      color: CustomColor.primaryLightColor,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  _mainListWidget(int index, List<AddMoney> data, BuildContext context) {
    return TransactionWidget(
      amount: data[index].requestAmount!,
      title: data[index].transactionType!,
      dateText: DateFormat.d().format(data[index].dateTime!),
      transaction: data[index].trx!,
      monthText: DateFormat.MMM().format(data[index].dateTime!),
    );
  }
}
