import 'package:api_login_signup/bloc_login_signup/signup/signup_bloc.dart';
import 'package:api_login_signup/bloc_login_signup/signup/signup_event.dart';
import 'package:api_login_signup/bloc_login_signup/signup/signup_state.dart';
import 'package:api_login_signup/login.dart';
import 'package:api_login_signup/models/register/RegisterReqModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernamecontroler=TextEditingController();
  TextEditingController passwordcontroler=TextEditingController();
    TextEditingController confirmpasswordcontroler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    body: BlocBuilder<RegisterBloc,RegisterState>(
      builder:(BuildContext context,state){
        if(state is RegisterInitialState){
          return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            
            children: [
              Text("Create Account",style:TextStyle(fontSize: 35,color: Colors.blue,fontWeight: FontWeight.bold) ,),
              Text("Create Account so you can exprole a exiting jobs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
            ,Image.asset("assets/images/reg.png",width: 200,height: 200,)
            ,Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                height: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  
                  SizedBox(
                    width: 350,
                    child: TextField(
              controller: usernamecontroler,
          
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'UserName',
              ),
                    ),
                  ),SizedBox(
                    width: 350,
                    child: TextField(
              controller:  passwordcontroler,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
                    ),
              
                  ),SizedBox(
                    width: 350,
                    child: TextField(
                      controller: confirmpasswordcontroler,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Confirm Passoword',
              ),
                    ),
              
                  ),
                
              Container(
                    width: 250,
                    height: 50,
              child: ElevatedButton(onPressed: (){
          
          if(passwordcontroler.text == confirmpasswordcontroler.text){
            BlocProvider.of<RegisterBloc>(context).add(
          RegisterReqEvent(registerReqModel:RegisterReqModel(email: usernamecontroler.text,
          password: passwordcontroler.text
          )
          
          )
          );
          }else{
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Passwords do not match')),
                );
          }
          
          
          
          
          
          
          
              }, child: 
              Text("Register",style: TextStyle(color: Colors.white),)
              ,style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 43, 116),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))
                    ),),
                    ),
                    Text(" Already have  an Account")
                ],),
              ),
            )
            
            ],
          ),
        ),
      ),
    );
        }
         else if(state is RegisterLodingState){
          return Center(child: CircularProgressIndicator(),);

         }else if(state is RegisterLoadedState){
return Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("Account Created Successfully",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      Container(
      width: 150,
      height: 50,
        child: ElevatedButton(onPressed: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreenState()),
            );}, child: 
        Text("Register",style: TextStyle(color: Colors.white),)
        ,style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 43, 116),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(7)))
              ),),
      )
    ],
  ),
);
         }
         else if(state is RegisterErrorState){
            return Center(child: Text(state.ErrorMsg.toString()),);


         }
      
        else{
          return Container();
        }
      }
      
      
      
      
      
      
      )
    );
  }
}