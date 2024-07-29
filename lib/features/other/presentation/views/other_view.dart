import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/box_controller_2.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/on_preesd.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/other/presentation/manager/other_cubit/other_cubit.dart';
import 'package:printing_costs_2/features/other/presentation/manager/other_cubit/other_state.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class OtherView extends StatefulWidget {
  Repository repository;
    OtherView({Key? key,required this.repository }) : super(key: key);

  @override
  State<OtherView> createState() => _OtherViewState();
}

class _OtherViewState extends State<OtherView> {
  TextEditingController gainController = TextEditingController();


  TextEditingController riskController = TextEditingController();

  Other? other;
 late Other other2 ;
  @override
  Widget build(BuildContext context) {
    other = widget.repository.other!;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:APPBAR(h:h,w: w, context:context,text: "أخرى"),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding:
            EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: TEXT(text: "الربح    % ",w:w*0.04)),

                    Expanded(
                      flex: 3,
                      child: BoxController2(
                        controller:   gainController,
                      label:  other != null ? other!.cost_gain.toString() : "",
                        textInputType:  TextInputType.number,
                     h:   h,
                      w:  w,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Row(
                  children: [
                    Expanded(child: TEXT(text:"المخاطر  % ",w:w*0.04)),
                    Expanded(
                      flex: 3,
                      child: BoxController2(
                      controller:  riskController,
                      label:  other != null ? other!.cost_risk.toString() :"",
                     textInputType:   TextInputType.number,
                   h:     h,
                    w:    w,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: w * 0.03,
                ),

      BlocConsumer<OtherCubit, OtherListState>(
          listener: (context,state){
            if (state is OtherListSuccess) {
              debugPrint(state.other.toString());
              widget.repository.other = state.other;
              return Navigator.of(context).pop();
              // StartScreen(
              //   repository: widget.repository,
              // );
            } else if (state is OtherListFailure) {
              Flushbar(
                duration: const Duration(seconds: 3),
                backgroundColor: Colors.white,
                messageColor: Colors.black,
                messageSize: h * 0.02,
                message: state.errMessage,
              ).show(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => StartScreen(
                    repository: widget.repository,
                  ),
                ),
                ModalRoute.withName('/homeView'), // Replace this with your root screen's route name (usually '/')
              );
              // Navigator.of(context).pop();
              // FlashBAR(message: state.errMessage,h: h,context1: context,);
            }
          },
          builder: (context, state) {
            if (state is OtherListLoading){
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
                  if (gainController.text.isNotEmpty || riskController.text.isNotEmpty) {
                    other2 = Other(
                      cost_risk: riskController.text.isNotEmpty ?  riskController.text : widget.repository.other!.cost_risk,
                      cost_gain:  gainController.text.isNotEmpty ? gainController.text :  widget.repository.other!.cost_gain ,
                    );

                    BlocProvider.of<OtherCubit>(context).updateOtherList(other2,widget.repository.other!.id, widget.repository.login!.id);
                  }
                },
                child: ONPreesd(h:h,w:w,string:"تعديل"),

              );
            }
          }
      ),
              ],
            )),
      ),
    );
  }
}
