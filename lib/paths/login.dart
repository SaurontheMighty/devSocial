import 'package:devsocial/paths/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  
}
//aaaa
class _LoginState extends State<Login> {
 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
              height: 80,
            ),
            Image.asset('insert good logo'),
            SizedBox(
              height: 40,
            ),
            Text('Login',
            style: TextStyle(fontSize: 40, color: Colors.red),
            )
              ],
            ),
            SizedBox(height: 70), 
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(fontSize: 20),
              )
            ),
             SizedBox(height: 25), 
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(fontSize: 20),
              )
            ),
            SizedBox(height: 30),
            FlatButton(onPressed: (){onClickGitHubLoginButton();}
            , child: 
            Text(
              "Github"
            ),
            color: Colors.blue,),
            SizedBox(height: 30),
            FlatButton(onPressed: (){ signInWithGoogle().whenComplete(() {
              if(data.email != null){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return Home();
          },
        ),
      );
            }else{
              print("error");
            }
    });}
            , child: 
            Text(
              "Google"
            ),
            color: Colors.red,),
          ],
        ),
      ),
      
    );
  }
}

class data{
  static String email;
  static String image;

}
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle() async {
  
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  data.image = user.photoUrl.toString();
  print(user.email);
  data.email = user.email.toString();
  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}







void onClickGitHubLoginButton() async {
  const String url = "https://github.com/login/oauth/authorize" +
      "?client_id=" + "1435bc0f9fcfa1003de3" +
      "&scope=public_repo%20read:user%20user:email";

  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    print("url not launching");
  }
}
