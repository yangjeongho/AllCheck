import 'package:all_check/design_course/category_list_view.dart';
import 'package:all_check/design_course/chat_screen.dart';
import 'package:all_check/design_course/course_info_screen.dart';
import 'package:all_check/design_course/popular_course_list_view.dart';
import 'package:all_check/main.dart';
import 'package:flutter/material.dart';
import 'design_course_app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTestScreen extends StatefulWidget {
  @override
  _FirebaseTestScreenState createState() => _FirebaseTestScreenState();
}

class _FirebaseTestScreenState extends State<FirebaseTestScreen> {
  CategoryType categoryType = CategoryType.ui;

  final _authentication = FirebaseAuth.instance;

  String input = '';

  String userName = '';
  String userEmail = '';
  String userPassword = '';

  bool isSignupScreen = true;
  bool showprog = false;
  final _formKey = GlobalKey<FormState>();

  void _tryValidation(){
    final isValid = _formKey.currentState!.validate();
    if (isValid){
      _formKey.currentState!.save();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: DesignCourseAppTheme.nearlyWhite,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('로그인'),
        ),
        body: GestureDetector(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Stack(
              children: [
                //배경
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/login3.jpg'),
                          fit: BoxFit.fill),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 90, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '환영합니다.',
                                style: const TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 25,
                                    color: Colors.orangeAccent),
                                children: [
                                  TextSpan(
                                    text: isSignupScreen ? ' 회원가입!!' : ' 또 오셨군요',
                                    style: const TextStyle(
                                        letterSpacing: 1.0,
                                        fontSize: 25,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            isSignupScreen ? '회원가입 진행' : '로그인 진행',
                            style: const TextStyle(
                              letterSpacing: 1.0,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                //텍스트 폼 필드
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  top: 180,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    padding: const EdgeInsets.all(20.0),
                    height: isSignupScreen ? 280.0 : 250.0,
                    width: MediaQuery.of(context).size.width - 40,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 5)
                        ]),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 20),

                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = false;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen
                                            ? DesignCourseAppTheme.activeColor
                                            : DesignCourseAppTheme.textColor1,
                                      ),
                                    ),
                                    if (!isSignupScreen)
                                      Container(
                                        margin: const EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.orange,
                                      ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isSignupScreen = true;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'SiGNUP',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? DesignCourseAppTheme.activeColor
                                            : DesignCourseAppTheme.textColor1,
                                      ),
                                    ),
                                    if (isSignupScreen)
                                      Container(
                                        margin:const  EdgeInsets.only(top: 3),
                                        height: 2,
                                        width: 55,
                                        color: Colors.orange,
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          //회원가입 시작
                          if (isSignupScreen)
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      key: const ValueKey(1),
                                      validator: (value){
                                        if(value!.isEmpty || value.length < 4){
                                          return '4자리 이상 입력하세요';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userName = value!;
                                      },
                                      onChanged: (value){
                                        userName = value;
                                      },
                                      decoration: const InputDecoration(
                                          prefixIcon:   Icon(
                                            Icons.account_circle,
                                            color: DesignCourseAppTheme.iconColor,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          hintText: 'User Name',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: DesignCourseAppTheme.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      key: const ValueKey(2),
                                      validator: (value) {
                                        if(value!.isEmpty|| !value.contains('@')){
                                          return '유효한 메일 정보를 등록하세요.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userEmail = value!;
                                      },
                                      onChanged: (value){
                                        userEmail = value;
                                      },
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.email,
                                            color: DesignCourseAppTheme.iconColor,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          hintText: 'email',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: DesignCourseAppTheme.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      key: const ValueKey(3),
                                      validator: (value){
                                        if(value!.isEmpty|| value.length<6){
                                          return '패스워드은 6자리 이상이여야 합니다.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userPassword = value!;
                                      },
                                      onChanged: (value){
                                        userPassword = value;
                                      },
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.password,
                                            color: DesignCourseAppTheme.iconColor,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                    DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: DesignCourseAppTheme.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          //로그인 시작
                          if (!isSignupScreen)
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      key: const ValueKey(4),
                                      validator: (value){
                                        if(value!.isEmpty || value.length < 4){
                                          return '4자리 이상 입력하세요';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userName=value!;
                                      },
                                      onChanged: (value){
                                        userName = value;
                                      },
                                      decoration: const InputDecoration(
                                          prefixIcon:   Icon(
                                            Icons.account_circle,
                                            color: DesignCourseAppTheme.iconColor,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          hintText: 'User Name',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: DesignCourseAppTheme.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFormField(
                                      key: const ValueKey(5),
                                      validator: (value){
                                        if(value!.isEmpty|| value.length<6){
                                          return '패스워드은 6자리 이상이여야 합니다.';
                                        }
                                        return null;
                                      },
                                      onSaved: (value){
                                        userPassword = value!;
                                      },
                                      onChanged: (value){
                                        userPassword = value;
                                      },
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.password,
                                            color: DesignCourseAppTheme.iconColor,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color:
                                                DesignCourseAppTheme.textColor1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(35.0)),
                                          ),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: DesignCourseAppTheme.textColor1),
                                          contentPadding: EdgeInsets.all(10)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                //전송버튼
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  top: isSignupScreen ? 430.0 : 390,
                  right: 0,
                  left: 0,
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: GestureDetector(
                        onTap: () async{
                          setState(() {
                            showprog = true;
                          });

                          if(isSignupScreen){
                            _tryValidation();
                            try{
                              final newUser = await _authentication.createUserWithEmailAndPassword(
                                  email: userEmail,
                                  password: userPassword);


                              await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid)
                                  .set(
                                  {
                                    'userName': userName,
                                    'email': userEmail
                                  }
                              );

                              if (newUser.user != null){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context){
                                    return ChatScreen();
                                  }),
                                );

                              }

                             }catch(e){
                              print(e);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content:
                                    Text('패스워드와 이메일 정보를 확인 부탁드립니다.'),
                                    backgroundColor: Colors.blue,
                                ),
                              );
                            }
                          }else{
                            _tryValidation();

                            try {
                              final newUser = await _authentication.signInWithEmailAndPassword(
                                  email: userEmail,
                                  password: userPassword
                              );


                              if (newUser.user != null){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context){
                                    return ChatScreen();
                                  }),
                                );
                                setState(() {
                                  showprog = false;
                                });
                              }
                            } on Exception catch (e) {
                              print(e);
                            }

                          }

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.orange, Colors.red],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0, 1),
                                )
                              ]),
                          child: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //구글
                AnimatedPositioned(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                    top: isSignupScreen? MediaQuery.of(context).size.height - 175 :
                                         MediaQuery.of(context).size.height - 215 ,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: [
                        Text('or Sigup with'),
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              minimumSize: Size(155, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: DesignCourseAppTheme.googleColor),
                          icon: Icon(Icons.add),
                          label: Text('Google'),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),

    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Category',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(CategoryType.ui, categoryType == CategoryType.ui),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.coding, categoryType == CategoryType.coding),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.basic, categoryType == CategoryType.basic),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        CategoryListView(
          callBack: () {
            moveTo();
          },
        ),
      ],
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Popular Course',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: DesignCourseAppTheme.darkerText,
            ),
          ),
          Flexible(
            child: PopularCourseListView(
              callBack: () {
                moveTo();
              },
            ),
          )
        ],
      ),
    );
  }

  void moveTo() {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.ui == categoryTypeData) {
      txt = 'Ui/Ux';
    } else if (CategoryType.coding == categoryTypeData) {
      txt = 'Coding';
    } else if (CategoryType.basic == categoryTypeData) {
      txt = 'Basic UI';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected
                ? DesignCourseAppTheme.nearlyBlue
                : DesignCourseAppTheme.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: DesignCourseAppTheme.nearlyBlue)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected
                        ? DesignCourseAppTheme.nearlyWhite
                        : DesignCourseAppTheme.nearlyBlue,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: const TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: DesignCourseAppTheme.nearlyBlue,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Search for course',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 18),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  'Choose your',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: DesignCourseAppTheme.grey,
                  ),
                ),
                Text(
                  'Design Course',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: DesignCourseAppTheme.darkerText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset('assets/design_course/userImage.png'),
          )
        ],
      ),
    );
  }
}

enum CategoryType {
  ui,
  coding,
  basic,
}
