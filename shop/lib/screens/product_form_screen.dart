import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/item.dart';
import 'package:shop/providers/product_provider.dart';

class ProductFormScreen extends StatefulWidget {
  const ProductFormScreen({Key? key}) : super(key: key);

  @override
  _ProductFormScreenState createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _data = {
    'name': '',
    'price': '',
    'image': '',
  };

  void _handleSubmit(context) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;
    _formKey.currentState!.save();
    _formKey.currentState!.reset();

    Item newItem = Item(
      name: _data['name']!,
      image: _data['image']!,
      price: double.parse(_data['price']!),
    );

    Provider.of<ProductProvider>(context, listen: false).addItem(newItem);

    // Show snackbar
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Product successfuly created.')));

    // Navigator
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Form'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Product name'),
                    ),
                    validator: (value) => value?.isEmpty ?? true
                        ? 'Product name is required'
                        : null,
                    onSaved: (value) {
                      _data['name'] = value ?? '';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text('Price'),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (value) {
                      _data['price'] = value ?? '';
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, right: 8),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black54,
                            width: .5,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: Text('Image URL'),
                          ),
                          keyboardType: TextInputType.url,
                          onSaved: (value) {
                            _data['image'] = value ?? '';
                          },
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                      ),
                      onPressed: () => _handleSubmit(context),
                      child: Text('Save'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
