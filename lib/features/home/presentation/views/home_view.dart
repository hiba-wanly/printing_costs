import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:printing_costs_2/core/utils/app_router.dart';
import 'package:printing_costs_2/core/widgets/box_controller.dart';
import 'package:printing_costs_2/core/widgets/text_style.dart';
import 'package:printing_costs_2/features/home/presentation/views/start_screen.dart';
import 'package:printing_costs_2/features/home/presentation/views/total_costs.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_state.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_state.dart';
import 'package:printing_costs_2/srevices/repository.dart';

class HomeView extends StatefulWidget {
  Repository repository;

   HomeView({
    Key? key,required this.repository
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Loading();
    BlocProvider.of<MaterialsCubit>(context).fetchMaterialsList();
    BlocProvider.of<PrintersCubit>(context).fetchPrinterList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialsCubit, MaterialListState>(
      builder: (context, state) {
        if (state is MaterialListSuccess) {
          List<Materials>? materials = state.material;
          BlocBuilder<PrintersCubit, PrinterListState>(
            builder: (context, state) {
              if (state is PrinterListSuccess) {
                List<Printers>? printers = state.printer;
                return Container();
                //   StartScreen(
                //   materials: materials,
                //   printers: printers,
                // );
              } else if (state is PrinterListFailure) {
                return Text(state.errMessage);
              } else {
                return CircularProgressIndicator();
              }
            },
          );
          return Container();
          //   StartScreen(
          //   materials: materials,
          //   printers: [],
          // );
        } else if (state is MaterialListFailure) {
          return Text(state.errMessage);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
