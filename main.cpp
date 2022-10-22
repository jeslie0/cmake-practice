#include <iostream>
#include <adder.h>
#include <fmt/format.h>



int main(void) {
  std::cout << add(72.1f, 45.3f) << std::endl;
  std::cout << "Hello World!" << std::endl;
  std::cout << fmt::format("{} says hello!", "James") << std::endl;


  return 0;
}
