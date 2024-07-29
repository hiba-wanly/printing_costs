import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/flush_bar.dart';
import 'package:printing_costs_2/core/widgets/on_preesd.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_state.dart';
import 'package:printing_costs_2/features/login/presentation/views/box_login.dart';
import 'package:printing_costs_2/splash_screen.dart';
import 'package:printing_costs_2/srevices/repository.dart';

class LoginScreen extends StatefulWidget {
  Repository repository;
   LoginScreen({Key? key,required this.repository}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool ispassword = true;
  var formkey = GlobalKey<FormState>();
  double h = 0;
  double w = 0;


  @override
  Widget build(BuildContext context) {
    h = MediaQuery
        .of(context)
        .size
        .height;
    w = MediaQuery
        .of(context)
        .size
        .width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: Form(
          key: formkey,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
              ),
               Padding(
                 padding:  EdgeInsets.all(w*0.05),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     BoxLogin(
                         controller: emailController,
                        label: 'الحساب',
                         textInputType: TextInputType.emailAddress,
                       pass: false,
                       ispassword: ispassword,
                     ),
                     SizedBox(
                       height:
                       MediaQuery.of(context).size.height * 0.02,
                     ),
                     BoxLogin(
                         controller:passwordcontroller,
                         label: 'كلمة المرور',
                         textInputType: TextInputType.visiblePassword,
                       pass: true,
                       ispassword: ispassword,
                     ),
                     SizedBox(
                       height:
                       MediaQuery.of(context).size.height * 0.02,
                     ),
                     // loginButton(repository: widget.repository,email: emailController.text,password:  passwordcontroller.text,formkey: formkey,),
                 BlocConsumer<LoginCubit, LoginState>(
                     listener: (context, state) {
                       if (state is LoginSuccess) {
                         widget.repository.login = state.login;

                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) =>
                                     LoadFinance(
                                       repository: widget.repository,
                                     )
                             )
                         );
                       }
                       if(state is LoginFailure){
                         debugPrint("kkkLoginFailure");
                         Flushbar(
                           duration: const Duration(seconds: 3),
                           backgroundColor: Colors.white,
                           messageColor: Colors.black,
                           messageSize: h * 0.02,
                           message: state.errMessage,
                         ).show(context);
                         // FlashBAR(message: state.errMessage,h: h,context1: context,);
                         // Navigator.pop(context);
                       }
                     }, builder: (context, state) {
                   if (state is LoginLoading) {
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
                           child: CircularProgressIndicator()
                       ),
                     );
                   }
                   else {
                     return InkWell(
                         onTap: () {
                           if (formkey.currentState!.validate()) {
                             BlocProvider.of<LoginCubit>(context).fetchLoginData(
                                 {
                                   'email':emailController.text,
                                   'password':passwordcontroller.text
                                 });
                           }
                         },
                         child:ONPreesd(h:h,w:w,string: "تسجيل دخول",)
                     );
                   }
                 }
                 ),
                   ],
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}
