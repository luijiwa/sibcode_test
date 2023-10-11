import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sibcode_test/widgets/news_list/news_list_widget_model.dart';

class NewsListWidget extends StatefulWidget {
  const NewsListWidget({super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<NewsListWidgetModel>().loadNews());
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsListWidgetModel>(context).newsList;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.go('/login'),
            icon: const Icon(Icons.account_circle_outlined),
          ),
          title: const Text('Media'),
          centerTitle: true),
      body: newsProvider.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.only(left: 16, right: 18, bottom: 21),
              itemExtent: 300,
              itemCount: newsProvider.length,
              itemBuilder: (BuildContext context, int index) {
                return _NewsListRowWidget(index: index);
              }),
    );
  }
}

class _NewsListRowWidget extends StatelessWidget {
  const _NewsListRowWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsListWidgetModel>(context).newsList;
    final news = newsProvider[index];
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.date,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Image.network(
              'https://webstripe.ru/upload/resize_cache/webp/iblock/adf/l1wj3m728itvinqpxmexcy4npleflcx6/Frame-7.webp',
            ),
            const SizedBox(height: 6),
            Expanded(
              child: Text(
                news.name,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 21),
          ],
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.goNamed(
                'details',
                extra: newsProvider[1],
              );
            },
          ),
        ),
      ],
    );
  }
}
