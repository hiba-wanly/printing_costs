import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/box_controller_2.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_state.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class AddMaterial extends StatefulWidget {
  Repository repository;
   AddMaterial({Key? key,required this.repository}) : super(key: key);

  @override
  _AddMaterialState createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {

  TextEditingController nameController = new TextEditingController();
  TextEditingController unitController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController numController = new TextEditingController();

  var formkey = GlobalKey<FormState>();

  late Materials material;

  List<Materials>? materials ;

  @override
  Widget build(BuildContext context) {
    materials = widget.repository.materials;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:  APPBAR(h:h,w: w,context: context,text: "إضافة مادة"),
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
                materials != null ?
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(
                      left: w * 0.01, right: w * 0.01, top: h * 0.01,bottom: h * 0.01),
                  itemCount: materials!.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
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
                                        TEXT(text: " المادة : " ,w:w*0.035),

                                        TEXT(text:materials![index].brand! +"   ",w:w*0.04),
                                        TEXT(text:materials![index].color! +"   ",w:w*0.04),
                                        TEXT(text:materials![index].material! +"   ",w:w*0.04),

                                      ],
                                    ),
                                    SizedBox(height: h*0.01,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            TEXT(text:"تكلفة العبوة",w:w*0.035),
                                            SizedBox(height: h*0.01,),
                                            TEXT(text:materials![index].price.toString(),w:w*0.035),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            TEXT(text:"عدد الواحدات",w:w*0.035),
                                            SizedBox(height: h*0.01,),
                                            TEXT(text:materials![index].number_of_units.toString(),w:w*0.035),
                                            TEXT(text:materials![index].unit!,w:w*0.03),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            TEXT(text:"تكلفة الواحدة",w:w*0.035),
                                            SizedBox(height: h*0.01,),
                                            TEXT(text:materials![index].cost_per_One.toString(),w:w*0.035),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: h*0.01,),
                                     BlocConsumer<MaterialsCubit,MaterialListState>(
                                        listener: (context,state){
                                          if (state is MaterialUserListSuccess) {
                                            setState(() {
                                              widget.repository.usermaterials = state.material;
                                            });
                                            widget.repository.usermaterials = state.material;
                                            // return Navigator.of(context).pop();
                                            // StartScreen(
                                            //   repository: widget.repository,
                                            // );
                                          } else if (state is MaterialListFailure) {
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
                                        builder: (context,state){
                                          if (state is MaterialListLoading){
                                            return Container(
                                              width: double.infinity,
                                              height: h * 0.06,

                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: CircularProgressIndicator()),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  gradient: LinearGradient(
                                                    colors: [Colors.lightBlueAccent, Colors.deepPurple],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    stops: [0.2, 0.8],
                                                    tileMode: TileMode.repeated,
                                                  )),
                                            );
                                          }else{
                                            return GestureDetector(
                                              onTap: () {
                                                BlocProvider.of<MaterialsCubit>(context).addMaterialList(materials![index].id,widget.repository.login!.id);
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: h * 0.06,
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: TEXT(text:"إضافة",w: w * 0.035)),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    gradient: LinearGradient(
                                                      colors: [Colors.blue, Colors.deepPurple],
                                                      begin: Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                      stops: [0.2, 0.8],
                                                      tileMode: TileMode.repeated,
                                                    )),
                                              ),
                                            );
                                          }
                                        },
                                      ),




                                    // Row(
                                    //   children: [
                                    //     Expanded(
                                    //       child: BlocConsumer<MaterialsCubit,MaterialListState>(
                                    //         listener: (context,state){
                                    //           if (state is MaterialListSuccess) {
                                    //             setState(() {
                                    //               widget.repository.materials = state.material;
                                    //             });
                                    //             widget.repository.materials = state.material;
                                    //             // return Navigator.of(context).pop();
                                    //             // StartScreen(
                                    //             //   repository: widget.repository,
                                    //             // );
                                    //           } else if (state is MaterialListFailure) {
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
                                    //           if (state is MaterialListLoading){
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
                                    //                 BlocProvider.of<MaterialsCubit>(context).deleteMaterialList(materials![index].id);
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
                                    //               builder: (context) => UpdateMaterialScreen(
                                    //                 materials: materials![index],
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
      //         builder: (context) => AddMaterial(repository:  widget.repository,),
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
    //   appBar: APPBAR(h :h,w: w,context: context,text:"Add Material"),
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
    //             TEXT(text:"اسم المادة  ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: nameController,
    //               label :"",
    //               textInputType:   TextInputType.text,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"واحدة المادة ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: unitController,
    //               label : "",
    //               textInputType:   TextInputType.text,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"تكلفة العبوة ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: priceController,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),SizedBox(
    //               height: h * 0.03,
    //             ),
    //             TEXT(text:"عدد الواحدات ",w:w*0.04),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BoxController2(
    //               controller: numController,
    //               label : "",
    //               textInputType:   TextInputType.number,
    //               h:  h,
    //               w:  w,
    //             ),
    //             SizedBox(
    //               height: h * 0.03,
    //             ),
    //             BlocConsumer<MaterialsCubit,MaterialListState>(
    //               listener: (context,state){
    //                 if (state is MaterialListSuccess) {
    //                   widget.repository.materials = state.material;
    //
    //                     Navigator.push(
    //                     context,
    //                     MaterialPageRoute(
    //                       builder: (context) => StartScreen(
    //                         repository: widget.repository,
    //                       ),
    //                     ),
    //                   );
    //                     // Navigator.of(context).pop();
    //                   // StartScreen(
    //                   //   repository: widget.repository,
    //                   // );
    //                 } else if (state is MaterialListFailure) {
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
    //                 if (state is MaterialListLoading){
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
    //                         material = Materials( material: nameController.text, unit: unitController.text, price: priceController.text, number_of_units: numController.text);
    //                         BlocProvider.of<MaterialsCubit>(context).addMaterialList(material);
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
    //                           )),
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
