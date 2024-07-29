import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/box_controller.dart';
import 'package:printing_costs_2/core/widgets/box_controller_2.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_state.dart';
import 'package:printing_costs_2/srevices/repository.dart';

class AddMaterial extends StatefulWidget {
  Repository repository;
  AddMaterial({Key? key, required this.repository}) : super(key: key);

  @override
  _AddMaterialState createState() => _AddMaterialState();
}

class _AddMaterialState extends State<AddMaterial> {
  TextEditingController nameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController ownerController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  late Materials material;

  List<Materials>? materials;
  var select;

  @override
  Widget build(BuildContext context) {
    materials = widget.repository.materials;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: APPBAR(h: h, w: w, context: context, text: "إضافة مادة"),
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
                materials != null
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: EdgeInsets.only(
                            left: w * 0.01,
                            right: w * 0.01,
                            top: h * 0.01,
                            bottom: h * 0.01),
                        itemCount: materials!.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) =>
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
                                  padding: EdgeInsets.all(w * 0.04),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TEXT(
                                              text: " المادة : ", w: w * 0.035),
                                          TEXT(
                                              text: materials![index].brand! +
                                                  "   ",
                                              w: w * 0.04),
                                          TEXT(
                                              text: materials![index].color! +
                                                  "   ",
                                              w: w * 0.04),
                                          TEXT(
                                              text:
                                                  "${materials![index].material!}   ",
                                              w: w * 0.04),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              TEXT(
                                                  text: "تكلفة العبوة",
                                                  w: w * 0.035),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              TEXT(
                                                  text: materials![index]
                                                      .price
                                                      .toString(),
                                                  w: w * 0.035),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              TEXT(
                                                  text: "عدد الواحدات",
                                                  w: w * 0.035),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              TEXT(
                                                  text: materials![index]
                                                      .number_of_units
                                                      .toString(),
                                                  w: w * 0.035),
                                              TEXT(
                                                  text: materials![index].unit!,
                                                  w: w * 0.03),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              TEXT(
                                                  text: "تكلفة الواحدة",
                                                  w: w * 0.035),
                                              SizedBox(
                                                height: h * 0.01,
                                              ),
                                              TEXT(
                                                  text: materials![index]
                                                      .cost_per_One
                                                      .toString(),
                                                  w: w * 0.035),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.01,
                                      ),
                                      BlocConsumer<MaterialsCubit,
                                          MaterialListState>(
                                        listener: (context, state) {
                                          if (state
                                              is MaterialUserListSuccess) {
                                            setState(() {
                                              ownerController =
                                                  TextEditingController();
                                              widget.repository.usermaterials =
                                                  state.material;
                                            });
                                            widget.repository.usermaterials =
                                                state.material;
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
                                            //     builder: (context) =>
                                            //         StartScreen(
                                            //       repository: widget.repository,
                                            //     ),
                                            //   ),
                                            // );
                                            // return Navigator.of(context).pop();
                                            // StartScreen(
                                            //   repository: widget.repository,
                                            // );
                                          } else if (state
                                              is MaterialListFailure) {
                                            Flushbar(
                                              duration:
                                                  const Duration(seconds: 3),
                                              backgroundColor: Colors.white,
                                              messageColor: Colors.black,
                                              messageSize: h * 0.02,
                                              message: state.errMessage,
                                            ).show(context);
                                            // FlashBAR(message: state.errMessage,h: h,context1: context,);
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
                                            //     builder: (context) =>
                                            //         StartScreen(
                                            //       repository: widget.repository,
                                            //     ),
                                            //   ),
                                            // );
                                            // Navigator.of(context).pop();
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is MaterialListLoading &&
                                              select == index) {
                                            return Container(
                                              width: double.infinity,
                                              height: h * 0.06,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  gradient:
                                                      const LinearGradient(
                                                    colors: [
                                                      Colors.lightBlueAccent,
                                                      Colors.deepPurple
                                                    ],
                                                    begin: Alignment.bottomLeft,
                                                    end: Alignment.topRight,
                                                    stops: [0.2, 0.8],
                                                    tileMode: TileMode.repeated,
                                                  )),
                                              child: const Align(
                                                  alignment: Alignment.center,
                                                  child:
                                                      CircularProgressIndicator()),
                                            );
                                          } else {
                                            return GestureDetector(
                                              onTap: () {
                                                AwesomeDialog(
                                                  context: context,
                                                  borderSide: const BorderSide(
                                                      color: Colors.blue,
                                                      width: 2),
                                                  dialogType:
                                                      DialogType.noHeader,
                                                  showCloseIcon: true,
                                                  // desc:'اسم المالك',
                                                  body: Form(
                                                    key: formkey,
                                                    child: Column(
                                                      children: [
                                                        TEXT(
                                                            text: 'اسم المالك',
                                                            w: w * 0.035),
                                                        BoxController(
                                                          controller:
                                                              ownerController,
                                                          // label : "",
                                                          textInputType:
                                                              TextInputType
                                                                  .text,
                                                          h: h,
                                                          w: w,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  btnCancelOnPress: () {},

                                                  btnOkOnPress: () {
                                                    debugPrint("update0001");
                                                    if (formkey.currentState!
                                                            .validate() //&&
                                                        // ownerController.text !=null
                                                            ) {
                                                      setState(() {
                                                        select = index;
                                                      });
                                                      BlocProvider.of<
                                                                  MaterialsCubit>(
                                                              context)
                                                          .addMaterialList(
                                                              materials![index]
                                                                  .id,
                                                              widget.repository
                                                                  .login!.id,
                                                              ownerController
                                                                  .text);
                                                    }
                                                  },
                                                ).show();
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: h * 0.06,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    gradient:
                                                        const LinearGradient(
                                                      colors: [
                                                        Colors.blue,
                                                        Colors.deepPurple
                                                      ],
                                                      begin:
                                                          Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                      stops: [0.2, 0.8],
                                                      tileMode:
                                                          TileMode.repeated,
                                                    )),
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: TEXT(
                                                        text: "إضافة",
                                                        w: w * 0.035)),
                                              ),
                                            );
                                          }
                                        },
                                      ),
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
    );
  }
}
