import 'package:api_service/models/post_model.dart';
import 'package:flutter/material.dart';


class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0e1324),
      appBar: AppBar(
        title: Text(
          'Post Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0xff0e1324),
        iconTheme: IconThemeData(
          color: Colors.white, // Set the color of the back button to white
        ),
      ),

      body: Container(
        decoration: BoxDecoration(color:  Color.fromRGBO(3, 51, 84, 0.7),
          borderRadius: BorderRadiusDirectional.horizontal(start: Radius.circular(20), end: Radius.circular(20))
        ),
        margin: EdgeInsets.only(top: 30),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(245, 144, 29,0.9)
                ),
              ),
              SizedBox(height: 16),
              Text(
                post.body,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromRGBO(252, 244, 235,0.9),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Post ID: ${post.id}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color:Color.fromRGBO(252, 244, 235,0.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
