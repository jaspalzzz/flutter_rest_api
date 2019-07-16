import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/BeerModel.dart';
import 'package:flutter_rest_api/network/EndPoints.dart';

import 'model/BeerListModel.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Future object to fetch response from API (Response in future)
  Future<BeerListModel> beerListFuture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<BeerListModel>(
              future: beerListFuture,
              builder: (context, snapshot) {
                // to show progress loading view add switch statment to handle connnection states.
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    {
                      // here we are showing loading view in waiting state.
                      return loadingView();
                    }
                  case ConnectionState.active:
                    {
                      break;
                    }
                  case ConnectionState.done:
                    {
                      // in done state we will handle the snapshot data.
                      // if snapshot has data show list else set you message.
                      if (snapshot.hasData) {
                        // hasdata same as data!=null
                        if (snapshot.data.beerList != null) {
                          if (snapshot.data.beerList.length > 0) {
                            // here inflate data list
                            return ListView.builder(
                                itemCount: snapshot.data.beerList.length,
                                itemBuilder: (context, index) {
                                  return generateColum(
                                      snapshot.data.beerList[index]);
                                });
                          } else {
                            // display message for empty data message.
                            return noDataView("No data found");
                          }
                        } else {
                          // display error message if your list or data is null.
                          return noDataView("No data found");
                        }
                      } else if (snapshot.hasError) {
                        // display your message if snapshot has error.
                        return noDataView("Something went wrong");
                      } else {
                        return noDataView("Something went wrong");
                      }
                      break;
                    }
                  case ConnectionState.none:
                    {
                      break;
                    }
                }
              }),
        ));
  }

  // Here we created row for the bear list.
  Widget generateColum(BeerModel item) => Card(
        child: ListTile(
          leading: Image.network(item.imageUrl),
          title: Text(
            item.name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          subtitle:
              Text(item.tagline, style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      );

  // Progress indicator widget to show loading.
  Widget loadingView() => Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.red,
        ),
      );

  // View to empty data message
  Widget noDataView(String msg) => Center(
        child: Text(
          msg,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      );

  @override
  void initState() {
    // here first we are checking network connection
    isConnected().then((internet) {
      if (internet) {
        // set state while we fetch data from API
        setState(() {
          // calling API to show the data
          // you can also do it with any button click.
          beerListFuture = getBeerListData();
        });
      } else {
        /*Display dialog with no internet connection message*/
      }
    });
    super.initState();
  }
}
