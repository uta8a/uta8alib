#!/bin/sh
set -eu
SCRIPT_DIR=$(dirname "$0")
WD=$(pwd)

if ! ls | grep "rust-test";then
    cargo new rust-test --lib
fi

# rust test
echo "" > "rust-test/src/lib.rs"
for lib_name in `ls src/rust`;do
    cat "src/rust/${lib_name}/main.rs" "test/rust/${lib_name}/main.rs" > "rust-test/src/${lib_name}.rs"
    echo "pub mod ${lib_name};" >> "rust-test/src/lib.rs"
done
cd "rust-test"
cargo test
cd ${WD}

# cpp test
# if ls | grep "cpp-test";then
#     rm -rf cpp-test
# fi
mkdir -p cpp-test
cd cpp-test
cmake ..
make -j10
# ctest --verbose
make test -j10
cd ${WD}
