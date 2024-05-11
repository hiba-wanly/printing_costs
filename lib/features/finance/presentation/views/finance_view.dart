import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/box_controller_2.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/on_preesd.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';
import 'package:printing_costs_2/features/finance/presentation/manager/finance_cubit/finance_cubit.dart';
import 'package:printing_costs_2/features/finance/presentation/manager/finance_cubit/finance_state.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class FinanceView extends StatefulWidget {
  Repository repository;
   FinanceView({Key? key ,required this.repository} ) : super(key: key);

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView>  {

  TextEditingController financeController = TextEditingController();

  Finance? finance;

  @override
  Widget build(BuildContext context) {
    finance = widget.repository.finance!;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: APPBAR(h :h,w: w,context: context,text:"الصرف"),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Padding(
          padding:
          EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.17),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: BoxController2(
                  controller: financeController,
                  label :finance != null ? finance!.num.toString() : "",
                  textInputType:   TextInputType.number,
                h:  h,
                w:  w,
                ),
              ),
              SizedBox(
                width: w * 0.025,
              ),
              Expanded(
                flex: 1,
                child: BlocConsumer<FinanceCubit, FinanceListState>(
                  listener: (context,state){
                    if (state is FinanceListSuccess) {
                      debugPrint(state.finance.toString());
                      widget.repository.finance = state.finance;
                      return Navigator.of(context).pop();
                      // StartScreen(
                      //   repository: widget.repository,
                      // );
                    } else if (state is FinanceListFailure) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StartScreen(
                            repository: widget.repository,
                          ),
                        ),
                      );
                      // Navigator.of(context).pop();
                      FlashBAR(message: state.errMessage,h: h,context1: context,);
                    }
                  },
                  builder: (context, state) {
                    if (state is FinanceListLoading){
                      return Container(
                        width: double.infinity,
                        height: h * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: const LinearGradient(
                              colors: [Colors.lightBlueAccent, Colors.deepPurple],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: [0.2, 0.8],
                              tileMode: TileMode.repeated,
                            )),

                        child: const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator()),
                      );
                    }
                    else {
                      return GestureDetector(
                          onTap: () {
                            if (financeController.text.isNotEmpty) {
                              BlocProvider.of<FinanceCubit>(context).updateFinanceList(int.parse(financeController.text),widget.repository.finance!.id,widget.repository.login!.id);
                            }
                          },
                          child: ONPreesd(h:h,w:w,string: "تعديل")
                      );
                    }
                  }
                ),

              ),

            ],
          )),
    );
  }
}
