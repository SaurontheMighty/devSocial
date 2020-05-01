import 'package:devsocial/paths/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uni_links/uni_links.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  
}
//aaaa
class _LoginState extends State<Login> {
  StreamSubscription _subs;
  @override
  void initState() {
    _initDeepLinkListener();
    super.initState();
  }

  @override
  void dispose() {
    _disposeDeepLinkListener();
    super.dispose();
  }

  void _initDeepLinkListener() async {
    _subs = getLinksStream().listen((String link) {
      _checkDeepLink(link);
    }, cancelOnError: true);
  }

  void _checkDeepLink(String link) {
    if (link != null) {
      String code = link.substring(link.indexOf(RegExp('code=')) + 5);
      loginWithGitHub(code)
        .then((firebaseUser) {
          print("LOGGED IN AS: " + firebaseUser.displayName);
        }).catchError((e) {
          print("LOGIN ERROR: " + e.toString());
        });
    }
  }

  void _disposeDeepLinkListener() {
    if (_subs != null) {
      _subs.cancel();
      _subs = null;
    }
  }
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

Future<FirebaseUser> loginWithGitHub(String code) async {
  //ACCESS TOKEN REQUEST
  final response = await http.post(
    "https://github.com/login/oauth/access_token",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: jsonEncode(GitHubLoginRequest(
      clientId: '09d4b0be03944d6c900c',
      clientSecret: 'd6d98a0eb872d2413727ee1ba734157b387f8e00',
      code: code,
    )),
  );

  GitHubLoginResponse loginResponse =
      GitHubLoginResponse.fromJson(json.decode(response.body));

  //FIREBASE STUFF
  final AuthCredential credential = GithubAuthProvider.getCredential(
    token: loginResponse.accessToken,
  );

FirebaseUser firebaseUser = (
  await FirebaseAuth.instance.signInWithCredential(credential)
).user;
return firebaseUser;
}

// ...
//GITHUB REQUEST-RESPONSE MODELS
class GitHubLoginRequest {
  String clientId;
  String clientSecret;
  String code;

  GitHubLoginRequest({this.clientId, this.clientSecret, this.code});

  dynamic toJson() => {
        "client_id": clientId,
        "client_secret": clientSecret,
        "code": code,
      };
}

class GitHubLoginResponse {
  String accessToken;
  String tokenType;
  String scope;

  GitHubLoginResponse({this.accessToken, this.tokenType, this.scope});

  factory GitHubLoginResponse.fromJson(Map<String, dynamic> json) =>
      GitHubLoginResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        scope: json["scope"],
      );
}

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
      "?client_id=09d4b0be03944d6c900c" +
      "&scope=public_repo%20read:user%20user:email";

  if (await canLaunch(url)) {
    await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    );
  } else {
    print("CANNOT LAUNCH THIS URL!");
  }
}