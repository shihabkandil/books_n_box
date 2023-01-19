import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyShelfScreen extends StatelessWidget {
  const MyShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              localization!.myshelf,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width / 3.5,
                        margin: EdgeInsets.only(left: 15, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/bilalprofile.jpg"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text(
                                  "Book Name",
                                  style: TextStyle(fontSize: 15, color: Theme.of(context).backgroundColor, fontFamily: 'Poppins'),
                                ),
                                Text(
                                  "Author: JK.rowling",
                                  style: TextStyle(fontSize: 14, color: Theme.of(context).backgroundColor, fontFamily: 'Poppins'),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "here we write the book desciptiondsadasdasdasdasdaaaaaaaaaaaaaaaaaaaaa",
                                  style: TextStyle(fontSize: 12, color: Theme.of(context).backgroundColor),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "4/5",
                                      style: TextStyle(fontSize: 12, color: Colors.orangeAccent),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.orangeAccent,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite),
                                      iconSize: 24,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
