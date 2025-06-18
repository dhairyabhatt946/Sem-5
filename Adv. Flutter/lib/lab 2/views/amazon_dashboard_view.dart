import '../../utils/import_export.dart';

class AmazonDashboardView extends StatefulWidget {
  const AmazonDashboardView({super.key});

  @override
  State<AmazonDashboardView> createState() => _AmazonDashboardViewState();
}

class _AmazonDashboardViewState extends State<AmazonDashboardView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Amazon Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: 'Search Amazon.in',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Delivering to Junagadh 362001 - Update location',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.network(
                          'https://5.imimg.com/data5/PX/WQ/MN/SELLER-38271709/mobile-1000x1000.png',
                          width: 60,
                          height: 60,
                        ),
                        Text('Mobiles'),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.network(
                          'https://images.pexels.com/photos/1040945/pexels-photo-1040945.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          width: 60,
                          height: 60,
                        ),
                        Text('Fashion'),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.network(
                          'https://media.istockphoto.com/id/164981421/photo/large-group-of-food-shoot-on-white-backdrop.jpg?s=2048x2048&w=is&k=20&c=9-Xz7knQrsNF71_4Bwpmtqee-y_ll7k8OlxIEU6-WFg=',
                          width: 60,
                          height: 60,
                        ),
                        Text('Groceries'),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.network(
                          'https://play-lh.googleusercontent.com/IwEHGY0XX8lSE4vO_yLWvCgDTWI_Kd7JX8I0xozYaTRm9MpKtlv8TJ9EqIcLf7HqpErA=w480-h960-rw',
                          width: 60,
                          height: 60,
                        ),
                        Text('MX Player'),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.network(
                          'https://media.istockphoto.com/id/178716575/photo/mobile-devices.jpg?s=2048x2048&w=is&k=20&c=Cc9N45Rt_wPk2JGw5NfJk573fGvseA1uKCWFbnk-Wtk=',
                          width: 60,
                          height: 60,
                        ),
                        Text('Electronics'),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.network(
                          'https://media.istockphoto.com/id/655998316/photo/stack-of-multi-colored-books-on-blue-background.jpg?s=2048x2048&w=is&k=20&c=mlKjPlWMMik7dNRZ3kHKDPmMmHxIWuVKMGaUs8z6LUk=',
                          width: 60,
                          height: 60,
                        ),
                        Text('Books'),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Image.network(
                          'https://media.istockphoto.com/id/530809521/photo/medicine-pills.jpg?s=2048x2048&w=is&k=20&c=T6RxalhrcHeYdMx60i740EJ_gm1zLAADoVH4CX3P930=',
                          width: 60,
                          height: 60,
                        ),
                        Text('Medicines'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 🔵 Only this section has background image using Stack
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://st2.depositphotos.com/3102403/8723/v/950/depositphotos_87232620-stock-illustration-thin-line-retail-e-commerce.jpg',
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(top: 270),
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          child: Image.network('https://media.licdn.com/dms/image/v2/D4D12AQG0NMBwOtr-IA/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1712297539871?e=2147483647&v=beta&t=E-ccKcy0Sr4Nz5NqcEM0sW70Pc6w-tB1_PucQjjN3OM'),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          child: Image.network('data:image/jpeg;base64,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'),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          child: Image.network('data:image/jpeg;base64,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'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart), label: ''),
      ]),
    );
  }
}
