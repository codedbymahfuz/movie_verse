import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

     final serchBoxColor = Color(0xFF5B6270);
    return Column(
      
      children: [

        const SizedBox(height: 18),

        Center(
          child: ConstrainedBox(constraints: BoxConstraints(
            maxWidth: 350
          ),
           child: _searchingBoxText(serchBoxColor),
                ),
        ),

        const SizedBox(height: 30),

        const Text("No Data Found",
          style: TextStyle(
            fontSize: 15,
            color: Color(0xFF5B6270)
          ),
         )



      ],
    );
  }

  Widget _searchingBoxText(Color searchTextColor) {
    return Center(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF0D0F14),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFF5B6270)
          )
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
             Icon(Icons.search, color: searchTextColor ),
      
            const SizedBox(width: 10),
      
            Expanded(
              child: TextField(
                cursorColor: searchTextColor ,
                 style:  TextStyle(
                 color: searchTextColor,
                ),
                decoration: InputDecoration(
                  hintText: "Search movie and tv series...",
                  hintStyle: TextStyle(
                    color: searchTextColor,
                    fontSize: 14
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
      
             const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
