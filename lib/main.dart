import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubits/post_fetch_cubit.dart';
import 'package:todo_cubit/repository/api_repository.dart';
import 'package:todo_cubit/screens/home_screens.dart';
import 'package:todo_cubit/service/api_service.dart';

void main() {
  runApp(MyApp(apiService: ApiService(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(apiRepository: ApiRepository(apiService: apiService),)..fetchPostApiData(),),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreens(),
      ),
    );
  }
}

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({Key? key}) : super(key: key);

  @override
  State<BarcodeScreen> createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: BarcodeWidget(
                  barcode: Barcode.code128(useCode128B: true),
                  data: '9961424575',
                  height: 200,
                  width: 200,
                  drawText: true,
                  backgroundColor: Colors.grey,
                  textPadding: 10,
                  color: Colors.yellow,
                  padding: EdgeInsets.all(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
