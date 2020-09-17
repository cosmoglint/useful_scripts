#$filename = "$1"
#$compiledname = "${filename%.*}"

#echo ${1%.cpp}

g++ -std=c++17 -Wshadow -Wall -o ${1%.cpp} "$1" -O2 -Wno-unused-result
