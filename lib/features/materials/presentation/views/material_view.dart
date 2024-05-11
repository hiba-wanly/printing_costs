import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_state.dart';
import 'package:printing_costs_2/features/materials/presentation/views/add_material.dart';
import 'package:printing_costs_2/features/materials/presentation/views/update_material.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class MaterialView extends StatefulWidget {
  Repository repository;
    MaterialView({Key? key,required this.repository}) : super(key: key);

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  TextEditingController materialController = TextEditingController();


  List<UserMaterials>? usermaterials ;

  @override
  Widget build(BuildContext context) {
    usermaterials = widget.repository.usermaterials;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  APPBAR(h:h,w: w,context: context,text: "المواد"),
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
                usermaterials != null ?
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(
                      left: w * 0.01, right: w * 0.01, top: h * 0.01,bottom: h * 0.01),
                  itemCount: usermaterials!.length,
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
                                        TEXT(text: "المادة : " ,w:w*0.035),

                                        TEXT(text:usermaterials![index].brand! +"   ",w:w*0.04),
                                        TEXT(text:usermaterials![index].color! +"   ",w:w*0.04),
                                        TEXT(text:"${usermaterials![index].material!}   ",w:w*0.04),
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
                                            TEXT(text:usermaterials![index].price.toString(),w:w*0.035),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            TEXT(text:"عدد الواحدات",w:w*0.035),
                                            SizedBox(height: h*0.01,),
                                            TEXT(text:usermaterials![index].number_of_units.toString(),w:w*0.035),
                                            TEXT(text:usermaterials![index].unit!,w:w*0.03),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            TEXT(text:"تكلفة الواحدة",w:w*0.035),
                                            SizedBox(height: h*0.01,),
                                            TEXT(text:usermaterials![index].cost_per_One.toString(),w:w*0.035),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: h*0.01,),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: BlocConsumer<MaterialsCubit,MaterialListState>(
                                            listener: (context,state){
                                              if (state is MaterialUserListSuccess) {
                                                setState(() {
                                                  widget.repository.usermaterials = state.material;
                                                });
                                                widget.repository.usermaterials = state.material;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => StartScreen(
                                                      repository: widget.repository,
                                                    ),
                                                  ),
                                                );
                                                // return Navigator.of(context).pop();
                                                // StartScreen(
                                                //   repository: widget.repository,
                                                // );
                                              } else if (state is MaterialListFailure) {
                                                FlashBAR(message: state.errMessage,h: h,context1: context,);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => StartScreen(
                                                      repository: widget.repository,
                                                    ),
                                                  ),
                                                );
                                                // Navigator.of(context).pop();

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
                                                    BlocProvider.of<MaterialsCubit>(context).deleteMaterialList(usermaterials![index].id,widget.repository.login!.id);
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
                                                  builder: (context) => UpdateMaterialScreen(
                                                    materials: usermaterials![index],
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
              builder: (context) => AddMaterial(repository:  widget.repository,),
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
