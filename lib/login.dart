import 'package:api_login_signup/bloc_login_signup/login/login_bloc.dart';
import 'package:api_login_signup/bloc_login_signup/login/login_event.dart';
import 'package:api_login_signup/bloc_login_signup/login/login_state.dart';
import 'package:api_login_signup/models/loginmodel/LoginReqModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenState extends StatefulWidget {
  const LoginScreenState({super.key});

  @override
  State<LoginScreenState> createState() => LoginScreenStateState();
}

class LoginScreenStateState extends State<LoginScreenState> {
  TextEditingController usernamecontroler=TextEditingController();
  TextEditingController passwordcontroler=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: BlocBuilder<LoginBlocCode,LoginState>(
      builder: (BuildContext context,state){
        if(state is LoginInitialState){
          return Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Login Here",style:TextStyle(fontSize: 35,color: Colors.blue,fontWeight: FontWeight.bold) ,),
              Text("Welcome back",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                      ,Image.asset("assets/images/man.png",width: 200,height: 200,)
          
            ,Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  
                  SizedBox(
                    width: 350,
                    child: TextField(
                       controller: usernamecontroler,
              // obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'UserName',
              ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    child: TextField(
                                 controller: passwordcontroler,
                
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                suffixIcon: Icon(Icons.remove_red_eye_outlined)
              ),
                    ),
              
                  ),
                  Align(
                    
                    alignment: Alignment.topRight,
                    child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text("Forget Password?",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                    ))
              ,
              Container(
                    width: 250,
                    height: 50,
              child: ElevatedButton(onPressed: (){
                
                BlocProvider.of<LoginBlocCode>(context).add(
          LoginReqEvent(loginReqModel: LoginReqModel(
                username: usernamecontroler.text,
                password: passwordcontroler.text
                )));
                
                
                
                
              }, child: 
              Text("Login",style: TextStyle(color: Colors.white),)
              ,style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 43, 116),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))
                    ),),
                    ),
                    Text("Don't have Account")
                ],),
              ),
            )
            
            ],
          ),
        ),
      );
    
        }

else if(state is LoginLoadingState){
return Center( child: CircularProgressIndicator(),);
}
else if(state is LoginLoadedState){
return Center(child: Column(
  children: [
    Text("Token",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
    Padding(
      padding: const EdgeInsets.all(25),
      child: Text(state.loginResModel?.token??"".toString()),
    ),
  ],
),);
}
else if(state is LoginErrorState){
  return Center(child: Text(state.ErrorMsg.toString()),);
}



        else{
          return Container();
        }
      },
      
    ));
  }
}