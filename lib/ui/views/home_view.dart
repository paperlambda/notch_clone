import 'package:flutter/material.dart';
import 'package:notch_clone/core/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getFeaturedNews();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Featured', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
            Container(
              height: 220,
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 8,),
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 18,);
                },
                itemCount: viewModel.featuredNews.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(image: NetworkImage(viewModel.featuredNews[index].thumbnail, ), fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${viewModel.featuredNews[index].category}'),
                              Text('${viewModel.featuredNews[index].title}', overflow: TextOverflow.ellipsis, maxLines: 2,),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Text('Recent', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              height: 500,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(viewModel.featuredNews.length, (index){
                    final news = viewModel.featuredNews[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(news.title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis, maxLines: 2),
                                SizedBox(height: 4),
                                Text(news.content, style: TextStyle(fontSize: 12, color: Colors.grey), overflow: TextOverflow.ellipsis, maxLines: 3),
                              ],
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(image: NetworkImage(news.thumbnail), fit: BoxFit.cover),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
          child: HomePage(),
        ),
    );
  }
}