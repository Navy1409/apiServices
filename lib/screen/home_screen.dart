// import 'package:api_service/screen/post_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/item_bloc.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Items List')),
//       body: BlocBuilder<ItemBloc, ItemState>(
//         builder: (context, state) {
//           if (state is ItemLoading) {
//             return Center(child: CircularProgressIndicator());
//           } else if (state is ItemLoaded) {
//             return ListView.builder(
//               itemCount: state.items.length,
//               itemBuilder: (context, index) {
//                 final item = state.items[index];
//                 return ListTile(
//                   title: Text(item.title),
//                   subtitle: Text(item.description),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ItemDetailScreen(item: item),
//                       ),
//                     );
//                   },
//                 );
//               },
//             );
//           } else if (state is ItemError) {
//             return Center(child: Text('Failed to load items'));
//           }
//           return Center(child: Text('No items found.'));
//         },
//       ),
//     );
//   }
// }
