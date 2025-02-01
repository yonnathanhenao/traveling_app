part of '../../ui.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
      ),
      body: Center(
        child: FutureProvider<List<String>>(
          initialData: [],
          create: (context) => context.read<HomeViewModel>().load(),
          child: Consumer<List<String>>(
            builder: (context, items, _) {
              if (items.isEmpty) return const CircularProgressIndicator();
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => Text(items[index]),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
