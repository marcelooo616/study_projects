import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/src/models/class/product.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({Key? key}) : super(key: key);

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _priceFocus = FocusNode();
  final _descriptionFocus = FocusNode();
  final _imageUrlFocus = FocusNode();
  final _imageUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();
  
  @override
  void initState() {
    super.initState();
    _imageUrlFocus.addListener(updateImage);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _priceFocus.dispose();
    _descriptionFocus.dispose();
    _imageUrlFocus.removeListener(updateImage);
    _imageUrlFocus.dispose();

  }

  void updateImage(){
    setState(() {

    });
  }

  bool isValidImageUrl(String url){
    bool isValidUrl = Uri.tryParse(url)?.hasAbsolutePath ?? false;
    bool endsWithFile =  url.toLowerCase().endsWith('.png') ||
    url.toLowerCase().endsWith('.jpg') ||
    url.toLowerCase().endsWith('.jpeg');

    return isValidUrl && endsWithFile;
  }

  void _submitForm(){
    final isValid = _formKey.currentState?.validate() ?? false;

    if(!isValid){
      return;
    }
    _formKey.currentState?.save();
    final newProduct = Product(
        id: Random().nextDouble().toString(),
        name: _formData['name'] as String,
        description: _formData['description'] as String,
        price: _formData['price'] as double,
        imageUrl: _formData['imageUrl'] as String,
    );


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Produto'),
        actions: [
          IconButton(onPressed: _submitForm, icon: Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next ,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocus);
                },
                onSaved: (name) => _formData['name'] = name ?? '',
                validator: (_name){
                  final name = _name ?? '';
                  if(name.trim().isEmpty){
                    return 'Nome e obrigatorio';
                  }
                  if(name.trim().length < 3 ){
                    return 'Nome precisa no minimo de 3 letras';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Preço'),
                textInputAction: TextInputAction.next,
                focusNode: _priceFocus,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocus);
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSaved: (price) => _formData['price'] = double.parse(price!) ?? '',
                validator: (_price){
                  final priceString = _price ?? '-1';
                  final price = double.tryParse(priceString) ?? -1;

                  if(price <= 0){
                    return 'Informe um preço valido!';
                  }
                  return null;
                },


              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                textInputAction: TextInputAction.next,
                focusNode: _descriptionFocus,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_imageUrlFocus);
                },
                onSaved: (description) => _formData['description'] = description ?? '',
                validator: (_description){
                  final name = _description ?? '';
                  if(name.trim().isEmpty){
                    return 'Descrição  e obrigatorio';
                  }
                  if(name.trim().length < 10 ){
                    return 'Nome precisa no minimo de 3 letras';
                  }
                  return null;
                },

              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _imageUrlController,
                      decoration: InputDecoration(labelText: 'Url da Imagem'),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.url,
                      focusNode: _imageUrlFocus,
                      onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (imageUrl) => _formData['imageUrl'] = imageUrl ?? '',
                      validator: (_imageUrl) {
                        final imageUrl = _imageUrl ?? '';
                        if(!isValidImageUrl(imageUrl)) {
                          return 'Informe uma url valida!';
                        }
                      },

                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(top: 10, left: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    alignment: Alignment.center,
                    child: _imageUrlController.text.isEmpty
                        ? Text('Informe a Url')
                        : FittedBox(
                      child: Image.network(_imageUrlController.text),
                      fit: BoxFit.cover,
                    )
                  )
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
