#include <iostream>
#include <ranges>
#include <array>
#include <vector>


int main(void) {


  std::vector<int> v = {0,1,8,3,4,5,6,7,8,9};

  auto vec = v | std::views::reverse | std::views::drop(2);

  std::cout << *vec.begin() << std::endl;

  return 0;
};
