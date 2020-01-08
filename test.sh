#!/bin/sh
if ! ls | grep "rust-test";then
    cargo new rust-test --lib
fi

echo "" > "rust-test/src/lib.rs"
for lib_name in `ls src/rust`;do
    cat "src/rust/${lib_name}/main.rs" "test/rust/${lib_name}/main.rs" > "rust-test/src/${lib_name}.rs"
    echo "pub mod ${lib_name};" >> "rust-test/src/lib.rs"
done



cd "rust-test"
cargo test