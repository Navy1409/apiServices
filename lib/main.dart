import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/post_bloc.dart';
import 'bloc/post_event.dart';
import 'bloc/post_state.dart';
import 'screen/audio_player_screen.dart';
import 'screen/form_screen.dart';
import 'screen/post_detail_screen.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PostBloc(ApiService())..add(FetchPosts()),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    PostsScreen(),
    AudioPlayerScreen(),
    FormScreen()
  ];

  // Method to change selected index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Audio Player',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_left_sharp),
            label: 'Form Screen',
          ),
        ],
        backgroundColor:Color(0xff0e1324) ,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),

    );
  }
}

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("POSTS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      backgroundColor: Color(0xff0e1324),),
      backgroundColor: Color(0xff0e1324),
      body:  BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return Card(
                    color: Color.fromRGBO(3, 51, 84, 0.7),
                  
                  margin: EdgeInsets.all(8.0),
                  child: Container(
                    height: 140,
                    child: ListTile(
                      title: Text(post.title,maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color: Color.fromRGBO(245, 144, 29,0.9))),
                      subtitle: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                          // color: Color.fromRGBO(255, 255, 255, 0.8),
                        ),
                        margin: EdgeInsets.only(top: 15, bottom: 0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                          child: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(
                            fontSize: 16,
                            color:  Color.fromRGBO(252, 244, 235,0.9),
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailScreen(post: post),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.error));
          }
          return Center(child: Text('No Data Available'));
        },
      ),
    );
  }
}
