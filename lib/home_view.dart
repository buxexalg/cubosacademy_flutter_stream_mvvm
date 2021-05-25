import 'package:flutter/material.dart';
import 'package:streamexample/viewmodel.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: StreamBuilder<List<int>>(
                    stream: viewModel.streamLista.stream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.active) {
                        return CircularProgressIndicator();
                      }

                      if (snapshot.hasData) {
                        var array = snapshot.data ?? [];
                        return ListView.builder(
                          itemCount: array.length,
                          itemBuilder: (context, index) {
                            if (index % 20 == 15) {
                              viewModel.loadLista();
                            }
                            return Center(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: 100,
                                height: 30,
                                child: Center(child: Text('$index')),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)),
                              ),
                            );
                          },
                        );
                      }
                      return CircularProgressIndicator();
                    }),
              ),
            ),
            Container(
              height: 50,
              color: Colors.black,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    viewModel.loadLista();
                  });
                },
                child: Text('Load'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
