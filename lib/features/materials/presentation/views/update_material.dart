import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/box_controller_2.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_state.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class UpdateMaterialScreen extends StatefulWidget {
  UserMaterials materials;
  Repository repository;
   UpdateMaterialScreen({Key? key,required this.materials,required this.repository}) : super(key: key);

  @override
  _UpdateMaterialScreenState createState() => _UpdateMaterialScreenState();
}

class _UpdateMaterialScreenState extends State<UpdateMaterialScreen>  {

  TextEditingController nameController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController numController = TextEditingController();

  TextEditingController colorController = TextEditingController();
  TextEditingController brandController = TextEditingController();


  late UserMaterials material;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: APPBAR(h :h,w: w,context: context,text:"تعديل المادة"),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Padding(
          padding:
          EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TEXT(text:"نوع المادة  ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: nameController,
                label :widget.materials != null ? widget.materials.material.toString() : "",
                textInputType:   TextInputType.text,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"اللون",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: colorController,
                label :widget.materials != null ? widget.materials.color.toString() : "",
                textInputType:   TextInputType.text,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"الشركة ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: brandController,
                label :widget.materials != null ? widget.materials.brand.toString() : "",
                textInputType:   TextInputType.text,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"واحدة المادة ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: unitController,
                label : widget.materials != null ? widget.materials.unit.toString() : "",
                textInputType:   TextInputType.text,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"تكلفة العبوة",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: priceController,
                label : widget.materials != null ? widget.materials.price.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),SizedBox(
                height: h * 0.03,
              ),
              TEXT(text:"عدد الواحدات ",w:w*0.04),
              SizedBox(
                height: h * 0.03,
              ),
              BoxController2(
                controller: numController,
                label : widget.materials != null ? widget.materials.number_of_units.toString() : "",
                textInputType:   TextInputType.number,
                h:  h,
                w:  w,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              BlocConsumer<MaterialsCubit,MaterialListState>(
                listener: (context,state){
                  if (state is MaterialUserListSuccess) {
                    widget.repository.usermaterials = state.material;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartScreen(
                          repository: widget.repository,
                        ),
                      ),
                    );
                    // Navigator.of(context).pop();
                    // StartScreen(
                    //   repository: widget.repository,
                    // );
                  } else if (state is MaterialListFailure) {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => StartScreen(
                    //       repository: widget.repository,
                    //     ),
                    //   ),
                    // );
                    // Navigator.of(context).pop();
                    FlashBAR(message: state.errMessage,h: h,context1: context,);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StartScreen(
                          repository: widget.repository,
                        ),
                      ),
                    );
                  }
                },
                builder: (context,state){
                  if (state is MaterialListLoading){
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
                          material = UserMaterials(
                              material: nameController != null ? nameController.text : material.material,
                              unit:unitController!= null ?  unitController.text : material.unit,
                              price:priceController != null ? priceController.text :material.price,
                              number_of_units:numController != null ? numController.text : material.number_of_units,
                            color: colorController != null ? colorController.text : material.color,
                            brand: brandController != null ? brandController.text : material.brand,
                          );
                          BlocProvider.of<MaterialsCubit>(context).updateMaterialList(material, widget.materials.id,widget.repository.login!.id);
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
