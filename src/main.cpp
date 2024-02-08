#include <iostream>
#include <fmt/format.h>
#include <ranges>
#include <array>
#include <vector>


int main(void) {
  auto showValues =
    [](auto& values, const std::string& message) {
      std::cout << fmt::format("{}: ", message);

      for (const auto& value : values) {
        std::cout << fmt::format("{} ", value);
      }

      std::cout << "\n";
    };


  std::vector<int> v = {0,1,8,3,4,5,6,7,8,9};

  auto vec = v | std::views::reverse | std::views::drop(2);

  std::cout << *vec.begin() << std::endl;

  return 0;
};
