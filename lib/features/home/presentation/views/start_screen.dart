import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:printing_costs_2/core/utils/app_router.dart';
import 'package:printing_costs_2/core/utils/assets.dart';
import 'package:printing_costs_2/core/widgets/box_controller.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/on_preesd.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/finance/presentation/views/finance_view.dart';
import 'package:printing_costs_2/features/home/data/models/home.dart';
import 'package:printing_costs_2/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:printing_costs_2/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:printing_costs_2/features/home/presentation/views/total_costs.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/presentation/views/material_view.dart';
import 'package:printing_costs_2/features/other/presentation/views/other_view.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/presentation/views/printers_view.dart';
import 'package:printing_costs_2/features/setting/pesentations/views/change_image.dart';
import 'package:printing_costs_2/features/setting/pesentations/views/setting_view.dart';
import 'package:printing_costs_2/srevices/repository.dart';


class StartScreen extends StatefulWidget {
  Repository repository;
  // List<Materials>? materials;
  // List<Printers>? printers;
   StartScreen({Key? key,required this.repository}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
{
  int? selectprinter;
  int? selectmaterial;

  var printers2;
  var materials2;
  var orderTypeList;

  List<String> OrderList = [
    "عرض فاتورة",
    "عرض سعر"
  ];

  TextEditingController sizeController = new TextEditingController();
  TextEditingController timeController = new TextEditingController();
  TextEditingController projectController = new TextEditingController();
  TextEditingController personController = new TextEditingController();


  late Home home;


  DateTime now = DateTime.now();
  String? formattedDate;

  Login? login;

  List<UserMaterials>? materials;
  List<UserPrinters>? printers;

  UserPrinters? selectprinterPP;
  UserMaterials? selectmaterialMM;

  String? orderType;
 String? selectedOrder;
  String totalcost = '';
  String totalcost11 = '0000';

  final GlobalKey<ScaffoldState> _sKey = GlobalKey();

  var formkey = GlobalKey<FormState>();


  void totalPrice(){
    int? kk =  TotoalCosts.totalCost(
      // printers![selectprinter!-1],
        selectprinterPP,
      // materials![selectmaterial!-2],
        selectmaterialMM,
      timeController.text,
      sizeController.text,
      widget.repository.check1!,
      widget.repository.check2!,
        widget.repository
    );
    // kk.then((value) {
      if(kk != null){
        setState(() {
          totalcost11 = kk.toString();
        });
      }
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Loading();
  }


  @override
  Widget build(BuildContext context) {
    login = widget.repository.login;
    debugPrint("777777788888888888");
    debugPrint(login!.first_name!.toString());
    materials = widget.repository.usermaterials;
    debugPrint(materials.toString());
    printers = widget.repository.userprinters;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    formattedDate = DateFormat('yyyy-MM-dd').format(now);
    printers2 = widget.repository.userprinters
        ?.map((e) => DropdownMenuItem<int>(
      value: e.id,
      child: TEXT(text:e.printer_name!,w: w * 0.035),
    ))
        .toList();
    materials2 = widget.repository.usermaterials
        ?.map((e) => DropdownMenuItem<int>(
      value: e.id,
      child: TEXT(text:e.material!,w: w * 0.035),
    ))
        .toList();
    orderTypeList = OrderList.map((e) => DropdownMenuItem<String>(
      value: e,
      child: TEXT(text:e,w: w * 0.035),
    )
    ).toList();
    return Scaffold(
      backgroundColor: Colors.white,
      key: _sKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            padding: EdgeInsets.only(top: h * 0.02),
            onPressed: () {
              _sKey.currentState?.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
              size: w * 0.06,
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: Container(
        color: Colors.white,
        height: h,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1,
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [

                      // login!.imagepath! != null ?
                      FadeInImage(
                        image:  NetworkImage(login!.imagepath!,),
                        placeholder: AssetImage(AssetsData.image2),
                        imageErrorBuilder:  (context, error, stackTrace){
                          return Image.asset(AssetsData.image2);
                        },
                        height: h * 0.15,
                        // width: w * 0.1,
                        fit: BoxFit.fill,
                      ) ,
                      //     : Container(
                      //   height: h * 0.15,
                      //   // width: w * 0.1,
                      // ),
                      // Image(
                      //   image: AssetImage(AssetsData.image2),
                      //   height: h * 0.15,
                      //   // width: w * 0.1,
                      //   fit: BoxFit.fill,
                      // ),.
                    // ],
                  // ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TEXT(text:"تكاليف طباعة ثلاثية الأبعاد",w: w * 0.035),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: w*0.03),
                          child: BoxController(controller:personController,h: h,w: w*0.7,textInputType: TextInputType.text)),
                      TEXT(text:"* الجهة ",w: w * 0.035),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: w*0.03),
                          child: BoxController(controller:projectController,h: h,w: w*0.7,textInputType: TextInputType.text)),
                      TEXT(text:"* المشروع ",w: w * 0.035),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.05,
                        // margin: const EdgeInsets.all(10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            alignment: Alignment.centerRight,
                            isExpanded: true,
                            hint: TEXT(text:"اختر طابعة",w: w * 0.035),
                            items: printers2,
                            value: selectprinter,
                            onChanged: (value) {
                              setState(() {
                                selectprinter = value;
                                selectprinterPP = printers!.firstWhere((element) => element.id == selectprinter);
                                print(selectprinterPP.toString());
                                print(selectprinterPP!.printer_name.toString());
                              });
                              print(selectprinter);
                            },
                            buttonStyleData: ButtonStyleData(
                              height: MediaQuery.of(context).size.height * 0.02,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.02,
                                  right:
                                  MediaQuery.of(context).size.width * 0.02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                          ),
                        ),
                      ),
                      TEXT(text:"الطابعة",w: w * 0.035),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        height: MediaQuery.of(context).size.height * 0.05,
                        // margin: const EdgeInsets.all(10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            alignment: Alignment.centerRight,
                            isExpanded: true,
                            hint: TEXT(text: "اختر المادة",w: w * 0.035),
                            items: materials2,
                            value: selectmaterial,
                            onChanged: (value) {
                              setState(() {
                                selectmaterial = value;
                                selectmaterialMM = materials!.firstWhere((element) => element.id == selectmaterial);
                                print(selectmaterialMM.toString());
                                print(selectmaterialMM!.material.toString());
                              });
                              print(selectmaterial);
                            },
                            buttonStyleData: ButtonStyleData(
                              height: MediaQuery.of(context).size.height * 0.02,
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.02,
                                  right:
                                  MediaQuery.of(context).size.width * 0.02),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                          ),
                        ),
                      ),
                      TEXT(text:"المادة",w: w * 0.035),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  //---------

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TEXT(text:
                      selectmaterial != null
                          ? materials!.firstWhere((element) => element.id == selectmaterial).unit.toString()
                      // materials![selectmaterial! - 2].unit!.
                          : "g",
                          w: w * 0.035),
                      Container(
                        // width: w*0.3,
                          margin: EdgeInsets.only(left: w*0.1),
                          child: BoxController(controller:sizeController,h: h,w: w*0.3,textInputType: TextInputType.number)),
                      TEXT(text:"الكمية المستهلكة",w: w * 0.035),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TEXT(text:"ساعة",w: w * 0.035),
                      Container(
                          margin: EdgeInsets.only(right: w*0.03),
                          child: BoxController(controller:timeController,h: h,w: w*0.3,textInputType: TextInputType.number)),
                      TEXT(text:"زمن الطباعة",w: w * 0.035),
                    ],
                  ),
                  //---------

                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  BlocConsumer<HomeCubit, HomeState>(
                      builder: (context,state){
                        if(state is HomeLoading){
                          return Container(
                            width: double.infinity,
                            height: h * 0.06,

                            child: Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator()
                            ),
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
                        }
                        else {
                          return  Container(
                            width: MediaQuery.of(context).size.width ,
                            height: MediaQuery.of(context).size.height * 0.05,
                            // margin: const EdgeInsets.all(10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                alignment: Alignment.centerRight,
                                isExpanded: true,
                                hint: TEXT(text: "تكلفة الحساب",w: w * 0.035),
                                items: orderTypeList,
                                value: selectedOrder,
                                onChanged: (value) {
                                  if(formkey.currentState!.validate() && selectmaterialMM != null && selectprinterPP != null){
                                    setState(() {
                                      selectedOrder = value;
                                    });
                                    totalPrice();
                                    home = Home(
                                      username: widget.repository.login!.first_name!,
                                      userid: widget.repository.login!.id,
                                      toperson: personController.text,
                                      project: projectController.text,
                                      printer: selectprinterPP!.printer_name!,
                                      time: timeController.text,
                                      material: selectmaterialMM!.material,
                                      quantity: sizeController.text,
                                      price_or_order: selectedOrder,
                                      date: formattedDate.toString(),
                                      total_price: totalcost11,
                                      finance: widget.repository.finance!.num,
                                      supervisor: widget.repository!.check1! ,
                                      membership: widget.repository!.check2!,
                                      gain: widget.repository!.other!.cost_gain,
                                      risk: widget.repository!.other!.cost_risk,
                                    );
                                    BlocProvider.of<HomeCubit>(context).fetchHome(home);
                                    debugPrint(selectedOrder);
                                }

                                },
                                buttonStyleData: ButtonStyleData(

                                  height: MediaQuery.of(context).size.height * 0.02,
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width * 0.02,
                                      right:
                                      MediaQuery.of(context).size.width * 0.02),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.black26,
                                    ),
                                    color: Colors.white,
                                  ),
                                  elevation: 2,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      listener: (context, state){
                        if(state is HomeSuccess){
                          setState(() {
                            totalcost = totalcost11;
                          });
                        }
                        else if (state is HomeFailure){
                          FlashBAR(
                            message: state.errMessage, h: h,context1: context,
                          );
                        }
                      }
                  ),





                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TEXT(text:"ل.س",w: w * 0.035),
                      TEXT(text:totalcost,w: w * 0.035),
                      TEXT(text:"تكلفة الطباعة",w: w * 0.035),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TEXT(text:formattedDate!,w: w * 0.035),
                      TEXT(text:"التاريخ",w: w * 0.035),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
                  children: [
                    widget.repository.login!.imagepath! != null ?
                FadeInImage(
                image:  NetworkImage(widget.repository.login!.imagepath!,),
              placeholder: AssetImage(AssetsData.image2),
              imageErrorBuilder:  (context, error, stackTrace){
                return Image.asset(AssetsData.image2);
              },
              height: h * 0.15,
              width: w * 0.3,
              fit: BoxFit.fill,
            )
             : Container(),

                    // Image(
                    //   image: AssetImage(AssetsData.image2),
                    //   height: h * 0.15,
                    //   width: w * 0.3,
                    //   fit: BoxFit.fill,
                    // ),
                  ],
                )),
            ListTile(
              title: TEXT(text:"الصورة",w: w * 0.035),
              onTap: () {
                // GoRouter.of(context).push(AppRouter.kSetting);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeImage(
                      repository: widget.repository,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: TEXT(text:"الأعدادات",w: w * 0.035),
              onTap: () {
                // GoRouter.of(context).push(AppRouter.kSetting);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingView(
                      repository: widget.repository,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: TEXT(text:"الطابعات", w:w * 0.035),
              onTap: () {
                // GoRouter.of(context).push(AppRouter.kPrinters);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrintersView(
                      repository: widget.repository,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: TEXT(text:"المواد", w:w * 0.035),
              onTap: () {
                // GoRouter.of(context).push(AppRouter.kMaterial);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaterialView(
                      repository: widget.repository,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: TEXT(text:"أخرى", w:w * 0.035),
              onTap: () {
                // GoRouter.of(context).push(AppRouter.kOther);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtherView(
                      repository: widget.repository,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: TEXT(text:"المالية",w: w * 0.035),
              onTap: () {
                // GoRouter.of(context).push(AppRouter.kFinance);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FinanceView(
                      repository: widget.repository,
                    ),
                  ),
                );
              },
            ),
            // ListTile(
            //   title: TEXT(text:"Change File",w: w * 0.035),
            //   onTap: () {
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(
            //     //     builder: (context) => LoadFileScreen(
            //     //       repository: widget.repository,
            //     //     ),
            //     //   ),
            //     // );
            //   },
            // ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   highlightElevation: 0.5,
      //   disabledElevation: 0.5,
      //   onPressed: (){
      //     totalPrice();
      //   },
      //   child: Icon(
      //       Icons.add
      //   ),
      //   backgroundColor: Color(0xff4f8ea8),
      // ),
    );
  }
}
