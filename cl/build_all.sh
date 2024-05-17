#!/bin/bash

current_dir=$(pwd)

for dir in */; do
    if [[ "$dir" != "CMakeFiles/" ]]; then
        cd "$dir"
        # 如果cuda目录有改变的话
        find . -type f -name "CMakeLists.txt" -exec sed -i 's/\/usr\/local\/cuda/\/usr\/lib\/cuda/g' {} +
        mkdir -p build
        cd build
        cmake ..
        make
        cd ../..
    fi
done

cd "$current_dir"
