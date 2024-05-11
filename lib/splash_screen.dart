import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/features/finance/presentation/manager/finance_cubit/finance_cubit.dart';
import 'package:printing_costs_2/features/finance/presentation/manager/finance_cubit/finance_state.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_state.dart';
import 'package:printing_costs_2/features/login/presentation/views/login_screen.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_state.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/user_material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/user_material_state.dart';
import 'package:printing_costs_2/features/other/presentation/manager/other_cubit/other_cubit.dart';
import 'package:printing_costs_2/features/other/presentation/manager/other_cubit/other_state.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_state.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/user_printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/user_printer_state.dart';
import 'package:printing_costs_2/splash_view_body.dart';
import 'package:printing_costs_2/srevices/repository.dart';

class SplashScreen extends StatefulWidget {
  Repository repository;
  SplashScreen({Key? key, required this.repository}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<LoginCubit>(context).fetchLogin();
  }

  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(
        //   body: SplashViewbody(repository: widget.repository,),
        // );
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state){
             if (state is LoginFailure) {
             Navigator.push(
                context,
                MaterialPageRoute(
                builder: (context) => LoginScreen(repository: widget.repository)
                ),
            );
            }
    //          if (state is LoginSuccess) {
    //            Navigator.push(
    //            context,
    // MaterialPageRoute(
    // builder: (context) => LoginScreen(repository: widget.repository)
    // ),
    // );
    //
    //          }
          },
      builder: (context, state) {
    if (state is LoginSuccess) {
      debugPrint(state.login.id.toString());
      widget.repository.login = state.login;
      return LoadFinance(repository: widget.repository,);
    }  else {
    return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
    }
            },

    );
  }
}

///load finace
class LoadFinance extends StatefulWidget {
  Repository repository ;
   LoadFinance({Key? key,required this.repository}) : super(key: key);

  @override
  _LoadFinanceState createState() => _LoadFinanceState();
}

class _LoadFinanceState extends State<LoadFinance> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FinanceCubit>(context).fetchFinanceList(widget.repository.login!.id);
  }
  @override
  Widget build(BuildContext context) {
    return
      //  Scaffold(
      //   body: SplashViewbody(repository: widget.repository,),
      // );
      BlocBuilder<FinanceCubit, FinanceListState>(
        builder: (context, state) {
          if (state is FinanceListSuccess) {
            debugPrint(state.finance.num.toString());
            widget.repository.finance = state.finance;
            return LoadOther(repository: widget.repository,);
          } else if (state is FinanceListFailure) {
            return Container(color: Colors.white, child: Align(alignment:Alignment.center,child: Text(state.errMessage)));
          } else {
            return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
          }
        },
      );
  }
}

///load other
class LoadOther extends StatefulWidget {
  Repository repository;
   LoadOther({Key? key,required this.repository}) : super(key: key);

  @override
  State<LoadOther> createState() => _LoadOtherState();
}

class _LoadOtherState extends State<LoadOther> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<OtherCubit>(context).fetchOtherList(widget.repository.login!.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtherCubit, OtherListState>(
      builder: (context, state) {
        if (state is OtherListSuccess) {
          debugPrint(state.other.toString());
          widget.repository.other = state.other;
          return LoadMaterials(repository: widget.repository);
        } else if (state is OtherListFailure) {
        return Container(color: Colors.white, child: Align(alignment:Alignment.center,child: Text(state.errMessage)));
        } else {
        return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
        }
      },
    );
  }
}
/// load materials
class LoadMaterials extends StatefulWidget {
  Repository repository;
   LoadMaterials({Key? key,required this.repository}) : super(key: key);

  @override
  _LoadMaterialsState createState() => _LoadMaterialsState();
}

class _LoadMaterialsState extends State<LoadMaterials> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MaterialsCubit>(context).fetchMaterialsList();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsCubit, MaterialListState>(
      builder: (context, state) {
        if (state is MaterialListSuccess) {
          // debugPrint(state.material.toString());
          widget.repository.materials = state.material;
          return LoadPrinters(repository: widget.repository,);
        } else if (state is MaterialListFailure) {
          return Container(color: Colors.white, child: Align(alignment:Alignment.center,child: Text(state.errMessage)));
        } else {
          return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
        }
      },
    );
  }
}

/// load printers
class LoadPrinters extends StatefulWidget {
  Repository repository ;
   LoadPrinters({Key? key, required this.repository}) : super(key: key);

  @override
  _LoadPrintersState createState() => _LoadPrintersState();
}

class _LoadPrintersState extends State<LoadPrinters> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PrintersCubit>(context).fetchPrinterList();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrintersCubit, PrinterListState>(
      builder: (context, state) {
        if (state is PrinterListSuccess) {
          // debugPrint(state.printer[0].toString());
          widget.repository.printers = state.printer;
          return LoadUserMaterials(
            repository: widget.repository,
          );
        } else if (state is PrinterListFailure) {
          return Container(color: Colors.white, child: Align(alignment:Alignment.center,child: Text(state.errMessage)));
        } else {
          return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
        }
      },
    );
  }
}

/// load user materials
class LoadUserMaterials extends StatefulWidget {
  Repository repository;
  LoadUserMaterials({Key? key,required this.repository}) : super(key: key);

  @override
  _LoadUserMaterialsState createState() => _LoadUserMaterialsState();
}

class _LoadUserMaterialsState extends State<LoadUserMaterials> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("loadusermaterila");
    BlocProvider.of<MaterialsUserCubit>(context).fetchUserMaterialsList(widget.repository.login!.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsUserCubit, MaterialUserListState>(
      // listener: (context, state) {
      //   if (state is MaterialUserListSuccess) {
      //     // debugPrint(state.material[0].toString());
      //     print("herere");
      //     widget.repository.usermaterials = state.material;
      //      LoadUserPrinters(repository: widget.repository,);
      //   }
      // },
      builder: (context, state) {
        if (state is MaterialUserListSuccessS) {
          // debugPrint(state.material[0].toString());
          print("herere");
          widget.repository.usermaterials = state.material;
          return LoadUserPrinters(repository: widget.repository,);
        } else
          if (state is MaterialUserListFailure) {
          return Container(color: Colors.white, child: Align(alignment:Alignment.center,child: Text(state.errMessage)));
        } else if (state is MaterialUserListLoading){
          return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
        } else {
          return Container();
        }
      },
    );
  }
}

/// load user printers
class LoadUserPrinters extends StatefulWidget {
  Repository repository ;
  LoadUserPrinters({Key? key, required this.repository}) : super(key: key);

  @override
  _LoadUserPrintersState createState() => _LoadUserPrintersState();
}

class _LoadUserPrintersState extends State<LoadUserPrinters> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("PPPOOOOO");
    BlocProvider.of<PrintersUserCubit>(context).fetchUserPrinterList(widget.repository.login!.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrintersUserCubit, PrinterUserListState>(
      builder: (context, state) {
        if (state is PrinterUserListSuccessS) {
          // debugPrint(state.printer[0].toString());
          widget.repository.userprinters = state.printer;
          return SplashViewbody(
            repository: widget.repository,
          );
        } else if (state is PrinterUserListFailure) {
          return Container(color: Colors.white, child: Align(alignment:Alignment.center,child: Text(state.errMessage)));
        } else if(state is PrinterUserListLoading){
          print("44444444");
          return Container(color: Colors.white,child: const SizedBox(width:25,height:25,child:Align(alignment: Alignment.center,child: CircularProgressIndicator(color: Colors.blue,))));
        }else{
          return Container();
        }
      },
    );
  }
}



