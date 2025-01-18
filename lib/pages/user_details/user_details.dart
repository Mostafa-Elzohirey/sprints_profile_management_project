// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sprints_profile_management_project/pages/user_details/edit_user.dart';
// import 'package:sprints_profile_management_project/utils/theme/theme.dart';
// import 'package:sprints_profile_management_project/utils/theme/theme_provider.dart';
// import 'package:sprints_profile_management_project/utils/navigation.dart';
// import 'package:sprints_profile_management_project/utils/widgets/custom_text_form_feild.dart';

// class UserDetails extends StatefulWidget {
//   const UserDetails({super.key});

//   @override
//   State<UserDetails> createState() => _UserDetailsState();
// }

// class _UserDetailsState extends State<UserDetails> {
//   bool click = true;
//   //final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           toolbarHeight: MediaQuery.of(context).size.height * 0.1,
//           leading: IconButton(
//               onPressed: () {
//                 context.pop();
//               },
//               style: IconButton.styleFrom(
//                   shape: CircleBorder(), backgroundColor: Colors.white),
//               icon: Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               )),
//           title: Text(
//             "Name",
//             style: TextStyle(
//                 fontSize: MediaQuery.of(context).size.height * 0.04,
//                 fontWeight: FontWeight.bold,
//                 color: Theme.of(context).colorScheme.primary),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   Provider.of<ThemeProvider>(context, listen: false)
//                       .toggleTheme();
//                   setState(() {});
//                 },
//                 icon: Icon(
//                     Provider.of<ThemeProvider>(context, listen: false)
//                                 .themeData ==
//                             lightMode
//                         ? Icons.light_mode
//                         : Icons.dark_mode,
//                     color: Theme.of(context).colorScheme.primary))
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.only(
//             top: 20,
//           ),
//           child: ListView(
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               // Form(
//               //     key: _formKey,
//               // child:
//               Column(children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: CustomTextFormField(
//                     decoration: InputDecoration(
//                         labelText: "Name",
//                         labelStyle: const TextStyle(
//                           color: Color.fromARGB(255, 162, 162, 162),
//                         )),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.5,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: TextFormField(
//                           decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   width: 1, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   width: 2, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                               ),
//                               labelText: "Phone",
//                               labelStyle: const TextStyle(
//                                 color: Color.fromARGB(255, 162, 162, 162),
//                               )),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.5,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: TextFormField(
//                           controller: ageController,
//                           // validator: (value) {
//                           //   if (value == null || value.isEmpty) {
//                           //     return "Please enter your age";
//                           //   }
//                           //   return null;
//                           // },
//                           decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   width: 1, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   width: 2, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                               ),
//                               labelText: "Age",
//                               labelStyle: const TextStyle(
//                                 color: Color.fromARGB(255, 162, 162, 162),
//                               )),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: TextFormField(
//                     controller: emailController,
//                     // validator: (value) {
//                     //   if (value == null || value.isEmpty) {
//                     //     return "Please enter your name";
//                     //   }
//                     //   if (!isEmailValid(value)) {
//                     //     return 'Please enter a valid email address';
//                     //   }
//                     //   return null;
//                     // },
//                     decoration: InputDecoration(
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                             width: 1, //<-- SEE HERE
//                             color: Color(0xFF979797),
//                           ),
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: const BorderSide(
//                             width: 2, //<-- SEE HERE
//                             color: Color(0xFF979797),
//                           ),
//                         ),
//                         labelText: "Email",
//                         labelStyle: const TextStyle(
//                           color: Color.fromARGB(255, 162, 162, 162),
//                         )),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: TextFormField(
//                           // controller: address_controller,
//                           // validator: (value) {
//                           //   if (value == null || value.isEmpty) {
//                           //     return "Please enter your address";
//                           //   }
//                           //   return null;
//                           // },
//                           decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   width: 1, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   width: 2, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                               ),
//                               labelText: "gender",
//                               labelStyle: const TextStyle(
//                                 color: Color.fromARGB(255, 162, 162, 162),
//                               )),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width * 0.6,
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: TextFormField(
//                           controller: addressController,
//                           // validator: (value) {
//                           //   if (value == null || value.isEmpty) {
//                           //     return "Please enter your address";
//                           //   }
//                           //   return null;
//                           // },
//                           decoration: InputDecoration(
//                               enabledBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                   width: 1, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                                 borderRadius: BorderRadius.circular(10.0),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 borderSide: const BorderSide(
//                                   width: 2, //<-- SEE HERE
//                                   color: Color(0xFF979797),
//                                 ),
//                               ),
//                               labelText: "Address",
//                               labelStyle: const TextStyle(
//                                 color: Color.fromARGB(255, 162, 162, 162),
//                               )),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.3,
//                 ),
//                 SizedBox(
//                     width: 200,
//                     height: 50,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           // styling the button

//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           padding: const EdgeInsets.all(10),
//                           backgroundColor: Color(0xFF646464), // Button color
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => EditUser()));
//                         },
//                         child: Center(
//                           child: Row(
//                             children: [
//                               Text(
//                                 "Go To Edit ",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontSize: 15, color: Colors.white),
//                               ),
//                               Icon(
//                                 Icons.arrow_forward,
//                                 color: Colors.white,
//                               )
//                             ],
//                           ),
//                         ))),
//               ]),
//             ],
//           ),
//         ));
//   }
// }
