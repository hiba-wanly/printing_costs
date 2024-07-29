import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_state.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class AddPrinters extends StatefulWidget {
  Repository repository;
   AddPrinters({Key? key,required this.repository}) : super(key: key);

  @override
  _AddPrintersState createState() => _AddPrintersState();
}

class _AddPrintersState extends State<AddPrinters>  {

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


  var formkey = GlobalKey<FormState>();

  late Printers printer;

  List<Printers>? printers ;
  var select ;
  @override
  Widget build(BuildContext context) {
    printers = widget.repository.printers;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    List<bool> itemLoadingStates = List.generate(printers!.length, (index) => false);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: APPBAR(h:h,w: w,context: context,text: "إضافة طابعة"),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:
        EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.17),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                printers != null ?
                ListView.builder(

                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(
                      left: w * 0.01, right: w * 0.01, top: h * 0.01,bottom: h * 0.01),
                  itemCount: printers!.length,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context,int index)=>
                      Column(
                        children: [
                          Container(
                            // height: h*0.2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: kElevationToShadow[4],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding:  EdgeInsets.all(w*0.04),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TEXT(text: "الطابعة : " ,w:w*0.035),
                                        TEXT(text:"${printers![index].printer_name!}   ",w:w*0.04),
                                        // TEXT(text:printers![index].preparation_cost!,w:w*0.03),
                                      ],
                                    ),
                                    SizedBox(height: h*0.01,),
                                     BlocConsumer<PrintersCubit,PrinterListState>(
                                        listener: (context,state){
                                          if (state is PrinterUserListSuccess) {
                                            // setState(() {
                                            //   widget.repository.userprinters = state.printer;
                                            // });
                                            widget.repository.userprinters = state.printer;
                                            // FlashBAR(message: "تمت اضافة الطابعة",h: h, context1: context,);
                                            Flushbar(
                                              duration: const Duration(seconds: 3),
                                              backgroundColor: Colors.white,
                                              messageColor: Colors.black,
                                              messageSize: h * 0.02,
                                              message: "تمت اضافة الطابعة",
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
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => PrintersView(
                                            //       repository: widget.repository,
                                            //     ),
                                            //   ),
                                            // );
                                            // Navigator.pop(context);
                                            // return Navigator.of(context).pop();
                                            // StartScreen(
                                            //   repository: widget.repository,
                                            // );
                                          } else if (state is PrinterListFailure) {
                                            Flushbar(
                                              duration: const Duration(seconds: 3),
                                              backgroundColor: Colors.white,
                                              messageColor: Colors.black,
                                              messageSize: h * 0.02,
                                              message: "تمت اضافة الطابعة",
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
                                          if (state is PrinterListLoading && select == index){
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
                                                setState((){
                                                  select = index;
                                                });
                                                BlocProvider.of<PrintersCubit>(context).addPrinterList(printers![index].id,widget.repository.login!.id);
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
                                                    )),
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: TEXT(text:"إضافة",w: w * 0.035)),
                                              ),
                                            );
                                          }
                                        },
                                      ),




                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: BlocConsumer<PrintersCubit,PrinterListState>(
                                    //         listener: (context,state){
                                    //           if (state is PrinterListSuccess) {
                                    //             setState(() {
                                    //               widget.repository.printers = state.printer;
                                    //             });
                                    //             widget.repository.printers = state.printer;
                                    //             // return Navigator.of(context).pop();
                                    //             // StartScreen(
                                    //             //   repository: widget.repository,
                                    //             // );
                                    //           } else if (state is PrinterListFailure) {
                                    //             Navigator.push(
                                    //               context,
                                    //               MaterialPageRoute(
                                    //                 builder: (context) => StartScreen(
                                    //                   repository: widget.repository,
                                    //                 ),
                                    //               ),
                                    //             );
                                    //             // Navigator.of(context).pop();
                                    //             FlashBAR(message: state.errMessage,h: h);
                                    //           }
                                    //         },
                                    //         builder: (context,state){
                                    //           if (state is PrinterListLoading){
                                    //             return Container(
                                    //               width: double.infinity,
                                    //               height: h * 0.06,
                                    //
                                    //               child: Align(
                                    //                   alignment: Alignment.center,
                                    //                   child: CircularProgressIndicator()),
                                    //               decoration: BoxDecoration(
                                    //                   borderRadius: BorderRadius.circular(5),
                                    //                   gradient: LinearGradient(
                                    //                     colors: [Colors.lightBlueAccent, Colors.deepPurple],
                                    //                     begin: Alignment.bottomLeft,
                                    //                     end: Alignment.topRight,
                                    //                     stops: [0.2, 0.8],
                                    //                     tileMode: TileMode.repeated,
                                    //                   )),
                                    //             );
                                    //           }else{
                                    //             return GestureDetector(
                                    //               onTap: () {
                                    //                 BlocProvider.of<PrintersCubit>(context).deletePrinterList(printers![index].id);
                                    //               },
                                    //               child: Container(
                                    //                 width: double.infinity,
                                    //                 height: h * 0.06,
                                    //                 child: Align(
                                    //                     alignment: Alignment.center,
                                    //                     child: TEXT(text:"delete",w: w * 0.035)),
                                    //                 decoration: BoxDecoration(
                                    //                     borderRadius: BorderRadius.circular(5),
                                    //                     gradient: LinearGradient(
                                    //                       colors: [Colors.blue, Colors.deepPurple],
                                    //                       begin: Alignment.bottomLeft,
                                    //                       end: Alignment.topRight,
                                    //                       stops: [0.2, 0.8],
                                    //                       tileMode: TileMode.repeated,
                                    //                     )),
                                    //               ),
                                    //             );
                                    //           }
                                    //         },
                                    //       ),
                                    //
                                    //
                                    //
                                    //     ),
                                    //     SizedBox(width: w*0.01,),
                                    //     Expanded(
                                    //       child: GestureDetector(
                                    //         onTap: () {
                                    //           Navigator.push(
                                    //             context,
                                    //             MaterialPageRoute(
                                    //               builder: (context) => UpdatePrinter(
                                    //                 printers: printers![index],
                                    //                 repository: widget.repository,
                                    //               ),
                                    //             ),
                                    //           );
                                    //           //update
                                    //         },
                                    //         child: Container(
                                    //           width: double.infinity,
                                    //           height: h * 0.06,
                                    //           child: Align(
                                    //               alignment: Alignment.center,
                                    //               child: TEXT(text:"update",w: w * 0.035)),
                                    //           decoration: BoxDecoration(
                                    //               borderRadius: BorderRadius.circular(5),
                                    //               gradient: LinearGradient(
                                    //                 colors: [Colors.blue, Colors.deepPurple],
                                    //                 begin: Alignment.bottomLeft,
                                    //                 end: Alignment.topRight,
                                    //                 stops: [0.2, 0.8],
                                    //                 tileMode: TileMode.repeated,
                                    //               )),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.02,
                          ),
                        ],
                      ),
                )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   highlightElevation: 0.5,
      //   disabledElevation: 0.5,
      //   onPressed: (){
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => AddPrinters(repository:  widget.repository,),
      //       ),
      //     );
      //   },
      //   child: Icon(
      //       Icons.add
      //   ),
      //   backgroundColor: Color(0xff4f8ea8),
      // ),
    );
    //   Scaffold(
    //   appBar: APPBAR(h :h,w: w,context: context,text:"Add Printer"),
    //   resizeToAvoidBottomInset: true,
    //   extendBodyBehindAppBar: true,
    //   body: SingleChildScrollView(
    //     child: Form(
    //       key: formkey,
    //       child: Padding(
    //         padding:
    //         EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.17),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             TEXT(text:"اسم الطابعة  ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: name_Controller,
    //               label :"",
    //               textInputType:   TextInputType.text,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"كلفة التحضير ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: p_c_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"كلفة البدابة",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: s_u_c_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"اهتلاك الطابعة ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: p_w_a_t_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"اهتلاكها بالساعات  ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: d_i_h_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"اهتلاك انفرتر و بطارية ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: i_a_b_w_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"كيلوواط عمرها",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: k_o_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"كهرباء ساعي  ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: e_c_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"واحدة المواد ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: s_m_Controller,
    //               label : "",
    //               textInputType:   TextInputType.text,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"تكاليف انهاء ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: t_c_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"تكاليف إشراف ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: s_c_Controller,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BlocConsumer<PrintersCubit,PrinterListState>(
    //               listener: (context,state){
    //                 if (state is PrinterListSuccess) {
    //                   widget.repository.printers = state.printer;
    //                   // Navigator.push(
    //                   //   context,
    //                   //   MaterialPageRoute(
    //                   //     builder: (context) => StartScreen(
    //                   //       repository: widget.repository,
    //                   //     ),
    //                   //   ),
    //                   // );
    //                   // Navigator.of(context).pop();
    //                   // StartScreen(
    //                   //   repository: widget.repository,
    //                   // );
    //                 } else if (state is PrinterListFailure) {
    //                   Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => StartScreen(
    //                         repository: widget.repository,
    //                       ),
    //                     ),
    //                   );
    //                   // Navigator.of(context).pop();
    //                   FlashBAR(message: state.errMessage,h: h);
    //                 }
    //               },
    //               builder: (context,state){
    //                 if (state is PrinterListLoading){
    //                   return Container(
    //                     width: double.infinity,
    //                     height: h * 0.06,
    //
    //                     child: Align(
    //                         alignment: Alignment.center,
    //                         child: CircularProgressIndicator()),
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(5),
    //                         gradient: LinearGradient(
    //                           colors: [Colors.lightBlueAccent, Colors.deepPurple],
    //                           begin: Alignment.bottomLeft,
    //                           end: Alignment.topRight,
    //                           stops: [0.2, 0.8],
    //                           tileMode: TileMode.repeated,
    //                         )),
    //                   );
    //                 }else{
    //                   return GestureDetector(
    //                     onTap: () {
    //                       if(formkey.currentState!.validate()){
    //                         printer = Printers(
    //                           printer_name: name_Controller.text,
    //                           preparation_cost: p_c_Controller.text,
    //                           start_up_cost: s_u_c_Controller.text,
    //                           Printer_wear_and_tear: p_w_a_t_Controller.text,
    //                           depreciation_in_hours: d_i_h_Controller.text,
    //                           inverter_and_battery_wear: i_a_b_w_Controller.text,
    //                           kilowatts_old: k_o_Controller.text,
    //                           Electricity_courier: e_c_Controller.text,
    //                           Single_material: s_m_Controller.text,
    //                           Termination_costs: t_c_Controller.text,
    //                           Supervision_costs: s_c_Controller.text
    //
    //                         );
    //                         BlocProvider.of<PrintersCubit>(context).addPrinterList(printer);
    //
    //                       }
    //                     },
    //                     child: Container(
    //                       width: double.infinity,
    //                       height: h * 0.06,
    //                       child: Align(
    //                           alignment: Alignment.center,
    //                           child: TEXT(text:"add",w: w * 0.035)),
    //                       decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(5),
    //                           gradient: LinearGradient(
    //                             colors: [Colors.blue, Colors.deepPurple],
    //                             begin: Alignment.bottomLeft,
    //                             end: Alignment.topRight,
    //                             stops: [0.2, 0.8],
    //                             tileMode: TileMode.repeated,
    //                           ),
    //                       ),
    //                     ),
    //                   );
    //                 }
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}

