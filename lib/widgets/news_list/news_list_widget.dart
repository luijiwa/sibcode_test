import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sibcode_test/widgets/news_list/news_list_widget_model.dart';

class NewsListWidget extends StatelessWidget {
  const NewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsListWidgetModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle_outlined),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.only(left: 16, right: 18),
          itemExtent: 277,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '10.05.2023',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Image.network(
                      'https://webstripe.ru/upload/resize_cache/webp/iblock/adf/l1wj3m728itvinqpxmexcy4npleflcx6/Frame-7.webp',
                    ),
                    const Text(
                      'Зачем продлять лицензию 1С-Битрикс',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                  ],
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => newsProvider.getHttp(),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
