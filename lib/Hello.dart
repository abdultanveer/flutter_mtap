Future<String> createOrderMessage() async {

  print('first instruction --createOrderMessage');
  var order = await fetchUserOrder();
  print('last instruction --createOrderMessage');
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
  // Imagine that this function is
// more complex and slow.
  print('first instruction --fetchUserOrder');

   return Future.delayed(
    const Duration(seconds: 2),
        () => 'Large Latte',
  );
}

Future<void> main() async {
  print('Fetching user order...');
  print(await createOrderMessage());
}