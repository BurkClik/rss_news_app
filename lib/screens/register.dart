import 'package:flutter/material.dart';
import 'package:multicamp_news_app/components/custom_flat_icon_button.dart';
import 'package:multicamp_news_app/components/custom_raised_button.dart';
import 'package:multicamp_news_app/components/sign_input.dart';
import 'package:multicamp_news_app/screens/home.dart';
import 'package:multicamp_news_app/services/auth_service.dart';
import 'package:multicamp_news_app/theme/constants.dart';
import 'package:multicamp_news_app/theme/size_config.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  static String routeName = '/register';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hesap Oluştur,', style: kWelcomeText),
              Text('Başlamak için kayıt olun!', style: kWelcomeHintText),
              SizedBox(height: getProportionateScreenHeight(100.0)),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
/*                     SignInputArea(
                      labelText: 'İsim Soyisim',
                      prefixIcon: Icon(Icons.person),
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      textEditingController: nameController,
                    ),
                    SizedBox(height: getProportionateScreenHeight(20.0)), */
                    SignInputArea(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail),
                      textInputType: TextInputType.emailAddress,
                      textEditingController: emailController,
                    ),
                    SizedBox(height: getProportionateScreenHeight(20.0)),
                    SignInputArea(
                      labelText: 'Parola',
                      prefixIcon: Icon(Icons.lock),
                      obsecure: true,
                      textEditingController: passwordController,
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(40)),
              CustomRaisedButton(
                text: 'Kayıt',
                onPressed: () async {
                  try {
                    await context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: emailController.text.trim(),
                        );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  } catch (e) {}
                },
              ),
              SizedBox(height: getProportionateScreenHeight(12)),
              CustomFlatIconButton(
                wordThree: 'kayıt ',
                wordFour: 'ol',
                onPressed: () {
                  print('Google');
                },
              ),
              SizedBox(height: getProportionateScreenHeight(120.0)),
              Container(
                width: getProportionateScreenWidth(308.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Zaten bir hesabım var. ',
                      style: kSignHintText,
                    ),
                    InkWell(
                      child: Text(
                        'Giriş Yap',
                        style: kSignAuthHintText,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
