g++ -std=c++17 -Wshadow -Wall -o ${1%.cpp} "$1" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
./${1%.cpp}
