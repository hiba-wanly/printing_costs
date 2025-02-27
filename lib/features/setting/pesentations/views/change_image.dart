import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:printing_costs_2/core/widgets/app_bar.dart';
import 'package:printing_costs_2/core/widgets/on_preesd.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_state.dart';
import 'package:printing_costs_2/splash_view_body.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class ChangeImage extends StatefulWidget {
  Repository repository;
   ChangeImage({Key? key, required this.repository}) : super(key: key);

  @override
  _ChangeImageState createState() => _ChangeImageState();
}

class _ChangeImageState extends State<ChangeImage> {

  late File image;

  final Picker =ImagePicker();

  Future getImage(ImageSource src) async{
    final PickedFile = await Picker.pickImage(source: src);
    setState(() {
      if (PickedFile!=null)
      {
        image = File(PickedFile.path);
        print("image loaded");
      }
      else {
        print("Could not get image");
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:  APPBAR(h:h,w: w,context: context,text: "تعديل الصورة"),
        resizeToAvoidBottomInset: true,
        extendBodyBehindAppBar: true,
        body: Padding(
        padding:
        EdgeInsets.only(left: w * 0.02, right: w * 0.02, top: h * 0.17),
     child: Column(
       // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: h * 0.15,
          width: w * 0.3,
          child: MaterialButton(
            child: Icon(Icons.add),
            onPressed: (){
              showDialog(context: context, builder: (BuildContext context){
                return AlertDialog(
                  title: Text(
                    'إضافة او تعديل الصورة',
                  ),
                  content: Container(height :150,color: Colors.white,child:
                  Column(children: [
                    Container(color:Colors.blue,child: ListTile(leading: const Icon(Icons.image),
                      title: Text(
                        'المعرض',
                      ),onTap: ()
                      {
                        getImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },),),
                    const SizedBox(height: 30,),
                    Container(color: Colors.blue,child: ListTile(leading: const Icon(Icons.add_a_photo),
                      title: Text(
                        'الكاميرا',
                      ),onTap: (){
                        getImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },),),
                  ],)),);});
            },
          ),
        ),
        // SizedBox(
        //   height: h * 0.150,
        //   width: w * 0.3,
        //   child:
    BlocConsumer<LoginCubit, LoginState>(
    listener: (context, state) {
    if (state is LoginSuccess) {
      // setState(() {
        widget.repository.login= state.login;
      // });

    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>
    SplashViewbody(
    repository: widget.repository,
    )
    )
    );
    }
    }, builder: (context, state) {
    if (state is LoginLoading) {
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
    return
    InkWell(
    onTap: () {
    BlocProvider.of<LoginCubit>(context).changeImage(image,23);},
    child:ONPreesd(h:h,w:w,string: "تعديل",)
    );
    }
    }
    ),
        // ),
      ],
    )
        )
    );
  }
}
