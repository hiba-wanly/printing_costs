import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/box_controller_2.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_state.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class UpdatePrinter extends StatefulWidget {
  UserPrinters printers;
  Repository repository;
   UpdatePrinter({Key? key, required this.printers, required this.repository}) : super(key: key);

  @override
  _UpdatePrinterState createState() => _UpdatePrinterState();
}

class _UpdatePrinterState extends State<UpdatePrinter>  {

  TextEditingController name_Controller = TextEditingController();
  TextEditingController p_c_Controller = TextEditingController();
  TextEditingController s_u_c_Controller = TextEditingController();
  TextEditingController p_w_a_t_Controller = TextEditingController();
  TextEditingController d_i_h_Controller = TextEditingController();
  TextEditingController i_a_b_w_Controller = TextEditingController();
  TextEditingController k_o_Controller = TextEditingController();
  TextEditingController e_c_Controller = TextEditingController();
  TextEditingController s_m_Controller = TextEditingController();
  TextEditingController t_c_Controller = TextEditingController();
  TextEditingController s_c_Controller = TextEditingController();



  late UserPrinters printer;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: APPBAR(h :h,w: w,context: context,text:"تعديل الطابعة"),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TEXT(text:"اسم الطابعة  ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: name_Controller,
                label :widget.printers != null ? widget.printers.printer_name.toString() : "",
                textInputType:   TextInputType.text,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"كلفة التحضير ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: p_c_Controller,
                label : widget.printers != null ? widget.printers.preparation_cost.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"كلفة البدابة",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: s_u_c_Controller,
                label : widget.printers != null ? widget.printers.start_up_cost.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"اهتلاك الطابعة ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: p_w_a_t_Controller,
                label : widget.printers != null ? widget.printers.Printer_wear_and_tear.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"اهتلاكها بالساعات  ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: d_i_h_Controller,
                label : widget.printers != null ? widget.printers.depreciation_in_hours.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"اهتلاك انفرتر و بطارية ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: i_a_b_w_Controller,
                label :widget.printers != null ? widget.printers.inverter_and_battery_wear.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"كيلوواط عمرها",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: k_o_Controller,
                label : widget.printers != null ? widget.printers.kilowatts_old.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"كهرباء ساعي  ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: e_c_Controller,
                label : widget.printers != null ? widget.printers.Electricity_courier.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"واحدة المواد ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: s_m_Controller,
                label :widget.printers != null ? widget.printers.Single_material.toString() : "",
                textInputType:   TextInputType.text,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"تكاليف انهاء ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: t_c_Controller,
                label : widget.printers != null ? widget.printers.Termination_costs.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"تكاليف إشراف ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: s_c_Controller,
                label : widget.printers != null ? widget.printers.Supervision_costs.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  TEXT(text:widget.printers.courier_depreciationP.toString(),w:w*0.04),
                  TEXT(text:" : اهتلاك ساعي ",w:w*0.04),
                ],
              ),
        SizedBox(
          height: h * 0.03,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [

        TEXT(text:widget.printers.Price_per_kilowatt_with_depreciationP.toString(),w:w*0.04),
              TEXT(text:" : سعرالكيلو الواط مع اهتلاك ",w:w*0.04),
    ],
    ),
    SizedBox(
    height: h * 0.03,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
    children: [

    TEXT(text:widget.printers.Electricity_costsP.toString(),w:w*0.04),
      TEXT(text:" : تكاليف كهرباء  ",w:w*0.04),
    ],
    ),
    SizedBox(
    height: h * 0.03,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TEXT(text:widget.printers.Courier_printingP.toString(),w:w*0.04),
    TEXT(text:" : طباعة ساعية ",w:w*0.04),

    ],
    ),
              SizedBox(
                height: h * 0.03,
              ),
              BlocConsumer<PrintersCubit,PrinterListState>(
                listener: (context,state){
                  if (state is PrinterUserListSuccess) {
                    widget.repository.userprinters = state.printer;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartScreen(
                          repository: widget.repository,
                        ),
                      ),
                      ModalRoute.withName('/homeView'), // Replace this with your root screen's route name (usually '/')
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => StartScreen(
                    //       repository: widget.repository,
                    //     ),
                    //   ),
                    // );
                    // Navigator.of(context).pop();
                    // StartScreen(
                    //   repository: widget.repository,
                    // );
                  } else if (state is PrinterListFailure) {
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
                builder: (context,state){
                  if (state is PrinterListLoading){
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
                  }else{
                    return GestureDetector(
                      onTap: () {
                          printer = UserPrinters(
                              printer_name: name_Controller != null ? name_Controller.text : widget.printers.printer_name,
                              preparation_cost: p_c_Controller != null ? p_c_Controller.text : widget.printers.preparation_cost,
                              start_up_cost: s_u_c_Controller != null ? s_u_c_Controller.text : widget.printers.start_up_cost,
                              Printer_wear_and_tear: p_w_a_t_Controller != null ? p_w_a_t_Controller.text : widget.printers.Printer_wear_and_tear,
                              depreciation_in_hours: d_i_h_Controller != null ? d_i_h_Controller.text : widget.printers.depreciation_in_hours,
                              inverter_and_battery_wear: i_a_b_w_Controller != null ? i_a_b_w_Controller.text : widget.printers.inverter_and_battery_wear,
                              kilowatts_old: k_o_Controller != null ? k_o_Controller.text : widget.printers.kilowatts_old,
                              Electricity_courier: e_c_Controller != null ? e_c_Controller.text : widget.printers.Electricity_courier,
                              Single_material: s_m_Controller != null ? s_m_Controller.text : widget.printers.Single_material,
                              Termination_costs: t_c_Controller != null ? t_c_Controller.text : widget.printers.Termination_costs,
                              Supervision_costs: s_c_Controller != null ? s_c_Controller.text : widget.printers.Supervision_costs,

                          );
                          BlocProvider.of<PrintersCubit>(context).updatePrinterList(printer,widget.printers.id,widget.repository.login!.id);

                      },
                      child: Container(
                        width: double.infinity,
                        height: h * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: const LinearGradient(
                            colors: [Colors.blue, Colors.deepPurple],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [0.2, 0.8],
                            tileMode: TileMode.repeated,
                          ),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: TEXT(text:"تعديل",w: w * 0.035)),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
