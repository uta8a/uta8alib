# TodoList
- library fileの生成 commandline toolの作成
- ngtkanaさん https://github.com/ngtkana/ngtlib/blob/master/make_snippet.sh のように、cargoを使おう。gitmoduleを使う

# 考えていること
- ディレクトリ構成
```
- src
    - rust
        - mod/main.rs
    - cpp
    - python
- .ci-config-file
- test
    - rust
        - testcase
        - verify
    - cpp
        - testcase
        - verify
- docs-out # satysfiのdockerを使ってpdf出力したい
- LICENSE # MIT
- generate-html # netlifyにデプロイする
```
- ファイル名は面倒なのですべてmain.rs, main.cppにしたい
- src/rust/template/main.rsのように分野別はなくして、一同に作る。tagをコメントにつける。tagでhtmlの方から検索できるようにする。
```
// name   : kaito_tateyama (uta8a)
// tag    : "Number Theory", "Geometry"
// comment: 使い方をここに書く

fn func(a:i32) -> i32 {
    a
}
```
