import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_state.dart';
import 'package:printing_costs_2/features/printers/presentation/views/add_printer.dart';
import 'package:printing_costs_2/features/printers/presentation/views/update_printer.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class PrintersView extends StatefulWidget {
  Repository repository;
    PrintersView({Key? key,required this.repository }) : super(key: key);

  @override
  State<PrintersView> createState() => _PrintersViewState();
}

class _PrintersViewState extends State<PrintersView> {

  List<UserPrinters>? printers ;
  var select ;
  @override
  Widget build(BuildContext context) {
    printers = widget.repository.userprinters;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: APPBAR(h:h,w: w,context: context,text: "الطابعات"),
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
                                    Row(
                                      children: [
                                        Expanded(
                                          child: BlocConsumer<PrintersCubit,PrinterListState>(
                                            listener: (context,state){
                                              if (state is PrinterUserListSuccess) {
                                                setState(() {
                                                  widget.repository.userprinters = state.printer;
                                                });
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
                                                    BlocProvider.of<PrintersCubit>(context).deletePrinterList(printers![index].id,widget.repository.login!.id);
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
                                                        child: TEXT(text:"حذف",w: w * 0.035)),
                                                  ),
                                                );
                                              }
                                            },
                                          ),



                                        ),
                                        SizedBox(width: w*0.01,),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => UpdatePrinter(
                                                    printers: printers![index],
                                                    repository: widget.repository,
                                                  ),
                                                ),
                                              );
                                              //update
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
                                                  child: TEXT(text:"تعديل",w: w * 0.035)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
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
      floatingActionButton: FloatingActionButton(
        highlightElevation: 0.5,
        disabledElevation: 0.5,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPrinters(repository:  widget.repository,),
            ),
          );
        },
        backgroundColor: const Color(0xff4f8ea8),
        child: const Icon(
            Icons.add
        ),
      ),
    );
  }
}
