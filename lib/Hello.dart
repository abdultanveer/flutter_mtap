void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
  }
  var result = fibonacci(20);
  print(result);

}
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

