// import 'package:flutter/material.dart';
// // import 'package:your_app_name/responsive_button.dart';
//
// class ResponsiveSignupPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Welcome to iDealMart',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               decoration: const InputDecoration(
//                 labelText: 'Full Name',
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 labelText: 'Phone Number',
//                 prefixIcon: Icon(Icons.phone),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Retype Password',
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Postal Code',
//                 prefixIcon: Icon(Icons.location_on),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             // Add checkbox for terms and conditions if needed
//           ],
//         ),
//       ),
//     );
//   }
// }