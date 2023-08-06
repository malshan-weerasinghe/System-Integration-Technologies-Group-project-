import 'home_page.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  String deliveryType = ''; // Selected delivery type
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Position? _position;
  TextEditingController _addressController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }
void _getLocation() async {
  Position? position = await _determinePosition();
  if (position != null) {
    setState(() {
      _position = position;
    });
    print(position);
  } else {
    // Handle the case when the position is null (permission denied or not available)
    // For example, you can show an error message or perform alternative logic.
    print('Unable to get the current position.');
  }
}
