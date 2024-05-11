import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:printing_costs_2/core/widgets/on_preesd.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_state.dart';
import 'package:printing_costs_2/splash_view_body.dart';
import 'package:printing_costs_2/srevices/repository.dart';
class loginButton extends StatelessWidget {
  Repository repository ;
  String email;
  String password;
  var formkey;
   loginButton({Key? key,required this.repository, required this.email, required this.password, required this.formkey}) : super(key: key);

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
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            repository.login= state.login;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SplashViewbody(
                        repository: repository,
                      )
              )
            );
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
                  'email':email,
                  'password':password
                });
            }
          },
          child:ONPreesd(h:h,w:w,string: "تسجيل دخول",)
        );
      }
    }
    );
  }
}
