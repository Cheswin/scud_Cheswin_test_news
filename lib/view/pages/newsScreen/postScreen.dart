import 'package:flutter/material.dart';
import 'package:news_app_test/view/pages/newsScreen/newsScreenProvider.dart';
import 'package:provider/provider.dart';

import '../../../models/newsModel.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<Newsprovider>(builder: (context, newsprovider, child) {
          List<NewsModel> ListItem = newsprovider.list;
          return newsprovider.isloading == true
              ? Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ))
              : newsprovider.Error == 'yes'
                  ? Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 30,
                          ),
                          Text(
                            "something went wrong",
                            style: TextStyle(fontSize: 40),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.blue,
                      onRefresh: () {
                        return newsprovider.getnewsaData();
                      },
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: newsprovider.list.length,
                          itemBuilder: (context, index) {
                            return Container(
                                // color: Colors.red,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.5,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: ListItem[index].urlToImage ==
                                                    null
                                                ? NetworkImage(
                                                    "https://img.freepik.com/free-vector/breaking-news-information-concept_52683-36243.jpg?w=900&t=st=1714426982~exp=1714427582~hmac=1495de0bb9c0ed92dad437a316c4ecefb84cca55ddd83474a64e655bd36e7446")
                                                : NetworkImage(ListItem[index]
                                                    .urlToImage
                                                    .toString())),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              ListItem[index].title.toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "-${ListItem[index].author}",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              ListItem[index]
                                                  .description
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Text(
                                              ListItem[index].source.toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "more details",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Text(
                                            ListItem[index]
                                                .publishedAt
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          }),
                    );
        }),
      ),
    );
  }
}
