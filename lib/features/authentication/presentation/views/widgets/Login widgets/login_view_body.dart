import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nectar/core/models/toast_states.dart';
import '../../../../../../core/widgets/custom_toast_text.dart';
import '../../../manager/cubit/login_cubit.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneControlar = TextEditingController();
    TextEditingController passwordControlar = TextEditingController();
    var formkey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccesState) {
            customToastText(
                toastMessage: 'successful logged', state: ToastStates.success);
          } else if (state is LoginErrorState) {
            customToastText(
                toastMessage: 'please enter correct data',
                state: ToastStates.error);
          }
        },
        builder: (context, state) {
          var loginCubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 20),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.098,
                    ),
                    /*Center(
                      child: DefoltSvgImage(
                          image: 'assets/images/Tabor_Horsintal.svg',
                          width: MediaQuery.of(context).size.width - 100,
                          hight: MediaQuery.of(context).size.height * 0.128),
                    ),*/
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    /*Center(
                      child: specialtext(
                        text: "مرحباََ بعودتك",
                        fsize: 28,
                        talign: TextAlign.center,
                        fweight: FontWeight.w500,
                        fcolor: const Color(0xff009c7b),
                      ),
                    ),*/
                    /*SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),*/
                    Padding(
                      padding: const EdgeInsets.only(right: 32, left: 32),
                      child: defaultFormField2(
                        width: double.infinity,
                        controller: phoneControlar,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value == null || value.isEmpty) {
                            showToast(
                                text: 'الرجاء ادخال رقم الهاتف',
                                state: toastStates.ERROR);
                            return '';
                          }
                          if (value.length != 11) {
                            showToast(
                                text: 'يجب ان يحتوى رقم الهاتف على 11 رقم',
                                state: toastStates.WARNING);
                            return '';
                          }
                          if (!value.startsWith('01')) {
                            showToast(
                                text: ' يجب ان يبدا الرقم ب 01 ',
                                state: toastStates.WARNING);
                            return '';
                          } else {
                            return null;
                          }
                        },
                        label: '  رقم الهاتف',
                        fcolor: const Color(0xff161616),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 32, left: 32, top: 16, bottom: 20),
                      child: defaultFormField2(
                          width: double.infinity,
                          controller: passwordControlar,
                          type: TextInputType.visiblePassword,
                          suffix: loginCubit.isPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixPressed: (() {
                            loginCubit.changePasswordVisabilty();
                          }),
                          validate: (value) {
                            if (value == null || value.isEmpty) {
                              showToast(
                                  text: ' الرجاء ادخال كلمة المرور',
                                  state: toastStates.ERROR);
                              return '';
                            }
                            return null;
                          },
                          label: ' كلمة المرور',
                          fcolor: const Color(0xff161616),
                          isPassword: loginCubit.isPassword),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: loginCubit.isChecked,
                          onChanged: (value) {
                            loginCubit.changeCheckBox();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          side: MaterialStateBorderSide.resolveWith(
                              ((states) => const BorderSide(
                                    color: Color(0xff009c7b),
                                  ))),
                        ),
                        const Opacity(
                          opacity: 0.5,
                          child: Text("تذكرنى",
                              style: TextStyle(
                                  color: Color(0xff161616),
                                  fontWeight: FontWeight.w400,
                                  fontFamily: "ReadexPro",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 14.0),
                              textAlign: TextAlign.right),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.07,
                        ),
                        DefoltTextButton(
                            function: () {
                              NavigateTo(context, const PhoneScreen());
                            },
                            text: "هل نسيت كلمة المرور؟",
                            direction: TextAlign.left),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    Center(
                      child: ConditionalBuilder(
                        condition: state is! LogInLoadingState,
                        builder: (context) {
                          return MaterialButton(
                            color: const Color(0xff009c7b),
                            minWidth: MediaQuery.of(context).size.width - 70,
                            height: 48,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: () {
                              if (formkey.currentState!.validate()) {
                                loginCubit.userLogin(
                                    phoneNumber: phoneControlar.text,
                                    password: passwordControlar.text);
                              }
                            },
                            child: const Text(" تسجيل الدخول",
                                style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "ReadexPro",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18.0),
                                textAlign: TextAlign.center),
                          );
                        },
                        fallback: (context) =>
                            const CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.037,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: 0.20000000298023224,
                            child: Container(
                                width: 70,
                                height: 2,
                                decoration: const BoxDecoration(
                                    color: Color(0xff161616))),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Opacity(
                            opacity: 0.699999988079071,
                            child: Text("او التسجيل بأستخدام",
                                style: TextStyle(
                                    color: Color(0xff161616),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "ReadexPro",
                                    fontStyle: FontStyle.normal,
                                    fontSize: 14.0),
                                textAlign: TextAlign.center),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Opacity(
                            opacity: 0.20000000298023224,
                            child: Container(
                                width: 70,
                                height: 2,
                                decoration: const BoxDecoration(
                                    color: Color(0xff161616))),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.028,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefoltSvgImage(
                            image: 'assets/images/facbook.svg',
                            width: 35.8,
                            hight: 35.8),
                        const SizedBox(
                          width: 61,
                        ),
                        DefoltSvgImage(
                            image: 'assets/images/Googel.svg',
                            width: 35.8,
                            hight: 35.8),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
